<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>H+ 后台主题UI框架 - 写信</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader.css">
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader-demo.css">
	
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
    <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>图库上传</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">选项1</a>
                                </li>
                                <li><a href="#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="page-container">
                            <div id="uploader" class="wu-example">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker"></div>
                                        <p>或将照片拖到这里，单次最多可选300张</p>
                                    </div>
                                </div>
                                <div class="statusBar" style="display:none;">
                                    <div class="progress">
                                        <span class="text">0%</span>
                                        <span class="percentage"></span>
                                    </div>
                                    <div class="info"></div>
                                    <div class="btns">
                                        <div id="filePicker2"></div>
                                        <div class="uploadBtn">开始上传</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>服务器图库 <small>http://www.luot.com/</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">选项1</a>
                                </li>
                                <li><a href="#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content pics">
                      
                    </div>
                </div>
            </div>

        </div>
    </div>


  
	<!-- 全局js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/plugins/peity/jquery.peity.min.js"></script>

 	<script src="${pageContext.request.contextPath}/js/plugins/fancybox/jquery.fancybox.js"></script>
	
	<!-- 自定义js -->
	<script src="${pageContext.request.contextPath}/js/content.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- Web Uploader -->
    <script type="text/javascript">
        // 添加全局站点信息
        var BASE_URL = '${pageContext.request.contextPath}/js/plugins/webuploader';
    </script>
    <script src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/plugins/webuploader/webuploader-demo.js"></script>

    <script>
        $(document).ready(function () {
            $('.fancybox').fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });
            common_getPicFileList();
            
        });
        
        function common_getPicFileList() {
            var params = "E:\\Apache-tomcat-8.0.50\\webapps\\BlogV1.0\\upload";
            $.ajax({
                //此处使用的是自己封装的JAVA类
                url: "../getFileList",
                type: "POST",
                data: {params: params},//图片文件夹路径作为参数传入java类
                success: function (data) {
                    if (data.status==0) {
                    	swal("服务器图库为空", "请上传", "error");
                    } else {
                     var pics='';
                     var path='';
                     var arr=new Array();
                     var image='';
                    for(var i=0;i<data.fileList.length;i++){
                    	arr=data.fileList[i].split("webapps\\");
                    	path="http://localhost:8080/"+arr[1];
                    	image=path.replace(/\\/g,'/');
                    	pics+='<a class="fancybox" href="'+image+'" title="图片16"><img style="width: 254px; height: 143px;margin-right:5px;" alt="image" src="'+image+'" /></a>'
                    	}
                    }
					$(".pics").html(pics);
                },
                error: function (e) {
                    console.log(e);
                    console.log("获取文件list数组失败，请检查接口服务");
                }
            });
        }
    </script>


</body>


</html>
