                    </div>
                </div>
            </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-latest.min.js" type="text/javascript"></script>
        <script src="js/jquery.maskedinput.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
   
        <script type="text/javascript">
        $(document).ready(function(){
            $("#cep").mask("99999-999");
            $("#cpf").mask("999.999.999-99");
            $("#data").mask("99/99/9999");
            $("#rg").mask("99.999.999-9");
            $("#telefone").mask("(99)9999-9999");
            $("#cartaoSUS").mask("999.9999.9999.9999");
            $("#cnes").mask("9999999");
        });
        
        function callReport() {
            window.open("vacineReport.jsp", "_blank", "toolbar=yes, scrollbars=yes, \n\
                        resizable=no,width=800, height=640");
        }
        
        $('input').on('change', function() {
            if('#' + $(this).attr('id') + 'Oculto'){
                $('#' + $(this).attr('id') + 'Oculto').val($(this).val());
            }
        });
        
        </script>
    </body>
</html>