//push notification

$( document ).ready(function() {

	const applicationServerPublicKey = 'BL6XhB0a6s7dImnbSM6qW3iZCg1_JeWLg6MWUb5K0rQndOC8r9saZxsjnz7dOr2jkWEy7trg2cRbUqWbYblJJDc';
	const pushButton = document.querySelector('#btn_notification');
	const isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);

	function generateString(length){
		var result= '';
		var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		var charactersLength = characters.length;;
		for( var i = 0; i < length; i++ ){
		result += characters.charAt(Math.floor(Math.random() * charactersLength));
		}
		return result;
	}

	function urlBase64ToUint8Array(base64String) {
		const padding = '='.repeat((4 - (base64String.length % 4)) % 4);
		const base64 = (base64String + padding).replace(/\-/g, '+').replace(/_/g, '/');
		const rawData = window.atob(base64);
		const outputArray = new Uint8Array(rawData.length);
		for(let i = 0; i < rawData.length; ++i) {
		outputArray[i] = rawData.charCodeAt(i);
		}
		return outputArray;
	}

	function getCurrentDate(){
		var currentdate = new Date();
		var datetime = currentdate.getDate() + "/" + (currentdate.getMonth()+1)  + "/" + currentdate.getFullYear() + "@" + currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
		return datetime;
	}

	if(('serviceWorker' in navigator && 'PushManager' in window) || ('serviceWorker' in navigator && isSafari)){
		navigator.serviceWorker.register('/service_worker.js').then(function(registration) {
			serviceWorkerRegistration = registration;
			initializeUI();
		}).catch(function(error) {
			console.error('Service Worker Error', error);
		});
	}else{
		console.warn('Push messaging is not supported');
	}


	function isSubscribedInitializator(){
		if(!(isSafari)){
			serviceWorkerRegistration.pushManager.getSubscription().then(function(subscription) {
				isSubscribed = !(subscription === null);
				updateBtn();
				return isSubscribed;
			});
		}else{
			isSubscribed = !(localStorage.getItem('SUBSCRIPTION_ID') === null);
			updateBtn();
			return isSubscribed;
		}
		return null;
	}

	function initializeUI(){
		isSubscribed = isSubscribedInitializator();
		pushButton.addEventListener('click', function() {
			pushButton.disabled = true;
			if(!(isSafari)){
				if(isSubscribed) {
					unsubscribeUser()
				}else{
					subscribeUser();
				}
				updateBtn();
			}else{
				var subId = localStorage.getItem('SUBSCRIPTION_ID');
				var subKey = localStorage.getItem('SUBSCRIPTION_KEY');
				if(subId!=null){
					localStorage.clear();
					updateSubscriptionOnServer(isSubscribed, 'DELETE', subId, subKey);
					isSubscribed = false;
					updateBtn();
				}else{
					subId = generateString(88);
					subKey = generateString(24);
					subDate = getCurrentDate();
					localStorage.setItem('SUBSCRIPTION_ID', subId);
					localStorage.setItem('SUBSCRIPTION_KEY', subKey);
					localStorage.setItem('SUBSCRIPTION_DATE_TIME', subDate);
					isSubscribed = true;
					updateSubscriptionOnServer(isSubscribed, 'POST', subId, subKey);
					updateBtn();
				}

			}
		});
	}

	function updateBtn(){
		if(!(isSafari)){
			if(Notification.permission === 'denied') {
				pushButton.style.setProperty('color', 'green', 'important');
				pushButton.disabled = true;
				updateSubscriptionOnServer(null);
				return;
			}
		}
		if(isSubscribed){
			pushButton.style.setProperty('color', 'red', 'important');
		}else{
			pushButton.style.setProperty('color', 'green', 'important');
		}
		pushButton.disabled = false;
	}

	function subscribeUser(){
		const applicationServerKey = urlBase64ToUint8Array(applicationServerPublicKey);
		serviceWorkerRegistration.pushManager.subscribe({
			userVisibleOnly: true,
			applicationServerKey: applicationServerKey
		}).then(function(subscription) {
			updateSubscriptionOnServer(subscription, "POST");
			isSubscribed = true;
			updateBtn();
		}).catch(function(err) {
			console.log('Failed to subscribe the user: ', err);
			updateBtn();
		});
	}

	function unsubscribeUser(){
		serviceWorkerRegistration.pushManager.getSubscription().then(function(subscription) {
			if(subscription) {
				updateSubscriptionOnServer(subscription, "DELETE");
				return subscription.unsubscribe();
			}
		}).then(function(){
			isSubscribed = false;
			updateBtn();
		}).catch(function(error) {
			console.log('Error unsubscribing', error);
		});
	}

	function updateSubscriptionOnServer(subscription, type, subId, subKey){
		if(subscription){
			if(!(isSafari)){
				key = subscription.getKey('p256dh');
				publicKey = key ? btoa(String.fromCharCode.apply(null, new Uint8Array(key))) : null,
				token = subscription.getKey('auth');
				authToken = token ? btoa(String.fromCharCode.apply(null, new Uint8Array(token))) : null,
				endpoint = subscription.endpoint;
				contentEncoding = (PushManager.supportedContentEncodings || ['aesgcm'])[0];
				// console.log(subscription.endpoint);
				// console.log(key ? btoa(String.fromCharCode.apply(null, new Uint8Array(key))) : null,);
				// console.log(token ? btoa(String.fromCharCode.apply(null, new Uint8Array(token))) : null,);
			}else{
				publicKey = subId;
				authToken = subKey;
				endpoint = 'Safari';
				contentEncoding = '';
			}
			return fetch('../../../service/push_notifications/push_subscription.php', {
				method: 'POST',
				body: JSON.stringify({
					endpoint: endpoint,
					publicKey: publicKey,
					authToken: authToken,
					method: type,
					contentEncoding,
				}),
			}).then(() => subscription);
		}
	}

	$('.btn_push_notification').on('click', function(){
		$(this).disabled = true;
		$(this).text("Pubblicata");
		$(this).prop("disabled",true);
		$(this).css("cursor",'auto');
		var ref = $(this).data('ref');
		var data = $(ref).serialize();
		$.ajax({
			type: "POST",
			data: data,
			error: function()
			{
			alert("Chiamata fallita, si prega di riprovare...");
			},
			success: function(){
				values = $(ref).serializeArray(), value = {};
				$(values).each(function(i, field){
					value[field.name] = field.value;
				});
				const payload = {payload: value['fields[body]']};
				const contentEncoding = (PushManager.supportedContentEncodings || ['aesgcm'])[0];
				fetch('../../../service/push_notifications/push_notifications.php', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(Object.assign(payload, { contentEncoding })),
				});
			}
		});
	});

	function updateBtn(){
		if(!(isSafari)){
			if(Notification.permission === 'denied') {
				pushButton.style.setProperty('color', 'green', 'important');
				pushButton.disabled = true;
				updateSubscriptionOnServer(null);
				return;
			}
		}
		if(isSubscribed){
			pushButton.style.setProperty('color', 'red', 'important');
		}else{
			pushButton.style.setProperty('color', 'green', 'important');
		}
		pushButton.disabled = false;
	}
});