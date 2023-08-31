<%@ Page Title="" Language="C#" MasterPageFile="~/NALCOApp.Master" AutoEventWireup="true" CodeBehind="insight.aspx.cs" Inherits="WebApplication5.insight" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script type="text/javascript">

        document.addEventListener("DOMContentLoaded", function () {


            /////// Prevent closing from click inside dropdown
            document.querySelectorAll('.dropdown-menu').forEach(function (element) {
                element.addEventListener('click', function (e) {
                    e.stopPropagation();
                });
            })

            // make it as accordion for smaller screens
            if (window.innerWidth < 992) {

                // close all inner dropdowns when parent is closed
                document.querySelectorAll('.navbar .dropdown').forEach(function (everydropdown) {
                    everydropdown.addEventListener('hidden.bs.dropdown', function () {
                        // after dropdown is hidden, then find all submenus
                        this.querySelectorAll('.submenu').forEach(function (everysubmenu) {
                            // hide every submenu as well
                            everysubmenu.style.display = 'none';
                        });
                    })
                });

                document.querySelectorAll('.dropdown-menu a').forEach(function (element) {
                    element.addEventListener('click', function (e) {

                        let nextEl = this.nextElementSibling;
                        if (nextEl && nextEl.classList.contains('submenu')) {
                            // prevent opening link if link needs to open dropdown
                            e.preventDefault();
                            console.log(nextEl);
                            if (nextEl.style.display == 'block') {
                                nextEl.style.display = 'none';
                            } else {
                                nextEl.style.display = 'block';
                            }

                        }
                    });
                })
            }
            // end if innerWidth
        });

    </script>
  

    <%--for birthday and retirement card--%>
   <style>
  .box-container {
    max-width: 400px;
    margin: auto;
    border: 2px solid #ccc;
    padding: 10px;
  }

  .button-container {
    text-align: center;
    margin-bottom: 10px;
  }

  .show-button {
    display: inline-block;
    margin: 0 10px;
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
  }

  .active {
    background-color: #0044aa;
  }

  .slideshow-container {
    display: block; /* Initially show the slideshow container */
  }

  .wish-box {
    display: none;
    text-align: center;
  }

  .employee-photo {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
  }

  .employee-name {
    font-size: 1.2rem;
    font-weight: bold;
  }

  .employee-department {
    font-size: 1rem;
    color: #666;
  }

  .wish-message {
    margin-top: 10px;
    font-size: 1rem;
    color: #333; /* Change text color for better visibility */
  }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- ============= COMPONENT ============== -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background-color: #DCDCDC;">
        <div class="container" style="align-content: center; align-items: center;">
            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main_nav">


                    <ul class="navbar-nav">
                        <!-- <li class="nav-item active"> <a class="nav-link" href="#">Home </a> </li>
		<li class="nav-item"><a class="nav-link" href="#"> About </a></li> -->

                        <!-- Applications Dropdown -->
                        <li class="nav-item"><a class="navbar-brand" style="color: #9f2221; font-weight: bold;" href="#">राजभाषा</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Applications </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Nalco Applications </a></li>
                                <li><a class="dropdown-item" href="#">GHRS </a></li>
                                <li><a class="dropdown-item" href="#">Visitor Gate Pass </a></li>
                                <li><a class="dropdown-item" href="#">Find a Nalconian </a></li>
                                <li><a class="dropdown-item" href="#">My Data </a></li>
                                <li><a class="dropdown-item" href="#">Exec. Appraisal </a></li>
                                <li><a class="dropdown-item" href="#">System Maint. Call </a></li>
                                <li><a class="dropdown-item" href="#">Nalco Library </a></li>
                                <li><a class="dropdown-item" href="#">Lotus Notes </a></li>
                                <li><a class="dropdown-item" href="#">Nalco Live Tenders - Login </a></li>
                                <li><a class="dropdown-item" href="#">Property Returns </a></li>
                                <li><a class="dropdown-item" href="#">eGreetings </a></li>
                                <li><a class="dropdown-item" href="#">Contract Labour Mgmt </a></li>
                                <li><a class="dropdown-item" href="#">Compliance Management </a></li>
                                <li><a class="dropdown-item" href="#">Vigilance Complaint Lodging </a></li>
                                <li><a class="dropdown-item" href="#">E Office &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">eOffice (Production)</a></li>
                                        <li><a class="dropdown-item" href="#">eOffice Demo</a></li>
                                        <li><a class="dropdown-item" href="#">eOffice Documents </a></li>

                                    </ul>
                                </li>
                            </ul>
                        </li>

                        <!-- Policies Dropdown -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Policies </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Corporate Vision, Mission & Core values </a></li>
                                <li><a class="dropdown-item" href="#">Quality Policy </a></li>
                                <li><a class="dropdown-item" href="#">Environment Policy </a></li>
                                <li><a class="dropdown-item" href="#">Energy Policy </a></li>
                                <li><a class="dropdown-item" href="#">Accounting Policy </a></li>
                                <li><a class="dropdown-item" href="#">OHS Policy </a></li>
                                <li><a class="dropdown-item" href="#">SA Policy </a></li>
                                <li><a class="dropdown-item" href="#">HR &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">HR Vision & Mission</a></li>
                                        <li><a class="dropdown-item" href="#">Company You Keep</a></li>

                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">IT Policies &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">IT Security Policy &raquo;</a>
                                            <ul class="submenu dropdown-menu">
                                                <li><a class="dropdown-item" href="#">English</a></li>
                                                <li><a class="dropdown-item" href="#">Hindi</a></li>
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-item" href="#">IT Resource Allocation Policy</a></li>
                                        <li><a class="dropdown-item" href="#">IT Security Guideline</a></li>
                                        <li><a class="dropdown-item" href="#">IT Acceptable Use Policy</a></li>
                                        <li><a class="dropdown-item" href="#">E-mail ID Nomenclature</a></li>
                                        <li><a class="dropdown-item" href="#">Nalco Cyber Security Guidelines</a></li>
                                        <li><a class="dropdown-item" href="#">Dos and Don'ts for Computer Users</a></li>
                                        <li><a class="dropdown-item" href="#">Password Policy(Lotus)</a></li>


                                    </ul>
                                </li>

                                <li><a class="dropdown-item" href="#">Whistle Blower &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Whistle Blower Policy(English)</a></li>
                                        <li><a class="dropdown-item" href="#">Whistle Blower Policy(English)</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- Manuals Dropdown -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Manuals </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">HR Manual </a></li>
                                <li><a class="dropdown-item" href="#">Purchase manual </a></li>
                                <li><a class="dropdown-item" href="#">Contract Manual </a></li>
                                <li><a class="dropdown-item" href="#">Capital Budget </a></li>
                                <li><a class="dropdown-item" href="#">Stores Manual </a></li>
                                <li><a class="dropdown-item" href="#">Consultant Guideline </a></li>
                                <li><a class="dropdown-item" href="#">Annual Reports </a></li>
                            </ul>
                        </li>
                        <!-- Forms Dropdown -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Forms </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">PESB Appraisal </a></li>
                                <li><a class="dropdown-item" href="#">Peon Book </a></li>
                                <li><a class="dropdown-item" href="#">Leave &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Leave Encashment</a></li>
                                        <li><a class="dropdown-item" href="#">Leave Application</a></li>
                                        <li><a class="dropdown-item" href="#">Special Disability Leave </a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Medical &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Medical Claim(NT)</a></li>
                                        <li><a class="dropdown-item" href="#">Medical Claim(Tx)</a></li>
                                        <li><a class="dropdown-item" href="#">Accident Report </a></li>
                                        <li><a class="dropdown-item" href="#">PME Requisition Form </a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Telephone &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Telephone Bill Cliam</a></li>
                                        <li><a class="dropdown-item" href="#">Phone(Non-Exe)</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Tour &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Tour Prog-cum-adv</a></li>
                                        <li><a class="dropdown-item" href="#">TA Bills</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">LTC Form </a></li>
                                <li><a class="dropdown-item" href="#">Loan &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Special Advance</a></li>
                                        <li><a class="dropdown-item" href="#">Mortgage Deed Form For Motor Vehicle</a></li>
                                        <li><a class="dropdown-item" href="#">Surety Bond For MVA(Appendix-B)</a></li>
                                        <li><a class="dropdown-item" href="#">Appendix-D (For Drawl Of MVA)</a></li>
                                        <li><a class="dropdown-item" href="#">Composite Personal Advance Surety Bond</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">PF &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">PF Nomination</a></li>
                                        <li><a class="dropdown-item" href="#">PF Settlement-Emp</a></li>
                                        <li><a class="dropdown-item" href="#">PF Settlement Nominee</a></li>
                                        <li><a class="dropdown-item" href="#">PF NR Loan(Land-House)</a></li>
                                        <li><a class="dropdown-item" href="#">EPFO's Declaration Form(Form 11)</a></li>
                                        <li><a class="dropdown-item" href="#">Form 10D(Pension)</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">NPS &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">NPS(CSRF1) Registration</a></li>
                                        <li><a class="dropdown-item" href="#">NPS Membership</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Application / NOC / Declaration &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Perquisite Forms</a></li>
                                        <li><a class="dropdown-item" href="#">Inclusion of Dependant family members</a></li>
                                        <li><a class="dropdown-item" href="#">Passport NOC</a></li>
                                        <li><a class="dropdown-item" href="#">Application for Gratuity</a></li>
                                        <li><a class="dropdown-item" href="#">Marriage Declaration Form</a></li>
                                        <li><a class="dropdown-item" href="#">Application of Paternity Leave</a></li>
                                        <li><a class="dropdown-item" href="#">HRA Reimbursement &raquo;</a>
                                            <ul class="submenu dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Annexure-B</a></li>
                                                <li><a class="dropdown-item" href="#">Annexure-C</a></li>
                                            </ul>
                                        </li>
                                        <li><a class="dropdown-item" href="#">Details of Foreign Visits</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Nomination &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Membership for Executive Family Welfare Scheme and Nomination</a></li>
                                        <li><a class="dropdown-item" href="#">Membership for NEFFARS and Nomination</a></li>
                                        <li><a class="dropdown-item" href="#">Membership for Benevolent Fund and Nomination</a></li>
                                        <li><a class="dropdown-item" href="#">Nomination for Group Insurance Scheme</a></li>
                                        <li><a class="dropdown-item" href="#">Nomination for Gratuity</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Income Tax &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Itax Proposal</a></li>
                                        <li><a class="dropdown-item" href="#">Income Tax HB Proposal</a></li>
                                        <li><a class="dropdown-item" href="#">IT 80U Declaration</a></li>
                                        <li><a class="dropdown-item" href="#">Declaration For Tution Fees</a></li>
                                        <li><a class="dropdown-item" href="#">Declaration for IT Exemption on LTC</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Requisition / Booking &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Request for Guest House Accommodation at S&P Complex</a></li>
                                        <li><a class="dropdown-item" href="#">Request for Guest House accommodation at Bhubaneswar</a></li>
                                        <li><a class="dropdown-item" href="#">Vehicle Requisition</a></li>
                                        <li><a class="dropdown-item" href="#">Air Ticket Booking</a></li>
                                        <li><a class="dropdown-item" href="#">Software Requisition</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Contract Cell &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">CONTRACT INITIATION FORM</a></li>
                                        <li><a class="dropdown-item" href="#">Justification of the estimate</a></li>
                                        <li><a class="dropdown-item" href="#">Inpriciple approval of CMD</a></li>
                                        <li><a class="dropdown-item" href="#">Work Completion Certificate</a></li>
                                        <li><a class="dropdown-item" href="#">No Due Certificate</a></li>
                                        <li><a class="dropdown-item" href="#">No Claim Certificate</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Purchase &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Inpriciple approval of CMD</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Training &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">External Trg Feedback</a></li>
                                        <li><a class="dropdown-item" href="#">Internship Application</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Systems &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">ISO 27001 Forms</a></li>
                                        <li><a class="dropdown-item" href="#">SAP USER CREATION,MODIFICATION REQUEST FORM</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Bilingual Templates &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">CO Letter Head</a></li>
                                        <li><a class="dropdown-item" href="#">IOM of Corporate Office</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">NDA Format &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">PDF</a></li>
                                        <li><a class="dropdown-item" href="#">Word Doc</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">DSC Application Form &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">DSC Application(Sify)</a></li>
                                        <li><a class="dropdown-item" href="#">DSC Application(SOP)</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Application for C-Type Quarter </a></li>
                                <li><a class="dropdown-item" href="#">Application for D-Type Quarter </a></li>

                            </ul>
                        </li>

                        <!-- Download Dropdown -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Downloads </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Medical Empanelled List </a></li>
                                <li><a class="dropdown-item" href="#">Find a Nalconinan(Old ver.) </a></li>
                                <li><a class="dropdown-item" href="#">Parichaya </a></li>
                                <li><a class="dropdown-item" href="#">Softwares &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">AnyDesk</a></li>
                                        <li><a class="dropdown-item" href="#">Acrobat Reader</a></li>
                                        <li><a class="dropdown-item" href="#">Chrome Browser</a></li>
                                        <li><a class="dropdown-item" href="#">Cleanup</a></li>
                                        <li><a class="dropdown-item" href="#">Cute PDF Writer</a></li>
                                        <li><a class="dropdown-item" href="#">dopdf</a></li>
                                        <li><a class="dropdown-item" href="#">Flashplayer</a></li>
                                        <li><a class="dropdown-item" href="#">Java</a></li>
                                        <li><a class="dropdown-item" href="#">Hindi Language</a></li>
                                        <li><a class="dropdown-item" href="#">Lotus Notes</a></li>
                                        <li><a class="dropdown-item" href="#">Mozilla Firefox</a></li>
                                        <li><a class="dropdown-item" href="#">NALCO PDF Utility</a></li>
                                        <li><a class="dropdown-item" href="#">Trend Micro Client</a></li>
                                        <li><a class="dropdown-item" href="#">Cisco VPN</a></li>
                                        <li><a class="dropdown-item" href="#">Polycom VC Screen share</a></li>
                                        <li><a class="dropdown-item" href="#">Polycom VC Desktop Client</a></li>
                                        <li><a class="dropdown-item" href="#">SAP Client</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Lokpal Assets & Liabilities </a></li>
                                <li><a class="dropdown-item" href="#">Information Security Awareness </a></li>
                            </ul>
                        </li>

                        <!-- Department Dropdown -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Department </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">HRD </a></li>
                                <li><a class="dropdown-item" href="#">Finanace </a></li>
                                <li><a class="dropdown-item" href="#">Systems / ERP &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Systems/IT</a></li>
                                        <li><a class="dropdown-item" href="#">SAP &raquo;</a>
                                            <ul class="submenu dropdown-menu">
                                                <li><a class="dropdown-item" href="#">SAP Password Reset</a></li>
                                                <li><a class="dropdown-item" href="#">SAP Password Reset User Manual</a></li>
                                                <li><a class="dropdown-item" href="#">ERP @ Nalco</a></li>
                                                <li><a class="dropdown-item" href="#">ERP Portal</a></li>
                                                <li><a class="dropdown-item" href="#">SRM7 Production</a></li>
                                                <li><a class="dropdown-item" href="#">SRM7 Quality</a></li>
                                                <li><a class="dropdown-item" href="#">SRM7 Development</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">Raj bhasa(राजभाषा) </a></li>
                            </ul>
                        </li>

                        <!-- Usefull Links -->

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Useful Links </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">NALCO's Portal for Apps - Outside Access &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Hamesha Nalconian</a></li>
                                        <li><a class="dropdown-item" href="#">CLMS Portal</a></li>
                                        <li><a class="dropdown-item" href="#">NALCO for MSE</a></li>
                                        <li><a class="dropdown-item" href="#">CSR</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">GST &raquo; </a>
                                    <ul class="submenu dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Overview</a></li>
                                        <li><a class="dropdown-item" href="#">LAW and procedures</a></li>
                                        <li><a class="dropdown-item" href="#">Benefits</a></li>
                                        <li><a class="dropdown-item" href="#">Registration</a></li>
                                        <li><a class="dropdown-item" href="#">IGST</a></li>
                                        <li><a class="dropdown-item" href="#">Meaning and Scope of Supply</a></li>
                                        <li><a class="dropdown-item" href="#">Imports</a></li>
                                        <li><a class="dropdown-item" href="#">Jobwork</a></li>
                                        <li><a class="dropdown-item" href="#">Input tax credit mechanism</a></li>
                                        <li><a class="dropdown-item" href="#">Transition Provisions</a></li>
                                        <li><a class="dropdown-item" href="#">Returns</a></li>
                                        <li><a class="dropdown-item" href="#">Recovery of Tax</a></li>
                                        <li><a class="dropdown-item" href="#">Refunds</a></li>
                                        <li><a class="dropdown-item" href="#">Accounts and Records</a></li>
                                        <li><a class="dropdown-item" href="#">TCS-Mechanism</a></li>
                                        <li><a class="dropdown-item" href="#">Inspection Search Seizure Arrest</a></li>
                                        <li><a class="dropdown-item" href="#">GST Practitioners</a></li>
                                        <li><a class="dropdown-item" href="#">Provisional GST ID</a></li>
                                        <li><a class="dropdown-item" href="#">FAQ(Second Edition)</a></li>
                                        <li><a class="dropdown-item" href="#">FAQ on Migration</a></li>
                                        <li><a class="dropdown-item" href="#">Notification 10</a></li>
                                        <li><a class="dropdown-item" href="#">Notification 11</a></li>
                                        <li><a class="dropdown-item" href="#">Notification 12</a></li>
                                        <li><a class="dropdown-item" href="#">Goods Rates</a></li>
                                        <li><a class="dropdown-item" href="#">Services Rates</a></li>
                                        <li><a class="dropdown-item" href="#">Importers & Exporters</a></li>
                                        <li><a class="dropdown-item" href="#">FAQ on exports</a></li>
                                        <li><a class="dropdown-item" href="#">Sectoral Series</a></li>
                                        <li><a class="dropdown-item" href="#">LD Treatment</a></li>
                                        <li><a class="dropdown-item" href="#">Metal Transportation</a></li>
                                        <li><a class="dropdown-item" href="#">Change in business process</a></li>
                                    </ul>
                                </li>
                                <li><a class="dropdown-item" href="#">NALCO Learning Portal </a></li>
                                <li><a class="dropdown-item" href="#">Nalco News </a></li>
                                <li><a class="dropdown-item" href="#">Bureau of Indian Standards </a></li>
                                <li><a class="dropdown-item" href="#">Indian Government </a></li>
                                <li><a class="dropdown-item" href="#">knowledge management portal for CPSEs </a></li>
                                <li><a class="dropdown-item" href="#">The Gazette of India </a></li>
                                <li><a class="dropdown-item" href="#">DPE </a></li>
                                <li><a class="dropdown-item" href="#">Income tax e-Filing </a></li>
                                <li><a class="dropdown-item" href="#">Login to NPS </a></li>
                                <li><a class="dropdown-item" href="#">Indian Rail Info </a></li>
                                <li><a class="dropdown-item" href="#">IRCTC </a></li>
                                <li><a class="dropdown-item" href="#">Flight Booking </a></li>
                                <li><a class="dropdown-item" href="#">Online SBI </a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- navbar-collapse.// -->
            </div>
            <!-- container-fluid.// -->
        </div>
    </nav>
    <!-- ============= NAV END// ============== -->

    <div class="row">
       

        <div class="col-md-3" style="padding-top: 30px; padding-left: 50px">
             <!-- This div for left side birthday and retirement Card -->
            <div class="card">
                <div class="card-body">
                 <div class="box-container">
  <div class="button-container">
    <button class="show-button birthday-button active" type="button" onclick="toggleWishes('birthday')"> Birthday </button>
    <button class="show-button retirement-button" type="button" onclick="toggleWishes('retirement')"> Retirement </button>
  </div>

  <div class="slideshow-container">
  </div>
