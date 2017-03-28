<?php
	include "../conn/config.php";
	$uid = $_SESSION['user_info']['uid'];
	$user = $_SESSION['user_info']['name'];
	
?>
<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		<div class="user-photo">
			<a class="img" >
				<img src="images/user.jpg" class="userimg1"></a>
			<p>你好！<?php echo $user; ?>, 欢迎登录</p>
		</div>
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<?php
			$hrsud = "SELECT * from hk_admin where `uid`='{$uid}' and FIND_IN_SET('1000',flags)";
			$hrsql = $db->getOne($hrsud);
			if($hrsql){
			?>
			<!-- 人事管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>人事管理</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="user_managers.php">
                            <i class="iconfont icon-iconfuzhi01" data-icon="icon-iconfuzhi01"></i>
                            <span>员工管理</span>
                        </a>
                    </dd>
					<dd>
                        <a href="javascript:;" data-url="user_department.php">
                            <i class="iconfont icon-quanxian2" data-icon="icon-quanxian2"></i>
                            <span>部门管理</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<?php
			}
			$dpsud = "SELECT * from hk_admin where uid='{$uid}' and FIND_IN_SET('2000',flags)";
			$dpsql = $db->getOne($dpsud);
			if($dpsql){
			?>
			<!-- 部门管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
				  <i class="iconfont icon-quanxian2" data-icon="icon-quanxian2"></i>
				   <span>部门管理</span>
				   <em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="depa_application.php">
						  <i class="iconfont icon-sms" data-icon="icon-sms"></i>
						   <span>资产申请</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="depa_managers.php">
						   <i class="iconfont icon-lanmuguanli" data-icon="icon-lanmuguanli"></i>
						   <span>资产管理</span>
						</a>
					</dd>
				</dl>
			</li>
			<?php
			}
			$cwsud = "SELECT * from hk_admin where uid='{$uid}' and FIND_IN_SET('3000',flags)";
			$cwsql = $db->getOne($cwsud);
			if($cwsql){
			?>
			<!-- 财务管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
				   <i class="iconfont icon-m-members"></i>
				   <span>财务管理</span>
				   <em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="cfo_upload.php">
						   <i class="iconfont icon-pinglun1" data-icon="icon-pinglun1"></i>
						   <span>上传薪资</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="cfo_wages.php">
						  <i class="iconfont icon-wenzhang1"></i>
						   <span>已发薪资</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="cfo_check.php">
						  <i class="iconfont icon-lanmuguanli" data-icon="icon-lanmuguanli"></i>
						   <span>资产审核</span>
						</a>
					</dd>
				</dl>
			</li>
			<?php
			}
			$zcsud = "SELECT * from hk_admin where uid='{$uid}' and FIND_IN_SET('4000',flags)";
			$zcsql = $db->getOne($zcsud);
			if($zcsql){
			?>
			<!-- 资产管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
				   <i class="iconfont icon-shengchengbaogao"></i>
				   <span>资产管理</span>
				   <em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="assets_stock.php">
						   <i class="iconfont icon-database" data-icon="icon-database"></i>
						   <span>资产库存</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="assets_assigned.php">
						   <i class="iconfont icon-qingchuhuancun" data-icon="icon-qingchuhuancun"></i>
						   <span>资产分配</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="assets_list.php">
						  <i class="iconfont icon-shengchengbaogao" data-icon="icon-shengchengbaogao"></i>
						   <span>资产列表</span>
						</a>
					</dd>
				</dl>
			</li>
			<?php
			}
			$htsud = "SELECT * from hk_admin where uid='{$uid}' and FIND_IN_SET('5000',flags)";
			$htsql = $db->getOne($htsud);
			if($htsql){
			?>
			<!-- 后台管理 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
				   <i class="iconfont icon-zhandianpeizhi" data-icon="icon-zhandianpeizhi"></i>
				   <span>后台管理</span>
				   <em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-url="admin_user.php">
						   <i class="iconfont icon-yonghu1" data-icon="icon-yonghu1"></i>
						   <span>用户列表</span>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-url="admin_backups.php">
						   <i class="iconfont icon-SQLServershujuku" data-icon="icon-SQLServershujuku"></i>
						   <span>网站备份</span>
						</a>
					</dd>
				</dl>
			</li>
			<?php
			}
			?>
			<!-- 修改密码 -->
			<li class="layui-nav-item">
				<a href="javascript:;" data-url="password.php">
				   <i class="iconfont icon-anquanshezhi" data-icon="icon-anquanshezhi"></i>
				   <span>修改密码</span>
				</a>
			</li>
		</ul>
	    </div>
	</div>
	<!-- 左侧侧边导航结束 -->