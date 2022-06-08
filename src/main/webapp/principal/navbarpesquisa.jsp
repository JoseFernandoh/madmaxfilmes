	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<body>
    <!--preloading-->
        <div id="preloader"><img class="logo" src="<%= request.getContextPath() %>/images/logo1.png" alt="" width="119" height="58">
            <div id="status"><span></span><span></span></div>
        </div>
        <!--end of preloading-->
        <!-- BEGIN | Header -->
        <header class="ht-header full-width-hd">
            <div class="row">
                <nav id="mainNav" class="navbar navbar-default navbar-custom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header logo">
                        <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Alternar de navegação</span>
                            <div id="nav-icon1"><span></span><span></span><span></span></div>
                        </div><a href="<%= request.getContextPath() %>/index.html"><img class="logo" src="<%= request.getContextPath() %>/images/logo1.png" alt="" width="119"
                                height="58"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav flex-child-menu menu-left">
                        </ul>
                        <ul class="nav navbar-nav flex-child-menu menu-right">
                            <li class="btn"><a href="<%= request.getContextPath() %>/ServletPesquisa">Pesquisar</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>
            <!-- top search form -->
            <div class="top-search">
	           	<select id = "selectTipo">
	           		<option value="Todos">Todos</option>
	           		<option value="Filme">Filme</option>
	           		<option value="Serie">Serie</option>
	           	</select>
	           	<input onkeyup="presionar(0)" id="nomeBusca" name="nomeBusca" type="text" placeholder="Procurar rapidamente um filme ou serie que você deseja">
            </div>
        </div>
    </header>
    <!-- END | Header -->