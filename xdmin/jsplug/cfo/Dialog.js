function SuccessNotice(NoticeContent,func)
{//成功提示
	var dialog = art.dialog.through({
	    content: NoticeContent,
	    fixed: true,
	    id: 'SuccessNotice',
	    icon: 'succeed',
	    lock:true,
	    okVal: '确定',
	    ok: function () {
			func();
	    }
	});
}

function FailNotice(NoticeContent,func)
{//失败提示
	var dialog = art.dialog.through({
	    content: NoticeContent,
	    fixed: true,
	    id: 'FailNotice',
	    icon: 'error',
	    lock:true,
	    okVal: '确定',
	    ok: function () {
			func();
	    }
	});
}

function openpage(opentitle,openurl,closefunc)
{//打开一个页面
	art.dialog.open(openurl,{title:opentitle,lock:true,fixed:true,resize:false,
	close:function(){
		closefunc();
	}
	});
	return false;
}
function CheckAll()
{
	if($("#chkAll").attr("checked"))
	{
 		$('input[name="id"]').attr("checked",true);
	}else
	{
		$('input[name="id"]').attr("checked",false);
	}
}
function UpPage(opentitle,ContainID,UpType)
{//打开上传页面
	art.dialog.open('iframe/UpPage.php?UpType='+UpType,{title:opentitle,lock:true,fixed:true,resize:false,
		close:function(){
			if(art.dialog.data('PhotoStr')!=undefined && art.dialog.data('PhotoStr')!="")
			{
				if(UpType=="one")
				{
					$("#"+ContainID).val(art.dialog.data('PhotoStr'));
				}else
				{
					if($.trim($("#"+ContainID).val())=="")
					{
						$("#"+ContainID).val(art.dialog.data('PhotoStr'));
					}else
					{
						$("#"+ContainID).val($("#"+ContainID).val()+","+art.dialog.data('PhotoStr'));
					}
				}
				art.dialog.removeData('PhotoStr');
			}			
		}
		});
		return false;
}
