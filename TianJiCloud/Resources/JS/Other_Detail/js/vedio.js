$(function(){
	$('#zanBlock').click(function(){
		var openFlag = $(this).attr('data-open');
		var numberText = parseInt($('#goodText').text());
		if(openFlag == 0){
			$('#zanBlock img').addClass('pulseAnim');
			setTimeout(function(){
				$('#zanBlock img').removeClass('pulseAnim');
			},1200);
			$('#goodText').text(++numberText);
			$(this).attr('data-open',1);
		}
		
	});

	$('#noGood').click(function(){
		var openFlag = $(this).attr('data-open');
		var numberText = parseInt($('#nogoodText').text());
		if(openFlag == 0){
			$('#noGood img').addClass('pulseAnim');
			setTimeout(function(){
				$('#noGood img').removeClass('pulseAnim');
			},1200);
			$('#nogoodText').text(++numberText);
			$(this).attr('data-open',1);
		}
		
	});

	$('.video-player').click(function(){
		var open = $('.video-player').attr('data-open');
		if(open == 0){
			$("video").trigger("play");
			$('.video-toplay').hide();
			$('.video-player').attr('data-open',1);
		}else if(open == 1){
			$("video").trigger("pause");
			$('.video-toplay').show();
			$('.video-player').attr('data-open',0);
		}
	});

	$('#comment-ul').delegate('.commont-like','click',function(){
		var dataFlag = $(this).attr('data-open');
		var nowNumber = parseInt($(this).text());
		if(dataFlag == 0){
			$(this).text(++nowNumber);
			$(this).attr('data-open','1');
			$(this).addClass('commont-liked');
		}else if(dataFlag == 1){
			showTips('您已经赞过了');
			return;
			$(this).text(--nowNumber);
			$(this).attr('data-open','0');
			$(this).removeClass('commont-liked');
		}
	});


	$('#publish-click').click(function(){
		var contentText = $('#inputComment').val();
		if(contentText.length <= 0){
			return false;
		}
		var strAppend = new StringBuffer();
		var dateNow = new Date();
		var hour = dateNow.getHours();
		var min = dateNow.getMinutes();
		strAppend.append('<li>');
		strAppend.append('<div class="float-left comment-img">');
		strAppend.append('<img src="" alt="头像"/>');
		strAppend.append('</div>');
		strAppend.append('<div class="float-left comment-content">');
		strAppend.append('<div class="comment-author">');
		strAppend.append('<span>匿名游客</span>');
		strAppend.append('<div class="float-right commont-like" data-open="0">0</div>');
		strAppend.append('</div>');
		strAppend.append('<p class="font-30">'+contentText+'</p>');
		strAppend.append('<div class="reply-time font-24">');
		strAppend.append('今天'+hour+":"+min+' · 0条回复');
		strAppend.append('</div>');
		strAppend.append('</div>');
		strAppend.append('<div class="clear"></div>');
		strAppend.append('</li>');
		$('#comment-ul').prepend(strAppend.toString());
		showTips('发表成功');
	});


	$('#collectionButton').click(function(){
		var collection = parseInt($(this).attr('data-collection'));
		if(collection == 0){
			$(this).attr('src','news_ico_colle_sel@2x.png');
			$(this).attr('data-collection',1);
			showTips('收藏成功');
		}else if(collection == 1){
			$(this).attr('src','news_ico_colle_def@2x.png');
			$(this).attr('data-collection',0);
			showTips('已取消收藏');
		}
		
	});
});

function showTips(content){
	$('.tipMask').show();
	$('.tipMask').addClass('tipMaskShow');
	$('#tipsFont').text(content);
	setTimeout(function(){
		$('.tipMask').fadeOut();
		$('.tipMask').removeClass('tipMaskShow');
	},2000);
}



function StringBuffer() {
    this.__strings__ = new Array();
}
StringBuffer.prototype.append = function (str) {
    this.__strings__.push(str);
    return this;    //鏂逛究閾惧紡鎿嶄綔
}
StringBuffer.prototype.toString = function () {
    return this.__strings__.join("");
}