</div>

<script>
    const birthdayEmployees = [
        {
            name: "John Doe",
            department: "Marketing",
            photo: "./img/00854.jpg",
        },
        {
            name: "Jane Smith",
            department: "Finance",
            photo: "./img/00855.jpg",
        }
        // Add more birthday employees as needed
    ];

    const retirementEmployees = [
        {
            name: "Michael Johnson",
            department: "Operations",
            photo: "./img/00856.jpg",
        },
        {
            name: "Sarah Anderson",
            department: "Human Resources",
            photo: "./img/00857.jpg",
        }
        // Add more retirement employees as needed
    ];

    const birthdayWish = "Wishing you a wonderful birthday!";
    const retirementWish = "Congratulations on your retirement! Enjoy your new journey!";

    let currentEmployees = birthdayEmployees.map(employee => ({ ...employee, wish: birthdayWish }));
    let currentIndex = 0;
    let slideshowInterval = null;
    const slideshowContainer = document.querySelector(".slideshow-container");
    let activeButton = document.querySelector(".birthday-button"); // Set the default active button

    function showSlide() {
        const employee = currentEmployees[currentIndex];
        const box = document.createElement("div");

        box.classList.add("wish-box");
        box.innerHTML = `
      <img class="employee-photo" src="${employee.photo}" alt="Employee Photo">
      <div class="employee-name">${employee.name}</div>
      <div class="employee-department">${employee.department}</div>
      <div class="wish-message">${employee.wish}</div>
    `;

        slideshowContainer.innerHTML = ""; // Clear previous content
        slideshowContainer.appendChild(box);

        box.style.display = "block";

        currentIndex++;
        if (currentIndex >= currentEmployees.length) {
            currentIndex = 0;
        }
    }

    function toggleWishes(occasion) {
        const showButton = document.querySelector(`.${occasion}-button`);
        const oppositeOccasion = occasion === "birthday" ? "retirement" : "birthday";
        const oppositeButton = document.querySelector(`.${oppositeOccasion}-button`);
        let employeesToShow;
        let wish;

        if (occasion === "birthday") {
            employeesToShow = birthdayEmployees;
            wish = birthdayWish;
        } else if (occasion === "retirement") {
            employeesToShow = retirementEmployees;
            wish = retirementWish;
        }

        if (activeButton !== showButton) {
            activeButton.classList.remove("active");
            clearInterval(slideshowInterval);
            activeButton = showButton;
            showButton.classList.add("active");
            slideshowContainer.innerHTML = "";
            currentEmployees = employeesToShow.map(employee => ({ ...employee, wish }));
            currentIndex = 0;
            showSlide();
            slideshowInterval = setInterval(showSlide, 2000);
        }
    }

    // Start the slideshow on page load
    slideshowInterval = setInterval(showSlide, 2000);
