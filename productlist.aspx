<%@ Page Title="" Language="C#" MasterPageFile="md.Master" AutoEventWireup="true" CodeBehind="productlist.aspx.cs" Inherits="medicalshop.productlist" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <div class="container">
        <div class="alert alert-danger" runat="server" id="errordiv" visible="false">
            <strong runat="server" id="errormsg"></strong>
        </div>

    </div>
    <div style="margin-left: 10px; margin-top: 40px;">

        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#337AB7" ClientIDMode="Static" CssClass="display compact" OnRowCommand="grid_RowCommand">
            <Columns>


                <asp:TemplateField HeaderText="Spare Code">
                    <ItemTemplate>
                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblformno" runat="server" Text='<%#Eval("code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Spare Name">
                    <ItemTemplate>
                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sale(%)">
                    <ItemTemplate>
                        <div style="margin-left: 20px; width: 120px;">
                            <asp:TextBox ID="txtsale" runat="server" Width="50px" Text='<%#Eval("sale") %>'></asp:TextBox>

                          
                       


                            <asp:LinkButton ID="btnedit" Width="50px" ToolTip="Update sale" runat="server" CssClass="btn btn-primary" CommandName="update_sale" CommandArgument="<%# Container.DataItemIndex %>">save</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock details">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("items") %>'></asp:Label>
                        

                        <div style="margin-left: 20px; width: 120px;">
                            <asp:TextBox ID="txtitems" runat="server" Width="40px" Text="" ></asp:TextBox>


                              
                        
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" CommandName="add_stock" CommandArgument="<%# Container.DataItemIndex %>">+</asp:LinkButton>

                            <asp:LinkButton ID="btnedit1" runat="server" CssClass="btn btn-primary" CommandName="sub_stock" CommandArgument="<%# Container.DataItemIndex %>">-</asp:LinkButton>
                        </div>
                            

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Spare Type">
                    <ItemTemplate>
                        <asp:Label ID="lbltype" runat="server" Text='<%#Eval("type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Wholesaler details">
                    <ItemTemplate>
                        <asp:GridView ID="gvwholsale" cursor="pointer" runat="server"></asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="container" style="margin-top: 40px;">
        <div id="divcontent" runat="server" style="width: 700px; border: dotted">
            <h3>Bill Receipt</h3>
            <asp:GridView ID="gridprint" runat="server" AutoGenerateColumns="false">
                <Columns>

                    <asp:TemplateField HeaderText="Spare Name">
                        <ItemTemplate>

                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("Productname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Spare Code">
                        <ItemTemplate>

                            <asp:Label ID="lblcode" runat="server" Text='<%#Eval("Productcode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Stock details">
                        <ItemTemplate>




                            <asp:Label ID="lblcount" runat="server" Text='<%#Eval("productcount") %>'></asp:Label>


                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label ID="lbltype" runat="server" Text='<%#Eval("producttype")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lbltype" runat="server" Text='<%#Eval("product_price")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

           
        </div>



    </div>





             </ContentTemplate>
    </asp:UpdatePanel>
     <div style="margin-bottom: 140px; margin-left: 640px; margin-top: 40px;">
                <asp:Button ID="btnprint" runat="server" OnClick="btnprint_Click" Visible="false" CssClass="btn btn-primary" Text="Print" />
            </div>
    <asp:HiddenField ID="example" runat="server" />
    <a href="#top" >Big Buck Bunny</a>.
    <script type="text/javascript" src="/jquery.js"></script>
    <script type="text/javascript" src="../datatable.js"></script>
    <link href="../datatablestyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(function () {
            $("[id*=grid]").DataTable(
                {
                    bLengthChange: true,
                    lengthMenu: [[5, 10, 20, 30, -1], [5, 10, 20, 30, "All"]],
                    bFilter: true,
                    bSort: true,
                    bPaginate: true
                });
        });

        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=errordiv.ClientID %>").style.display = "none";
        }, seconds * 1000);
        $('#gvwholsale tr td').click(function () {
            //var x= $('#gvwholsale tr th').text();
            var price = parseFloat($(this).text());
            var prid = "<%=Session["productid"]%>";
            var id = parseInt(prid);

            if (prid.length == 1) {
                $.ajax({
                    type: "POST",
                    url: "/service.asmx/Updateprice",
                    data: "{ price: '" + price + "', id: " + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        location.reload(true);

                    },
                    error: function (r) {
                        alert("Please select only price");
                    //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                    },
                    failure: function (r) {
                        alert(r.responseText);
                        //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                    }
                });
                $("#gvwholsale td").css('backgroundColor', 'white');
                $(this).css('backgroundColor', 'skyblue');
            }
            else {
                alert("Please submit stock details first");
            }

        });

        //Re-Create for on page postbacks
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $(function () {
                $("[id*=grid]").DataTable(
                    {
                        bLengthChange: true,
                        lengthMenu: [[5, 10, 20, 30, -1], [5, 10, 20, 30, "All"]],
                        bFilter: true,
                        bSort: true,
                        bPaginate: true
                    });
            });

            var seconds = 3;
            setTimeout(function () {
                document.getElementById("<%=errordiv.ClientID %>").style.display = "none";
            }, seconds * 1000);
            $('#gvwholsale tr td').click(function () {
                var price = parseFloat($(this).text());
                var prid = "<%=Session["productid"]%>";
                var id = parseInt(prid);
                if (prid.length == 1) {
                    $.ajax({
                        type: "POST",
                        url: "/service.asmx/Updateprice",
                        data: "{ price: '" + price + "', id: " + id + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            location.reload(true);

                        },
                        error: function (r) {
                            alert("Please select only price");
                    //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                        },
                        failure: function (r) {
                            alert(r.responseText);
                        //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                        }
                    });
                    $("#gvwholsale td").css('backgroundColor', 'white');
                    $(this).css('backgroundColor', 'skyblue');
                }
                else {

                    alert("Please submit stock details first");
                }

            });

        });
    </script>
</asp:Content>
