<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="userlayout"/>
        <title>Process Model</title>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'jquery.news-ticker.css')}" />
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'stylesheetse',file:'nestable.css')}" />
    </head>
    <body>
        
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            New Process Model</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Process Model</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">New Process Model</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <div class="page-content">
                    <div id="tab-general">
                        <div class="row mbl">
                            <div class="col-lg-12">
                                <div class="col-md-12">
                                    <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="row">
                                    
                                    <div class="col-lg-12">
                                        <div class="panel panel-blue">
                                            <div class="panel-heading">
                                                Add a new Model Process</div>
                                            <div class="panel-body pan">
                                                <g:form name="createProcessModelForm" url="[controller:'processModel',action:'createProcessModel']">
                                                <div class="form-body pal">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="input-icon">
                                                                    <i class="fa fa-flag"></i>
                                                                    <g:textField id="processModelName" name="processModelName" class="form-control" placeholder="Process model name" required="true" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="form-group">
                                                        <g:textArea id ="processModelDescription" name="processModelDescription" rows="5" placeholder="Description" class="form-control" />
                                                    </div>
                                                    
                                                    <hr /> 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <div class="input-icon">
                                                                    <i class="fa fa-flag"></i>
                                                                       
                                                                        <input id="phaseModelName"  class="form-control" placeholder="Pahse model name" required="true" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                            <button type="button" id="addPhase" class="btn btn-green">Add Phase</button>

                           


                                                            </div>
                                                        </div>
                                                        
                                                    </div> 
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div id="nestable3" class="dd">

                                                                <ol name="phases" class="dd-list" id="phasesList">

                                                                </ol>
                                                            </div>
                                                        </div>  
                                                    </div>                                       
                                                    

                                                    
                                                    
                                                </div>
                                                <div class="form-actions text-right pal">
                                                    <button type="button" onclick="createJSON()" class="btn btn-primary">
                                                        Continue</button>
                                                </div>
                                                </g:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
        <!--BEGIN FOOTER--> 
        <div id="footer">
            <div class="copyright">
                <a>2016 © GRUS</a></div> 
        </div>
        <!--END FOOTER-->    
    <!--END PAGE WRAPPER-->

<div id="popup_name" class="popup_block">
    <h2>Add a tool to your phase</h2>
    <div class="btn-group">
        <button type="button" style='width : 250px;' data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true" class="btn btn-primary dropdown-toggle">Tools
            &nbsp;<span class="badge badge-yellow">${tools.size()}</span></button>
        <ul class="dropdown-menu pull-right">
            <g:each var="tool" in="${tools}">
                <li>
                    <a href="#" value="${tool.toolModelName}" class="addTool">
                        <span class="label ${tool.label}">
                            <i class="fa ${tool.icon}"></i>
                        </span>&nbsp;
                        ${tool.toolModelName}
                    </a>
                </li>
                <li class="divider"></li>
            </g:each>
            
        </ul>
    </div>