</script>
                </div>
                </div>
            
                <%--<div>--%>

  <style>

    .calendar-container {
      width: 100%; /* Set the width to adjust the size of the calendar */
      height: 100%; /* Set the height to make it a square + space for day names */
      margin: 0 auto;
      padding: 10px;
      /*border: 1px solid #ccc;*/
      /*border-radius: 5px;*/
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG4lGndD8FCuUqsH97mXu38B6dZLTA-yGdA1tDOnOUkPikTNuAYj4Df346v6E4rI6Y-bY&usqp=CAU');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
    }

    .calendar-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .calendar-grid {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 2px;
    }

    .day {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 30px; /* Adjust the height of each day box */
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .today {
      background-color: red;
    }

    #monthYear {
      font-size: 16px;
      font-weight: bold;
    }

    /* Style the date text to center it within the day box */
    .day span {
      display: block;
      text-align: center;
    }

    /* Style the names and dates of Saturday and Sunday in red */
    .day.weekend {
      color: red;
    }
    
  /* Add responsive styles for smaller screens */
  @media (max-width: 600px) {
    .calendar-container {
      width: 100%; /* Set width to 100% for smaller screens */
      height: auto; /* Let the height adjust automatically */
      padding: 5px; /* Reduce padding for smaller screens */
    }

    .calendar-header {
      flex-direction: column;
      align-items: center;
      margin-bottom: 5px;
    }

    .day {
      height: 20px; /* Adjust the height of each day box for smaller screens */
    }

    #monthYear {
      font-size: 14px; /* Decrease font size for smaller screens */
      margin-top: 5px;
    }
  }
  </style>
            <div class="card1" style="padding-top:20px; ">
            <div style="border: 2px solid #ccc; padding:15px;">
    <div class="calendar-container">
    <div class="calendar-header">
      <button type="button" onclick="prevMonth()" style="cursor: pointer;">
                <i class="fas fa-chevron-left"></i> <!-- Font Awesome "chevron-left" icon -->
            </button>
            <h2 id="monthYear"></h2>
            <button type="button" onclick="nextMonth()" style="cursor: pointer;">
                <i class="fas fa-chevron-right"></i> <!-- Font Awesome "chevron-right" icon -->
            </button>
    </div>
    <div class="calendar-grid" id="calendarGrid" style="font-weight:bold;">
      <div class="day">S</div>
      <div class="day">M</div>
      <div class="day">T</div>
      <div class="day">W</div>
      <div class="day">T</div>
      <div class="day">F</div>
      <div class="day">S</div>
      <!-- JavaScript will populate dates here -->
    </div>
  </div>
            </div>
                </div>

  <script>
      document.addEventListener("DOMContentLoaded", function () {
          const calendarGrid = document.getElementById("calendarGrid");
          const monthYearElement = document.getElementById("monthYear");

          let currentDate = new Date();

          function getHolidays(month, year) {
              // Customize the holiday list here based on the month and year
              const holidaysData = {
                  "0_2023": [1, 15], // January 2023
                  "2_2023": [8],     //March
                  "3_2023": [7],     // April
                  "4_2023": [1, 9],   // May
                  "5_2023": [15,20],  //Jun
                  "6_2023": [28],    // July 2023
                  "7_2023": [15, 30],   // August
                  "8_2023": [6, 29],    // September
                  "9_2023": [2, 24],   // October 2023
                  "10_2023": [27],    // November
                  "11_2023": [25],  // December 2023
                  // Add more months as needed
              };

              const key = `${month}_${year}`;
              return holidaysData[key] || [];
          }

          function renderCalendar() {
              const firstDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
              const lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
              const daysInMonth = lastDay.getDate();
              const startingDay = firstDay.getDay();

              monthYearElement.textContent = currentDate.toLocaleString("default", { month: "long", year: "numeric" });

              calendarGrid.innerHTML = "";

              const holidays = getHolidays(currentDate.getMonth(), currentDate.getFullYear());

              const dayNames = ["S", "M", "T", "W", "T", "F", "S"];
              dayNames.forEach(dayName => {
                  const dayElement = document.createElement("div");
                  dayElement.className = `day ${["S", "S"].includes(dayName) ? "weekend" : ""}`;
                  dayElement.textContent = dayName;
                  calendarGrid.appendChild(dayElement);
              });

              for (let i = 0; i < startingDay; i++) {
                  const dayElement = createDayElement();
                  calendarGrid.appendChild(dayElement);
              }

              for (let i = 1; i <= daysInMonth; i++) {
                  const dayElement = createDayElement(i);

                  if ([6, 0].includes(dayElement.date.getDay()) || holidays.includes(i)) {
                      dayElement.style.color = "red";
                  }

                  calendarGrid.appendChild(dayElement);

                  if (
                      i === currentDate.getDate() &&
                      currentDate.getMonth() === new Date().getMonth() &&
                      currentDate.getFullYear() === new Date().getFullYear()
                  ) {
                      dayElement.style.backgroundColor = "#A9A9A9";
                  }
              }
          }

          function createDayElement(dayNumber) {
              const dayElement = document.createElement("div");
              dayElement.className = `day ${[6, 0].includes(new Date(currentDate.getFullYear(), currentDate.getMonth(), dayNumber || 1).getDay()) ? "weekend" : ""}`;
              dayElement.style.display = "flex";
              dayElement.style.alignItems = "center";
              dayElement.style.justifyContent = "center";
              dayElement.style.height = "30px";
              dayElement.style.border = "1px solid #ccc";
              dayElement.style.borderRadius = "5px";
              dayElement.date = new Date(currentDate.getFullYear(), currentDate.getMonth(), dayNumber || 1);
              dayElement.textContent = dayNumber || "";
              return dayElement;
          }

          function prevMonth() {
              currentDate.setMonth(currentDate.getMonth() - 1);
              renderCalendar();
          }

          function nextMonth() {
              currentDate.setMonth(currentDate.getMonth() + 1);
              renderCalendar();
          }

          renderCalendar();

          // For debugging purposes
          window.prevMonth = prevMonth;
          window.nextMonth = nextMonth;
      });
  </script>

