	// set up drop downs anywhere in the body of the page. I think the bottom of the page is better.. 
	// but you can experiment with effect on loadtime.
	if (mtDropDown.isSupported()) {

		//==================================================================================================
		// create a set of dropdowns
		//==================================================================================================
		// the first param should always be down, as it is here
		//
		// The second and third param are the top and left offset positions of the menus from their actuators
		// respectively. To make a menu appear a little to the left and bottom of an actuator, you could use
		// something like -5, 5
		//
		// The last parameter can be .topLeft, .bottomLeft, .topRight, or .bottomRight to inidicate the corner
		// of the actuator from which to measure the offset positions above. Here we are saying we want the 
		// menu to appear directly below the bottom left corner of the actuator
		//==================================================================================================
		var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0, mtDropDown.reference.topRight);

		//==================================================================================================
		// create a dropdown menu
		//==================================================================================================
		// the first parameter should be the HTML element which will act actuator for the menu
		//==================================================================================================
		
		// menu : AboutUs
		var menu1 = ms.addMenu(document.getElementById("menu1"));
		
     	//	dim dbcon As New SqlConnection()
        //  dbcon.ConnectionString = ConfigurationSettings.AppSettings("SqlConnection")
        //If dbcon.State = ConnectionState.Closed Then dbcon.Open()
        //Dim cmd As New SqlCommand()
        //Dim reader As SqlDataReader
        //Dim str As String
        //cmd.CommandText = "Select * from sitemenu where parentmenuid=2 order by menuid"
        //cmd.Connection = dbcon
        //reader = cmd.ExecuteReader()		
		//While reader.read
		  //  menu1.addItem("- rssubmnu1("menuname")","rssubmnu1("filename")");
			//menu1.addItem("- Corporate Profile", "missionvision.aspx"); // send no URL if nothing should happen onclick
			//reader.movenext
		//wend
				
		menu1.addItem("- Police Mission, CID Mission", "missionvision.aspx");  // send no URL if nothing should happen onclick
		//menu1.addItem("- History", "mainaboutushistory.aspx");
		menu1.addItem("- Chiefs - Then & Now", "chiefs.aspx");
		menu1.addItem("- Organisation", "mainaboutusorg.aspx"); // send no URL if nothing should happen onclick
		menu1.addItem("- CID Today", "mainaboutuscidtoday.aspx");
		// menu
		//==================================================================================================

		//==================================================================================================
		// add a sub-menu
		//==================================================================================================
		// to add a sub menu to an existing menu object, call it's addMenu method and pass it the item from
		// the parent menu which should act as it's actuator. To add a submenu to the fourth item of a menu
		// called "theMenu", you would do theMenu.addMenu(theMenu.items[3])
		//==================================================================================================
		
		// submenu : Organisation
		var subMenu1 = menu1.addMenu(menu1.items[2]);
		subMenu1.addItem("- Organisation Structure", "orgstructure.aspx");
		//subMenu1.addItem("- Message from DGP - AP Police", "aboutusmsgdgp.aspx");
		subMenu1.addItem("- Message from Addl. DG - CID", "aboutusmsgs.aspx");
		// submenu
		
		// submenu : History
		//var subMenu2 = menu1.addMenu(menu1.items[2]);
		//subMenu2.addItem("- Establishment Details", "establishment.aspx");
		//subMenu2.addItem("- Chiefs - Then & Now", "chiefs.aspx");		
		// submenu
		
		// submenu : CIDToday
		var subMenu3 = menu1.addMenu(menu1.items[3]);
		subMenu3.addItem("- Current Leadership", "currentleadership.aspx");
		subMenu3.addItem("- CID Functions", "rolesfunctions.aspx");
		subMenu3.addItem("- Action Plans", "actionplans.aspx");
		// submenu

		// menu : WantedCriminals
		var menu2 = ms.addMenu(document.getElementById("menu2"));		
		menu2.addItem("- Top Ten Most Wanted Criminals", "topwc.aspx");
		menu2.addItem("- All Wanted Criminals", "allwc.aspx?cmd=all");
		menu2.addItem("- Economic Offenders", "allwc.aspx?cmd=eo");
		//menu2.addItem("- Accused in the Attack on CM of AP", "wantedcriminals.aspx");
		//menu2.addItem("- Accused in the Attack on CM of AP", "wantedcriminals.aspx");
		// menu
		
		// menu : MissingPersons
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("- Recently Missing", "recentmp.aspx");		
		menu3.addItem("- All Missing Persons", "allmp.aspx");
		// menu

		// menu : UnclaimedVehicles
		var menu5 = ms.addMenu(document.getElementById("menu5"));
		menu5.addItem("- All Missing Vehilces", "allmv.aspx");
		menu5.addItem("- All Unclaimed Vehicles", "alluv.aspx");		
		menu5.addItem("- Vehicle Information Document", "VehInfoDoc.aspx");
		// menu
			
		// menu : UnidentifiedBodies
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("- Recent Unidentified Bodies", "recentuibodies.aspx");
		menu4.addItem("- All Unidentified Bodies", "alluibodies.aspx");
		// menu
				
		// menu : WhiteCollerCrimes
		var menu6 = ms.addMenu(document.getElementById("menu6"));
		//menu6.addItem("- All White Collar Crimes", "allwcc.aspx");		
		menu6.addItem("- Cyber Crimes", "cybercrimes.aspx");		
		menu6.addItem("- Economic Offences", "EconomicOffences.aspx");		
		menu6.addItem("- Report Internet Fraud", "ifcc.aspx");		
		// menu
		
		// menu : PublicAletrs
		var menu7 = ms.addMenu(document.getElementById("menu7"));				
		//menu7.addItem("- Details of Criminal Gangs", "detailsofgangs.aspx");
		menu7.addItem("- Crime Alerts", "allcrimealerts.aspx");
