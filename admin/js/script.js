$(document).ready(function(){$(function(){$('[rel="fancybox"]').fancybox()}),$('[rel="fancybox-media"]').fancybox({helpers:{media:!0},youtube:{autoplay:0}});var a=$("#touch-menu"),b=$(".menu");$(a).on("click",function(a){a.preventDefault(),b.slideToggle()}),$(window).resize(function(){var a=$(window).width();a>767&&b.is(":hidden")&&b.removeAttr("style")}),$("a[href*=#]:not([href=#])").click(function(){if(location.pathname.replace(/^\//,"")==this.pathname.replace(/^\//,"")&&location.hostname==this.hostname){var a=$(this.hash);if(a=a.length?a:$("[name="+this.hash.slice(1)+"]"),a.length)return $("html,body").animate({scrollTop:a.offset().top},1500),!1}})}),$(window).load(function(){}),$(document).ready(function(){$("#filer_input").filer({showThumbs:!0}),$("#filer_input2").filer({limit:null,maxSize:null,extensions:null,changeInput:'<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>Drag&Drop files here</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',showThumbs:!0,theme:"dragdropbox",templates:{box:'<ul class="jFiler-items-list jFiler-items-grid"></ul>',item:'<li class="jFiler-item">                        <div class="jFiler-item-container">                            <div class="jFiler-item-inner">                                <div class="jFiler-item-thumb">                                    <div class="jFiler-item-status"></div>                                    <div class="jFiler-item-info">                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>                                        <span class="jFiler-item-others">{{fi-size2}}</span>                                    </div>                                    {{fi-image}}                                </div>                                <div class="jFiler-item-assets jFiler-row">                                    <ul class="list-inline pull-left">                                        <li>{{fi-progressBar}}</li>                                    </ul>                                    <ul class="list-inline pull-right">                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>                                    </ul>                                </div>                            </div>                        </div>                    </li>',itemAppend:'<li class="jFiler-item">                            <div class="jFiler-item-container">                                <div class="jFiler-item-inner">                                    <div class="jFiler-item-thumb">                                        <div class="jFiler-item-status"></div>                                        <div class="jFiler-item-info">                                            <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>                                            <span class="jFiler-item-others">{{fi-size2}}</span>                                        </div>                                        {{fi-image}}                                    </div>                                    <div class="jFiler-item-assets jFiler-row">                                        <ul class="list-inline pull-left">                                            <li><span class="jFiler-item-others">{{fi-icon}}</span></li>                                        </ul>                                        <ul class="list-inline pull-right">                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>                                        </ul>                                    </div>                                </div>                            </div>                        </li>',progressBar:'<div class="bar"></div>',itemAppendToEnd:!1,removeConfirmation:!0,_selectors:{list:".jFiler-items-list",item:".jFiler-item",progressBar:".bar",remove:".jFiler-item-trash-action"}},dragDrop:{dragEnter:null,dragLeave:null,drop:null},uploadFile:{url:"./upload.ashx",data:null,type:"POST",enctype:"multipart/form-data",beforeSend:function(){},success:function(a,b){var c=b.find(".jFiler-jProgressBar").parent();b.find(".jFiler-jProgressBar").fadeOut("slow",function(){$('<div class="jFiler-item-others text-success"><i class="icon-jfi-check-circle"></i> Success</div>').hide().appendTo(c).fadeIn("slow")})},error:function(a){var b=a.find(".jFiler-jProgressBar").parent();a.find(".jFiler-jProgressBar").fadeOut("slow",function(){$('<div class="jFiler-item-others text-error"><i class="icon-jfi-minus-circle"></i> Error</div>').hide().appendTo(b).fadeIn("slow")})},statusCode:null,onProgress:null,onComplete:null},files:null,addMore:true,clipBoardPaste:!0,excludeName:null,beforeRender:null,afterRender:null,beforeShow:null,beforeSelect:null,onSelect:null,afterShow:null,onRemove:function(a,b,c,d,e,f,g){var b=b.name;$.post("./php/remove_file.php",{file:b})},onEmpty:null,options:null,captions:{button:"Choose Files",feedback:"Choose files To Upload",feedback2:"files were chosen",drop:"Drop file here to Upload",removeConfirmation:"Are you sure you want to remove this file?",errors:{filesLimit:"Only {{fi-limit}} files are allowed to be uploaded.",filesType:"Only Images are allowed to be uploaded.",filesSize:"{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",filesSizeAll:"Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."}}})});