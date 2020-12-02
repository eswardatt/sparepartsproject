<%@ Page Title="" Language="C#" MasterPageFile="md.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="medicalshop.addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 40px;">


        <div class="alert alert-success" runat="server" visible="false" id="suucesdiv">
            <strong>Success!</strong>
        </div>
        <div class="alert alert-danger" runat="server" visible="false" id="errordiv">
            <strong>Error!</strong><asp:Label ID="lblerrormsg" runat="server"></asp:Label>
        </div>
        <div class="row">

            <div class="col-md-3">
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Spare Name"></asp:Label><span style="color: red">*</span>
                    <asp:TextBox ID="txtsparepartname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqv3" ControlToValidate="txtsparepartname" ValidationGroup="one_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>


                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Spare Code"></asp:Label><span style="color: red">*</span>
                    <asp:TextBox ID="txtcode" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqv1" ControlToValidate="txtcode" ValidationGroup="one_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-md-1">
                <h3>OR</h3>
            </div>
            <div class="col-md-3">
                <asp:Label ID="Label6" runat="server" Text="Bulk insert"></asp:Label>
                <input type="file" id="fileUpload" class="btn btn-success" />

            </div>

        </div>
        <div class="row">

            <div class="col-md-2">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Spare Part type"></asp:Label><span style="color: red">*</span>
                    <asp:TextBox ID="txtspareparttype" CssClass="form-control" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rqv2" ControlToValidate="txtspareparttype" ValidationGroup="one_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Sale Percentage"></asp:Label><span style="color: red">*</span>
                    <asp:TextBox ID="txtsalepercentage" MaxLength="3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqv4" ControlToValidate="txtsalepercentage" ValidationGroup="one_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgv1" runat="server" ControlToValidate="txtsalepercentage" ValidationExpression="^[0-9]*$" ErrorMessage="invalid!" ValidationGroup="one_1" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>


                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Stock items"></asp:Label><span style="color: red">*</span>
                    <asp:TextBox ID="txtstockcount" MaxLength="3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtstockcount" ValidationGroup="one_1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtstockcount" ValidationExpression="^[0-9]*$" ErrorMessage="invalid!" ValidationGroup="one_1" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>


                </div>
            </div>


            <div class="col-md-2" style="margin-left: 98px;">
                <input type="button" id="btnExport" value="Export" class="btn btn-primary" />
            </div>
            <div class="col-md-3">
                <p style="margin-left: 98px; margin-top: 5px; color: red;">Note :</p>
                <p style="margin-left: 98px; margin-top: 5px; color: orangered;">* When uploading excell the column names should be same as the spareslist</p>
                <p style="margin-left: 98px; margin-top: 5px; color: orangered;">* Please refer sparelist page</p>
                <asp:Button ID="btnsampleexcell" OnClick="btnsampleexcell_Click" runat="server" CssClass="btn btn-primary" Text="Sample excell" />


            </div>
        </div>
        <asp:GridView ID="grid" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="Wholesalers">
                    <ItemTemplate>
                        <asp:Label ID="lblwhlsalername" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:TextBox ID="txtsalereprice" placeholder="Price(INR)" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqv4" ControlToValidate="txtsalereprice" ValidationGroup="one_1" ErrorMessage="*" ForeColor="Red" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rgv1" runat="server" ControlToValidate="txtsalereprice" ValidationExpression="^[0-9]*$" ErrorMessage="invalid!" ValidationGroup="one_1" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

        <div style="margin-left: 300px; margin-top: -38px;">
            <a href="productlist.aspx" class="btn btn-danger">Back</a>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClientClick="clientsidevalidation();" ValidationGroup="one_1" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
        </div>
    </div>

    <div class="container">
    </div>



    <script type="text/javascript"> 
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=errordiv.ClientID %>").style.display = "none";
        }, seconds * 1000);

        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=suucesdiv.ClientID %>").style.display = "none";
        }, seconds * 1000);
        function clientsidevalidation() {
            var code = $("#<%=txtcode.ClientID%>").val();
            var prc = $("#<%=txtsalepercentage.ClientID%>").val();
            var name = $("#<%=txtsparepartname.ClientID%>").val();
            var count = $("#<%=txtstockcount.ClientID%>").val();
            var type = $("#<%=txtspareparttype.ClientID%>").val(); var rowscount = $("#<%=grid.ClientID %> tr").length;

            var gridcount = rowscount;
            for (var i = 0; i < gridcount; i++) {
                var gridtxt = $("#ContentPlaceHolder1_grid_txtsalereprice_" + gridcount[i]).val();
                if (gridtxt == "") {
                    return
                }
            }
            if (code == "" || prc == "" || name == "" || count == "" || type == "" || gridtxt == "") {
                alert("Please enter required(*) fields");
            }

        }
    </script>

    <script type="text/javascript">

        var validFilesTypes = ["xlxs", "xls", "xlsx"];

        function ValidateFile() {

            var file = document.getElementById("fileUpload");



            var path = file.value;

            var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();

            var isValidFile = false;

            for (var i = 0; i < validFilesTypes.length; i++) {

                if (ext == validFilesTypes[i]) {

                    isValidFile = true;

                    break;

                }

            }

            if (!isValidFile) {
                var error = "Invalid File. Please upload a File with" + " extension:\n\n" + validFilesTypes.join(", ")
                alert(error);


            }

            return isValidFile;

        }

    </script>





    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/jszip.js"></script>

    <script>
        var excelRows;
        $("#fileUpload").change(function () {
            var fileUpload = $("#fileUpload")[0];

            //Validate whether File is valid Excel file.
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$/;
            if (regex.test(fileUpload.value.toLowerCase())) {
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();

                    //For Browsers other than IE.
                    if (reader.readAsBinaryString) {
                        reader.onload = function (e) {
                            ProcessExcel(e.target.result);
                        };
                        reader.readAsBinaryString(fileUpload.files[0]);
                    } else {
                        //For IE Browser.
                        reader.onload = function (e) {
                            var data = "";
                            var bytes = new Uint8Array(e.target.result);
                            for (var i = 0; i < bytes.byteLength; i++) {
                                data += String.fromCharCode(bytes[i]);
                            }
                            ProcessExcel(data);
                        };
                        reader.readAsArrayBuffer(fileUpload.files[0]);
                    }
                } else {
                    alert("This browser does not support HTML5.");
                }
            } else {
                alert("Please upload a valid Excel file.");
            }
        });
        function ProcessExcel(data) {
            //Read the Excel File data.
            debugger;
            var workbook = XLSX.read(data, {
                type: 'binary'
            });
            //Fetch the name of First Sheet.
            var firstSheet = workbook.SheetNames[0];
            //Read all rows from First Sheet into an JSON array.
            excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);



        }

        $("#btnExport").click(function () {
            if (excelRows.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "/service.asmx/Addexcell",
                    data: "{ obj: '" + JSON.stringify(excelRows) + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        //location.reload(true);
                         alert("Uploaded suuccessfully");
                    },
                    error: function (r) {
                        alert(r.responseText);
                    //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                    },
                    failure: function (r) {
                        alert(r.responseText);
                          //document.getElementById("<%=errordiv.ClientID %>").value = "error";
                    }
                });
            }
            else {
                alert("please add a file");
            }

        });
    </script>
</asp:Content>