<%--</div>--%>
                
        </div>

        <%--This div for Middle Image slider Card--%>
        <div class="col-md-6" style="padding-top: 30px;">
            <div id="carouselExampleIndicators2" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner" style="height: 400px;">
                    <!-- Add inline style to increase height -->
                    <div class="carousel-item active">
                        <img src="img/TechnologyDay.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/TechnologyDay_2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/LiFECampaign.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <%--tab contrtrol--%>
            <div>
           <div class="tab-container" style="display: flex; flex-direction: column; max-width: 100%; margin: 0 auto; border: 1px solid #ccc; border-radius: 5px; overflow: hidden; padding: 5px;">
                 <div class="tab-buttons"style="background-color: #FFC0CB !important;">
                    <button type="button" class="tab-button active" onclick="showTab(0)"  style="color: #9f2221; font-weight:800; font-size:15px;">Imp Links</button>
                        <button type="button" class="tab-button" onclick="showTab(1)" style="color: #9f2221; font-weight:800; font-size:15px;">Notices</button>
                        <button type="button" class="tab-button" onclick="showTab(2)" style="color: #9f2221; font-weight:800; font-size:15px;">Circulars</button>
                        <button type="button" class="tab-button" onclick="showTab(3)" style="color: #9f2221; font-weight:800; font-size:15px;">Misc</button>
                        <button type="button" class="tab-button" onclick="showTab(4)" style="color: #9f2221; font-weight:800; font-size:15px;">Support</button>
                        <button type="button" class="tab-button" onclick="showTab(5)" style="color: #9f2221; font-weight:800; font-size:15px;">SA 800</button>
                        <button type="button" class="tab-button" onclick="showTab(6)" style="color: #9f2221; font-weight:800; font-size:15px;">CC & CSR</button>
                        <button type="button" class="tab-button" onclick="showTab(7)" style="color: #9f2221; font-weight:800; font-size:15px;">Blacklisted/Banned Vendors</button>
                        <button type="button" class="tab-button" onclick="showTab(8)" style="color: #9f2221; font-weight:800; font-size:15px;">HRD</button>
                 </div>
  
               <%--container for Imp Links--%>

                <div class="tab-content active" style="background-color:white";>
                   <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                     <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                      <ul>         
                         <li><a href="http://10.60.235.33" target="_blank">Nalco Applications</a></li>                           
                         <li><a href="https://nalcoindia.com/wp-login.php" target="_blank">Nalco Live Tenders - Login</a></li>                                
                         <li><a href="Applications\FindANalconian\CS.aspx" target="_blank">Find a Nalconian</a></li>
                         <li><a href="Applications\holidaylist\Default.aspx" target="_blank">Holiday List</a></li>          
                         <li><a href="http://10.1.5.7/Applications/Birthday/BirthDays.aspx" target="_blank" title="Birthday List (NALCO)">Birthday List @NALCO</a></li>
                         <li><a href="http://10.1.5.7/Applications/Retirment/SuperAnnEmp.aspx" target="_blank" title="Superannuating List @ NALCO">Superannuating List (NALCO)</a></li>                                        
                     </ul>
                    </div>
            <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
              <ul> 
                          <li><a href="https://mudira.nalcoindia.co.in/eOffice/default.aspx" target="_blank">eOffice@NALCO</a></li>        
                          <li><a href="http://10.1.5.7/SAMPARK/" target="_blank">SAMPARK</a></li>
                          <li><a href="https://nalcoindia.com/news-media/sanginee/" target="_blank">SANGINEE-2023(Apr - Jun)</a></li>
                          <li><a href="https://nalcoindia.com/news-media/akshar-magazine" target="_blank">Akshar Magazine</a></li>
                          <li><a href="NewsLetter/Anweshan.pdf" target="_blank">ANWESHAN e-Patrika</a></li>
                          <li><a href="Downloads/MOU/Signed_MOU.pdf" target="_blank">Signed MOU FY 2022-23&nbsp;</a></li> 

                </ul>
               </div>
            </div>
          </div>

               <%--container for Notices--%>
  
              <div class="tab-content">
                      <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                          <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                <li><a href="Policies/IOM checklist for payment.pdf" target="_blank">Checklists for Bills Submission to Finance Deptt.<img class="newImg" src="images\new_icons.gif" alt="New"></a>
                                </li>                                                          
                                <li><a href="Policies/Minimum_ContractLabourWages.pdf" target="_blank">Minimum Wages Rate Chart<img class="newImg" src="images\new_icons.gif" alt="New"></a>
                                </li>
                                <!--li><a href="Policies/IT_Resource_Allocation_Policy.pdf" target="_blank">IT Resource Allocation Policy<img class="newImg" src="images\new_icons.gif" alt="New" /></a>
                                </li-->
                                <li><a href="Policies/circular_email_nomenclature_20130917.pdf" target="_blank">E-mail ID nomenclature policy</a> </li>
                                <li><a href="Circulars/SOP%20NALCOS%20%20WEBSITE.pdf" target="_blank">SOP for NALCO's website maintenance</a> </li>                             

                            </ul>
                       </div>
                        <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                               <ul>
                  
                                  <li><a href="Notices/Exp_Eco_Measures1555_21_10_2013.pdf" target="_blank">Economy Measures: Dt.21-Oct-2013</a></li>
                                  <li><a href="Notices/Austerity-12.pdf" target="_blank">Economy measures: Dt.28-Jul-2012</a></li>
                                  <li><a href="Notices/Austerity-13.pdf" target="_blank">Austerity Measures: Dt.18-May-2013</a></li>    
                                  <li><a href="Policies/Vision, Mission &amp; Core values.pdf" target="_blank">Corporate Vision, Mission &amp; Core values</a> </li>
                                  <li><a href="/Notices/A Ready Reckoner-compressed and searchable.pdf" target="_blank">Compendium on Guidelines on Works, Goods and Services – A Ready Reckner</a> </li>
                             </ul>
                   </div>
                 </div>
               </div>

               <%--container for circulars--%>

                  <div class="tab-content">
                      <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                          <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                <li><a href="Policies/IOM checklist for payment.pdf" target="_blank">Checklists for Bills Submission to Finance Deptt.<img class="newImg" src="images\new_icons.gif" alt="New"></a>
                                </li>                                                          
                                <li><a href="Policies/Minimum_ContractLabourWages.pdf" target="_blank">Minimum Wages Rate Chart<img class="newImg" src="images\new_icons.gif" alt="New"></a>
                                </li>
                                <!--li><a href="Policies/IT_Resource_Allocation_Policy.pdf" target="_blank">IT Resource Allocation Policy<img class="newImg" src="images\new_icons.gif" alt="New" /></a>
                                </li-->
                                <li><a href="Policies/circular_email_nomenclature_20130917.pdf" target="_blank">E-mail ID nomenclature policy</a> </li>
                                <li><a href="Circulars/SOP%20NALCOS%20%20WEBSITE.pdf" target="_blank">SOP for NALCO's website maintenance</a> </li>                             

                            </ul>
                       </div>
                        <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                               <ul>
                  
                                  <li><a href="Notices/Exp_Eco_Measures1555_21_10_2013.pdf" target="_blank">Economy Measures: Dt.21-Oct-2013</a></li>
                                  <li><a href="Notices/Austerity-12.pdf" target="_blank">Economy measures: Dt.28-Jul-2012</a></li>
                                  <li><a href="Notices/Austerity-13.pdf" target="_blank">Austerity Measures: Dt.18-May-2013</a></li>    
                                  <li><a href="Policies/Vision, Mission &amp; Core values.pdf" target="_blank">Corporate Vision, Mission &amp; Core values</a> </li>
                                  <li><a href="/Notices/A Ready Reckoner-compressed and searchable.pdf" target="_blank">Compendium on Guidelines on Works, Goods and Services – A Ready Reckner</a> </li>
                             </ul>
                   </div>
                 </div>
               </div>

               <%--container for Misc--%>
              
                <div class="tab-content">
                      <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                         <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                              <ul>
                                  <li>
                                    <stname>CPPP :<b><a href="http://80.0.0.16/new2009/pdf/manual_dept_users.pdf" target="_blank">User Guide&nbsp;</a></b>&nbsp;</stname>
                                    |<stname><b><a href="http://80.0.0.16/new2009/pdf/manual_dept_users_1.pdf" target="_blank">Step By Step Guide&nbsp;</a></b>&nbsp;</stname>|<stname><b><a href="http://80.0.0.16/new2009/pdf/user_datasheet_nalco.doc" target="">User Datasheet Nalco&nbsp;</a></b>&nbsp;</stname></li>
                                <!-- <li><a id="photo_ss" href="#">Safety Day Celebration at CPP Snapshots</a></li>		 -->
                                <!-- <li id="ecc"><a href="#">Perquisites Option Submission for 2013-14 by Executives</a></li> -->
                                <li><b><a href="Departments/iso27001/iso27001.aspx" target="_blank">ISO 27001 Forms</a></b></li>
                                <li><b>Non Disclosure Agreement <a href="Departments/NDA format.pdf" target="_blank">[PDF Format]</a> | <a href="Departments/NDA format.docx" target="_blank">[Word Format]</a></b></li>
                                <li><a href="Downloads/sap_personal_numbers(all nalco).xls" title="SAP Personal No (Excel file)"> All Nalco Old to SAP P.No(Excel)</a>   </li>
                            </ul>
                 </div>
                            <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                              <ul>
                                <li>MIS: <a href="http://80.0.0.16/plantmis" target="_blank">
                                    <stname><b>Smelter|</b></stname>
                                </a><a href="http://10.10.1.3/Application/MIS/ROM/ROMB.htm" target="_blank">
                                    <stname><b>Mines|</b></stname>
                                </a><a href="http://nalcorefinery/cond/cond_index.htm" target="_blank">
                                    <stname><b>Refinery</b></stname>
                                </a></li>
                                <li><b><a href="System/doc/Procedure%20of%20making%20OCR%20based%20PDF%20files.pdf" target="_blank">Procedure of making OCR based PDF files</a></b></li>
                                <li><b><a href="System/doc/Guide-UsingDigitalSignatureCertificate.pdf" target="_blank">How to digitally Sign a document</a></b></li>
                                <li><b><a href="System/doc/gigw-manual.pdf" target="_blank">Guidelines For indian Government Websites(GIGW)</a></b></li>
                            </ul>
                        </div>
                      </div>
                </div> 

               <%--container for Support--%>

                        <div class="tab-content">
                            <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                               <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                
                                <li><a href="http://10.60.235.33/AssetMgmt/ComplaintRegistration.aspx" target="_blank">Call Registration </a></li>
                                <li><a href="http://10.60.235.33/Account/LoginCW.aspx" target="_blank">Call Maintenance (Hardware Team) </a></li>                               
                                <li>Downloads :<a href="http://80.0.0.16/download/" target="_blank">Smelter |</a><a href="http://nalcorefinery/downloads/downloads.htm" target="_blank">
                                    Refinery| </a><a href="ftp://10.40.0.20" target="_blank">CPP</a> </li>
                                <li><a href="Departments/iso27001/iso27001Forms/Change Request Form.docx" target="_blank" title="Software Change Request Form">Software Change Request Form <img class="newImg" src="images\new_icons.gif" alt="New"></a></li>
                                <li><a href="Downloads/SWRequisitionFormat.pdf" target="_blank" title="Software Requisition Format">Software Requisition Form </a></li>                              
                             </ul>
                            </div>
                                <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                                    <ul>
                                    <li><a href="http://10.1.5.7/feedback.htm" target="_blank">Feedback</a> </li>
                                    <li><a href="Downloads/citrix_application_restore.pdf" target="_blank" title="Citrix Restore">Restore Citrix Appln.</a> </li>
                                    <li><a href="http://nalcoinsight/cooltips/tips.htm" target="_blank" title="Tips for Password">Password Tips</a> </li>
                                    <li><a href="http://nalcoinsight/INFOQC/help%20manual.htm" target="_blank" title="Tips for Printer">Printer Tips</a> </li>
                                    <li><a href="http://nalcoinsight/cooltips/Tech%20Tips.pdf" target="_blank" title="PC Performance Booster">PC Performance Booster</a> </li>
                                
                                </ul>
                             </div>
                        </div>
                       </div>

               <%--container for SA 800--%>

                        <div class="tab-content">
                            <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                               <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                                 <ul>
                                
                                    <li>Standard(<a href="Downloads/SA8000 Standard 2014.pdf" target="_blank">English</a>&nbsp;||&nbsp;
                                     <a href="Policies/SA8000-2014_Hindi.pdf" target="_blank">Hindi)</a></li>
                                    <li><a href="Downloads/SA8000 2014 Auditor Guidance for Social Fingerprint.pdf" target="_blank">Guidance Doc</a></li>
                                    <li><a href="Downloads/SA8000-POLICY [Odiya].pdf" target="_blank">Policy(Odiya</a>&nbsp;||&nbsp;
                                     <a href="Downloads/SA8000-POLICY [Hindi].pdf" target="_blank">Hindi</a>&nbsp;||&nbsp;
                                     <a href="Downloads/SA8000-POLICY [English].pdf" target="_blank">English)</a></li>
                                    <li><a href="Downloads/SA8000/SPT_Committee.pdf" target="_blank">SPT Committee Members</a></li>                           
                                </ul>
                             </div>
                          <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                 <li><a href="Downloads/SA8000/HnS_Committee.pdf" target="_blank">H&amp;S Committee Members</a></li>
                                 <li><a href="Downloads/SA8000/WR_MR.pdf" target="_blank">MR/WR/SR/HR/FR</a></li>                            
                                 <li><a href="Downloads/EMPRevision-06.pdf" target="_blank">Emergency Management Plan</a></li>
			                     <li><a href="Downloads/HIRArecordupdated31Aug2021.pdf" target="_blank">HIRA Record</a></li>
                            </ul>
                        </div>
                    </div>
              </div> 

               <%--container for CC & CSR--%>

                        <div class="tab-content">
                            <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                               <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                                 <ul>
                                        <li><a href="Downloads/Parichaya/Parichaya.pdf" target="_blank">Parichaya</a> </li>
                            	        <li><a href="Downloads/CSR/PeripheryDevelopment.htm" target="_blank">Periphery Developments</a>
                            	        </li>
                            	        <li><a href="http://nalcoinsight/emplweb/birthday.asp" target="_blank">Birthday List</a>
                                        </li>                       
                                </ul>
                             </div>
                      <%--    <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                 <li><a href="Downloads/SA8000/HnS_Committee.pdf" target="_blank">H&amp;S Committee Members</a></li>
                                 <li><a href="Downloads/SA8000/WR_MR.pdf" target="_blank">MR/WR/SR/HR/FR</a></li>                            
                                 <li><a href="Downloads/EMPRevision-06.pdf" target="_blank">Emergency Management Plan</a></li>
			                     <li><a href="Downloads/HIRArecordupdated31Aug2021.pdf" target="_blank">HIRA Record</a></li>
                            </ul>
                        </div>--%>
                    </div>
              </div> 

               <%--container for Blacklisted/Banned Vendors--%>

                      <div class="tab-content">
                            <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                               <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                                 <ul>
                                        <li><a href="http://10.60.235.33/VendorBlackList/WebPages/BlacklistedVendorsList.aspx" target="_blank">Blacklisted Venders List</a> </li> 
                     
                                </ul>
                             </div>
                      <%--    <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                 <li><a href="Downloads/SA8000/HnS_Committee.pdf" target="_blank">H&amp;S Committee Members</a></li>
                                 <li><a href="Downloads/SA8000/WR_MR.pdf" target="_blank">MR/WR/SR/HR/FR</a></li>                            
                                 <li><a href="Downloads/EMPRevision-06.pdf" target="_blank">Emergency Management Plan</a></li>
			                     <li><a href="Downloads/HIRArecordupdated31Aug2021.pdf" target="_blank">HIRA Record</a></li>
                            </ul>
                        </div>--%>
                    </div>
              </div> 

               <%--container for HRD--%>

                      <div class="tab-content">
                            <div class="notice-content-container" style="display: flex; justify-content: space-between; margin-top: 10px;">
                               <div class="notice-content noticeContent1" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                                 <ul>
                                     	<li><a href="Policies/DOP/DOP_2011_Latest.pdf" target="_blank">DOP, 2011</a> </li>                             
                                          <li><a href="http://10.1.5.7/hrmanual.aspx" target="_blank">HR Department Page</a>
                                         </li>
                           
                                        <li><a href="http://10.1.5.175/nalcoeas" target="_blank" title="Executive Performance Appraisal System">
                                          Online Executive Appraisal</a>
                                         </li>                           
                                       <li><a href="Downloads/Empanelled_Hospitalsnew.pdf" target="_blank" title="List of Empanelled Hospitals(all units)">
                                          List of Empanelled Hospitals</a><img src="images\New_Gif2.gif" alt="New" width="20" height="12">
                                      </li>
                                         <li><a href="http://10.60.255.33/nalcocmc/index.aspx" target="_blank" title="Compliance Management">
                                        Compliance Management</a>
                                         </li>                          
                                </ul>
                             </div>
                      <%--    <div class="notice-content noticeContent2" style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                             <ul>
                                 <li><a href="Downloads/SA8000/HnS_Committee.pdf" target="_blank">H&amp;S Committee Members</a></li>
                                 <li><a href="Downloads/SA8000/WR_MR.pdf" target="_blank">MR/WR/SR/HR/FR</a></li>                            
                                 <li><a href="Downloads/EMPRevision-06.pdf" target="_blank">Emergency Management Plan</a></li>
			                     <li><a href="Downloads/HIRArecordupdated31Aug2021.pdf" target="_blank">HIRA Record</a></li>
                            </ul>
                        </div>--%>
                    </div>
              </div> 
         </div>


            <script>
                  function showTab(tabIndex) {
                     const tabContents = document.querySelectorAll('.tab-content');
                     const tabButtons = document.querySelectorAll('.tab-button');

                     tabContents.forEach(content => content.style.display = 'none');
                        tabContents[tabIndex].style.display = 'block';

                        tabButtons.forEach(button => button.classList.remove('active'));
                         tabButtons[tabIndex].classList.add('active');
                   }

                  // Show the default tab content on page load
                window.onload = function () {
                 showTab(0);
                };  
            </script>
     </div>
        
   </div>

        <%--This div for Right side card for ....--%>
        <div class="col-md-3" style="padding-top: 30px; padding-right: 50px">
             <div class="card">
                <div class="card-body">
             <div style="max-width: auto; margin: auto; border: 2px solid #ccc; padding: 10px;">
                 <h2 style="font-size: 18px; margin-bottom: 5px;">Check out our Twitter feed!</h2>
                 <p style="font-size: 14px; margin-bottom: 10px;">Stay updated with our latest tweets.</p>
                    <a class="twitter-timeline" data-height="250" data-width="100%" style="max-width: 100%; width: 100%; height: 100%;" href="https://twitter.com/NALCO_India?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor">Tweets by NALCO_India</a>
                </div>
                
            </div>
                 </div>
         <div class="card">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Accordion Item #1
                    </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
              <div class="nalcoData" style="font-family: Arial, Helvetica, sans-serif; margin-left:4px; margin-right:0px">
                
                <div id="naltab" style="font-family: Arial, Helvetica, sans-serif">
                 <table>
                     <tbody><tr>
                        <td style="height: 100%; width: 100%; padding-bottom: 0px; border: 0px;" align="center">
                            <a href="https://ndl.iitkgp.ac.in/" target="_blank"><img src="img/NDL (2).jpg" style="height: 100%; width: 100%;"></a>
                           </td>
                    </tr>
                 </tbody></table>                     
                </div>
            </div>
          </div>
        </div>
      </div>
             <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        Accordion Item #2
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                <div id="motive_slides">     
    <!-- Motivational Slides-->
    <a href="https://theminingarena.in" target="_blank">
    <img src="http://10.1.5.7/images/nalco_slides/mm.jpg" alt="Slideshow Image Script" title="" name="slide" style="width:100%; height:100%; align-items:center; padding:0; margin:0;"> 
    </a>
    <script type="text/javascript">
        slideshowimages("images/nalco_slides/mm.jpg")
        var slideshowspeed = 8000
        var whichimage = 0
        function slideit() {
            if (!document.images)
                return
            document.images.slide.src = slideimages[whichimage].src

            if (whichimage < slideimages.length - 1)
                whichimage++
            else
                whichimage = 0
            setTimeout("slideit()", slideshowspeed)
        }
        slideit()
    </script>
    <!-- Script by hscripts.com -->  
    </div>
          </div>
        </div>
      </div>
    </div>

            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </div>

        </div>
</asp:Content>
