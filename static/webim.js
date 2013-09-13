//custom
(function(webim){
	var path = _IMC.path;
	webim.extend( webim.setting.defaults.data, _IMC.setting );
	var webim = window.webim;
	webim.defaults.urls = {
		online:path + "online?domain=" + (_IMC.domain || ""),
		offline:path + "offline",
		message:path + "message",
		logmsg:path + "logmsg",
		presence:path + "presence",
		refresh:path + "refresh",
		status:path + "status"
	};
	webim.setting.defaults.url = path + "setting";
	webim.history.defaults.urls = {
		load: path + "history",
		clear: path + "clear_history",
		download: path + "download_history"
	};
	webim.room.defaults.urls = {
		member: path + "members",
		join: path + "join",
		leave: path + "leave"
	};
	webim.buddy.defaults.url = path + "buddies";
	//webim.notification.defaults.url = path + "notifications";

	webim.ui.emot.init({"dir": path + "static/images/emot/default"});
	var soundUrls = {
		lib: path + "static/assets/sound.swf",
		msg: path + "static/assets/sound/msg.mp3"
	};
	var ui = new webim.ui(document.body, {
		imOptions: {
			jsonp: _IMC.jsonp
		},
		soundUrls: soundUrls,
		layoutOptions: {
			unscalable: true
		},
		buddyChatOptions: {
			simple: true
		}
	}), im = ui.im;

	if( _IMC.user ) im.user( _IMC.user );
	//if( _IMC.menu ) ui.addApp("menu", { "data": _IMC.menu } );
	//if( _IMC.enable_shortcut ) ui.layout.addShortcut( _IMC.menu );

	ui.addApp("buddy", {
		is_login: _IMC['is_login'],
		loginOptions: _IMC['login_options'],
		title: _IMC['title'] || webim.ui.i18n("online support"),
		disable_user: true,
		disable_group: true
	} );
	ui.addApp("visitorstatus");
	ui.addApp("logmsg");
	//ui.addApp("room");
	//ui.addApp("notification");
	//ui.addApp("setting", {"data": webim.setting.defaults.data});
	//if( !_IMC.disable_chatlink )ui.addApp("chatlink", {
	//	off_link_class: /r_option|spacelink/i
	//});
	ui.render();
	_IMC['is_login'] && im.autoOnline() && im.online();
})(webim);