menu7.addItem("- Road Safety", "RoadSafety.aspx");
		menu7.addItem("- Before You Invest", "BeforeInvest.aspx");
		menu7.addItem("- Counterfeit Currency", "CounterfeitCurrency.aspx");
		menu7.addItem("- Foreign Jobs", "employmentalerts.aspx");
		menu7.addItem("- Youth and Drugs", "YoungDrugs.aspx");
		menu7.addItem("- ATM Security", "YoungDrugs.aspx?Name=ATM");
		menu7.addItem("- ATM Steal", "YoungDrugs.aspx?Name=ATMSteal");
		menu7.addItem("- Burglary Prevention", "BurglaryPrevention.aspx");
		menu7.addItem("- Suspicious Objects", "SuspiciousObjects.aspx");
		menu7.addItem("- House Safety", "housesafealalerts.aspx");
		menu7.addItem("- Before Buying House/ Flat", "BuyingHouse.aspx");
		menu7.addItem("- Simple Tips for Secure E-Mail", "BuyingLand.aspx");
		menu7.addItem("- Parental Guide to Internet Safety", "parentguide.aspx");
		menu7.addItem("- Companies Rejected by RBI", "rbialerts.aspx");		
		// menu
				
		// menu : Library&References
		var menu8 = ms.addMenu(document.getElementById("menu8"));
		menu8.addItem("- Significant Dates", "significantdates.aspx");
		menu8.addItem("- Famous Cases", "famouscases.aspx");
		menu8.addItem("- CID e-News", "cidenews.aspx");
		menu8.addItem("- Recent Press Releases", "recentpressreleases.aspx?cmd=pr");
		menu8.addItem("- CID Journals", "publications.aspx");
		menu8.addItem("- IT Act, 2000", "librefitact2000.aspx");
		menu8.addItem("- IT Notifications", "Itnotifications.aspx");
		//menu8.addItem("- The Freedom of IT Act, 2002", "freedomitact2002.aspx");
		menu8.addItem("- Crime Statistics", "ucrimereports.aspx");		
		menu8.addItem("- Organised Crime Act 2001", "organizedcrimeact.aspx");		
		menu8.addItem("- Judgements", "judgements.aspx");
		//menu8.addItem("- Archives of Press Releases", "recentpressreleases.aspx?cmd=lib");
		menu8.addItem("- Interpol Application Forms", "InterpolForms.aspx");
		//	menu8.addItem("- Daily Crime Information","specialuser.aspx?name=dci"); //"DailyCrime.aspx");	
				menu8.addItem("- E-CIG","specialuser.aspx?name=ecig");//'"eciglinks.aspx");	
					menu8.addItem("- SCRB Forms", "scrb.aspx");		
		// menu

		// menu : PressRoom
		var menu9 = ms.addMenu(document.getElementById("menu9"));		
		//menu9.addItem("- Recent Press Releases", "recentpressreleases.aspx?cmd=pr");
		//menu9.addItem("- Field News", "fieldnews.aspx");
		//menu9.addItem("- Gotcha", "gotcha.aspx");
		//menu9.addItem("- CID e-News", "cidenews.aspx");
		//menu9.addItem("- Attack on Sri.Chandra Babu", "wantedcriminals.aspx?head=Attack");
		menu9.addItem("- Other Crimes", "specialuser.aspx?name=OC");
		// menu
		
		// menu : JailReleases
		var menu10 = ms.addMenu(document.getElementById("menu10"));		
		menu10.addItem("- Recent Jail Releases", "alljr.aspx");
		// menu
		// menu : Arms and Ammunitions
		var menu11 = ms.addMenu(document.getElementById("menu11"));		
		menu11.addItem("- Lost and Stolen", "armslostandstolen.aspx");
		menu11.addItem("- Found and Recovered", "armsfoundandrecovered.aspx");
		//menu11.addItem("- Ammunitions Lost and Stolen", "ammunitionslostandstolen.aspx");
		//menu11.addItem("- Ammunitions Found and Recovered", "ammunitionsfoundandrecovered.aspx");
		// menu
		var menu12 = ms.addMenu(document.getElementById("menu12"));		
		menu12.addItem("- Dacoit Gangs", "specialuser.aspx?name=dg");
		menu12.addItem("- Robbery Gangs", "specialuser.aspx?name=rg");
		menu12.addItem("- Other Types", "#");
		//sub-sub menus for Gangs
		var subMenu4 = menu12.addMenu(menu12.items[2]);
		subMenu4.addItem("- Kidnapping for Begging", "specialuser.aspx?name=kb");
		subMenu4.addItem("- Kidnapping for Prostitution", "specialuser.aspx?name=kp");
		subMenu4.addItem("- Kidnapping for Ransom", "specialuser.aspx?name=kr");
		//Added by Shravan Start
		//menu12.addItem("- Crime Types", "specialuser.aspx?name=ct");
		//Added by Shravan End
		//menu12.addItem("- Robbery Gangs", "robberygangs.aspx");
		//==================================================================================================
		// write drop downs into page
		//==================================================================================================
		// this method writes all the HTML for the menus into the page with document.write(). It must be
		// called within the body of the HTML page.
		//==================================================================================================
		mtDropDown.renderAll();
	}