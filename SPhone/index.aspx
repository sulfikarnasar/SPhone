<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SPhone.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
     <script src="Scripts/jquery-1.6.4.min.js"></script>
    <!--Reference the SignalR library. -->
   
    <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
    
    <script type="text/javascript">
        $(document).ready(function () {

            $('#one_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '1');
            });
            $('#two_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '2');
            });
            $('#three_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '3');
            });
            $('#four_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '4');
            });
            $('#five_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '5');
            });
            $('#six_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '6');
            });
            $('#seven_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '7');
            });
            $('#eight_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '8');
            });
            $('#nine_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '9');
            });
            $('#zer_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                input.val(text + '0');
            });
            $('#back_btn').click(function () {
                var input = $('#num');
                var text = input.val();
                if (text.length > 0) {
                    input.val(text.substring(0, text.length - 1));
                }
            });
            $('#alerttbl').hide();
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <table>
         <tr><th></th><th >SOFT PHONE</th><th></th></tr>
         <tr>
             <td></td>
             <td >
                 <input type="text" id="num" />
             </td>
             <td></td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td >
                 <input type="button" id="one_btn" value="1" class="btn btn-primary"/>
                 <input type="button" id="two_btn" value="2" class="btn btn-primary"/>
                  <input type="button" id="three_btn" value="3" class="btn btn-primary"/>
             </td>
             <td>
                
             </td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td >
                 <input type="button" id="four_btn" value="4" class="btn btn-primary"/>
                 <input type="button" id="five_btn" value="5" class="btn btn-primary"/>
                  <input type="button" id="six_btn" value="6" class="btn btn-primary"/>
             </td>
             <td>
                
             </td>
         </tr>
          <tr>
             <td>
                 
             </td>
             <td >
                 <input type="button" id="seven_btn" value="7" class="btn btn-primary"/>
                 <input type="button" id="eight_btn" value="8" class="btn btn-primary"/>
                  <input type="button" id="nine_btn" value="9" class="btn btn-primary"/>
             </td>
             <td>
                
             </td>
         </tr>
         <tr>
             <td>
                 
             </td>
             <td >
                 <input type="button" id="call_btn" value="C" class="btn btn-success" />            
                 <input type="button" id="zer_btn" value="0" class="btn btn-primary"/>
                 <input type="button" id="back_btn" value="D" class="btn btn-warning" /> 
             </td>
               <td> 
             </td>
         </tr>
     </table>
        
       <table id="alerttbl">
           <tr>
               <td>
                   <asp:ImageButton ID="accept_call" runat="server" Height="32px" ImageUrl="~/icons/call_icon.png" Width="34px" /></td>
               <td>
                   <asp:ImageButton ID="reject_call" Height="32px" runat="server" ImageUrl="~/icons/rejectcall_icon.png" Width="34px"/></td>
           </tr>
       </table>
    </form>
     <script src="Scripts/jquery.signalR-2.0.0.min.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="/signalr/hubs"></script>
    <script type="text/javascript">

        $(function () {
            debugger;
            // Declare a proxy to reference the hub. 
            var chat = $.connection.callAlert;
            // Create a function that the hub can call to broadcast messages.
            chat.client.cname = function (name) {
                debugger;
                // Html encode display name and message. 
                // var callername = $('<div />').text(name).html();

                // Add the message to the page. 
                $('#alerttbl').append('<tr><td>' + name + '</td><td>...Calling</td></tr>');
                $('#alerttbl').show();
            };
            // Get the user name and store it to prepend to messages.
            //$('#displayname').val(prompt('Enter your name:', ''));
            // Set initial focus to message input box.  
            // $('#message').focus();
            // Start the connection.
            $.connection.hub.start().done(function () {
                var name = prompt("Enter name", "");
                chat.server.callerName(name);
                //debugger;
                //$('#sendmessage').click(function () {
                //    // Call the Send method on the hub. 
                //    chat.server.send($('#displayname').val(), $('#message').val());
                //    // Clear text box and reset focus for next comment. 
                //    $('#message').val('').focus();
                //});
            });
        });

    </script>
</body>
</html>