</div>

    <content tag="javascripts">
   
    
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'responsive-tabs.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.categories.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.pie.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.tooltip.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.resize.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.fillbetween.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.stack.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.flot.spline.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'zabuto_calendar.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'index.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'jquery.nestable.js')}"></script>
    
   
    <script type="text/javascript">

            $(document).ready(function(){
                var toonNumber=0;
                var currentPhase=0;
                var phaseSelectedList = null;
                var toolsSelected = null;
                $('#addPhase').click(function(){
                    var phaseModelName = $('#phaseModelName').val();
                    var phase = "<li name='"+phaseModelName+"' data-id='"+(++currentPhase)+"' class='dd-item dd3-item'><a href='#?w=500' rel='popup_name' class='poplight dd-handle dd3-handle'></a><div class='dd3-content'>"+ phaseModelName +"</div><ol id='"+phaseModelName+"' class='dd-list'></ol></li>";
                    var phases = $('#phasesList').append(phase);
                    
                });
                $('a.poplight[href^=#]').live('click',function() {
                    var popID = $(this).attr('rel'); //Trouver la pop-up correspondante
                    var popURL = $(this).attr('href'); //Retrouver la largeur dans le href

                    //Récupérer les variables depuis le lien
                    var query= popURL.split('?');
                    var dim= query[1].split('&amp;');
                    var popWidth = dim[0].split('=')[1]; //La première valeur du lien

                    //Faire apparaitre la pop-up et ajouter le bouton de fermeture
                    $('#' + popID).fadeIn().css({
                        'width': Number(popWidth)
                    })
                    .prepend('<a href="#" class="close"><img src="${assetPath(src: "Close.png")}" class="btn_close" title="Fermer" alt="Fermer" /></a>');

                    //Récupération du margin, qui permettra de centrer la fenêtre - on ajuste de 80px en conformité avec le CSS
                    var popMargTop = ($('#' + popID).height() + 80) / 2;
                    var popMargLeft = ($('#' + popID).width() + 80) / 2;

                    //On affecte le margin
                    $('#' + popID).css({
                        'margin-top' : -popMargTop,
                        'margin-left' : -popMargLeft
                    });

                    //Effet fade-in du fond opaque
                    $('body').append('<div id="fade"></div>'); //Ajout du fond opaque noir
                    //Apparition du fond - .css({'filter' : 'alpha(opacity=80)'}) pour corriger les bogues de IE
                    $('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn();
                    phaseSelectedList = $(this).parent().find('ol');
                    return false;
                });
                
                //Fermeture de la pop-up et du fond
                $('a.close, #fade').live('click', function() { //Au clic sur le bouton ou sur le calque...
                    $('#fade , .popup_block').fadeOut(function() {
                        $('#fade, a.close').remove();  //...ils disparaissent ensemble
                    });
                    return false;
                });
                //add tool

                $('.addTool').live('click',function(){
                    
                    var newTool = "<li data='"+$(this).attr('value')+"' data-id='16' class='dd-item dd3-item'><div class='dd3-content'>"+$(this).attr('value')+"</div></li> ";
                    phaseSelectedList.append(newTool);
                    $('#fade , .popup_block').fadeOut(function() {
                        $('#fade, a.close').remove();  
                    });
                    return false;
                });


            });
            
            function createJSON() {
                
                    jsonObj = [];
                    processModelName = $('#processModelName').val();
                    processModelDescription = $('#processModelDescription').val() ;

                    $('#phasesList > li').each(function(){


                        
                        item = {};
                        item['phaseName'] = $(this).attr('name');
                        item['tools']= [];
                        $(this).find('ol > li').each(function(){
                            item['tools'].push($(this).attr('data'));
                        });
                        jsonObj.push(item);
                    });
                    

                    console.log(jsonObj);
                    var objectDataString = JSON.stringify(jsonObj);

                    $.ajax({
                                type: "POST",
                                url: "${createLink(controller:'ProcessModel',action:'createProcessModel')}",
                                dataType: "json",
                                data: {
                                     phases: objectDataString,
                                     modelName : processModelName,
                                     modelDescription : processModelDescription
                                },
                                success: function (data) {
                                   //alert('Success');
                                $(location).attr('href', "${createLink(controller:'ProcessModel',action:'saveSuccess')}");

                                },
                                error: function () {
                                 //alert('Error');
                                $(location).attr('href', "${createLink(controller:'ProcessModel',action:'saveSuccess')}");

                                }
                            });
                }
            
    </script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'ui-nestable-list.js')}"></script>
    
    </content>
   <style type="text/css">
   .picture-30{
    display: inline-block;
    height: 30px;
    position: relative;
    width: 30px;
   }
   /*pop up*/
   #fade { /*--Masque opaque noir de fond--*/
    display: none; /*--masqué par défaut--*/
    background: #000;
    position: fixed; left: 0; top: 0;
    width: 100%; height: 100%;
    opacity: .80;
    z-index: 9999;
    }
    .popup_block{
        display: none; /*--masqué par défaut--*/
        background: #fff;
        padding: 20px;
        border: 20px solid #ddd;
        float: left;
        font-size: 1.2em;
        position: fixed;
        top: 50%; left: 50%;
        z-index: 99999;
        /*--Les différentes définitions de Box Shadow en CSS3--*/
        -webkit-box-shadow: 0px 0px 20px #000;
        -moz-box-shadow: 0px 0px 20px #000;
        box-shadow: 0px 0px 20px #000;
        /*--Coins arrondis en CSS3--*/
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }
    img.btn_close {
        float: right;
        margin: -55px -55px 0 0;
    }
    /*--Gérer la position fixed pour IE6--*/
    *html #fade {
    position: absolute;
    }
    *html .popup_block {
    position: absolute;
    }

   </style>
    </body>
</html>