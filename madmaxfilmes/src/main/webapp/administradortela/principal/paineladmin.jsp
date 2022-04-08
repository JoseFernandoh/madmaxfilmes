<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

    <!DOCTYPE html>
    <!--[if IE 7]><html class="ie ie7 no-js" lang="en-US"><![endif]-->
    <!--[if IE 8]><html class="ie ie8 no-js" lang="en-US"><![endif]-->
    <!--[if !(IE 7) | !(IE 8)  ]><!-->
    <html lang="en" class="no-js">


	<jsp:include page="painel.jsp"></jsp:include>
	
	
    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="form-style-1 user-pro">
                            <form action="<%= request.getContextPath() %>/ServletFilmeController" enctype="multipart/form-data" class="user" id="formUser" method="post">
                                <h4>Dados Gerais</h4>
                                	
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="js.jsp"></jsp:include>
        
        <script>
        	$("#multselect").select2();  
        	$("#dadosgerais").addClass('active') 
        	
        </script>
    </body>

    </html>