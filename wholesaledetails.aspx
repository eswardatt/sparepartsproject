<%@ Page Title="" Language="C#" MasterPageFile="md.Master" AutoEventWireup="true" CodeBehind="wholesaledetails.aspx.cs" Inherits="medicalshop.wholesaledetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
                <div runat="server" id="Div1">
                    <div class="row">

                        <div class="col-md-4" style="margin-top: 4px;">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Wholesaler name"></asp:Label><span style="color: red">*</span>
                                <asp:TextBox ID="txtwhlsname" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqv4" ControlToValidate="txtwhlsname" ValidationGroup="two_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-md-4" style="margin-top: 23px;">
                            <div class="form-group">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClientClick="clientsidevalidation();" ValidationGroup="two_1" OnClick="btnsubmit_Click" CssClass="btn btn-primary" />

                            </div>
                        </div>

                    </div>


                </div>
            </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="alert alert-danger" runat="server" id="errordiv" visible="false">
                    <strong runat="server" id="errormsg"></strong>
                </div>

            </div>
            
            <div class="container" style="margin-top: 20px;">
                
                <div runat="server" id="listdiv" style="width:280px;">
                    <asp:GridView ID="grid" CssClass="table" runat="server" HeaderStyle-BackColor="#337AB7" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="S.no" HeaderStyle-Width="40">
                                <ItemTemplate>

                                    <div style="width:40px;">

                                    <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>' ></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wholesaler" HeaderStyle-Width="190">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>        <asp:Timer ID="Timer1" runat="server" OnTick="TimerTick" Interval="1000" />

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=errordiv.ClientID %>").style.display = "none";
        }, seconds * 1000);

        function clientsidevalidation() {
            var txt = $("#<%=txtwhlsname.ClientID%>").val();
            if (txt=="") {
                alert("Please enter required(*) fields");
            }

        }
    </script>
</asp:Content>
