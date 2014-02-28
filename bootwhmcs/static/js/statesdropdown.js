var states = new Array();
states['AU'] = ["Australian Capital Territory","New South Wales","Northern Territory","Queensland","South Australia","Tasmania","Victoria","Western Australia","end"];
states['BR'] = ["AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO","end"];
states['CA'] = ["Alberta","British Columbia","Manitoba","New Brunswick","Newfoundland","Northwest Territories","Nova Scotia","Nunavut","Ontario","Prince Edward Island","Quebec","Saskatchewan","Yukon Territory","end"];
states['FR'] = ["Ain","Aisne","Allier","Alpes-de-Haute-Provence","Hautes-Alpes","Alpes-Maritimes","Ardèche","Ardennes","Ariège","Aube","Aude","Aveyron","Bouches-du-Rhône","Calvados","Cantal","Charente","Charente-Maritime","Cher","Corrèze","Corse-du-Sud", "Haute-Corse", "Côte-d'Or", "Côtes-d'Armor", "Creuse", "Dordogne", "Doubs", "Drôme", "Eure", "Eure-et-Loir", "Finistère", "Gard", "Haute-Garonne", "Gers", "Gironde", "Hérault", "Ille-et-Vilaine", "Indre", "Indre-et-Loire", "Isère", "Jura", "Landes", "Loir-et-Cher", "Loire", "Haute-Loire", "Loire-Atlantique", "Loiret", "Lot", "Lot-et-Garonne", "Lozère", "Maine-et-Loire", "Manche", "Marne", "Haute-Marne", "Mayenne", "Meurthe-et-Moselle", "Meuse", "Morbihan", "Moselle", "Nièvre", "Nord", "Oise", "Orne", "Pas-de-Calais", "Puy-de-Dôme", "Pyrénées-Atlantiques", "Hautes-Pyrénées", "Pyrénées-Orientales", "Bas-Rhin", "Haut-Rhin", "Rhône", "Haute-Saône", "Saône-et-Loire", "Sarthe", "Savoie", "Haute-Savoie", "Paris", "Seine-Maritime", "Seine-et-Marne", "Yvelines", "Deux-Sèvres", "Somme", "Tarn", "Tarn-et-Garonne", "Var", "Vaucluse", "Vendée", "Vienne", "Haute-Vienne", "Vosges", "Yonne", "Territoire de Belfort", "Essonne", "Hauts-de-Seine", "Seine-Saint-Denis", "Val-de-Marne", "Val-d'Oise", "Guadeloupe", "Martinique", "Guyane", "La Réunion", "Mayotte","end"];
states['DE'] = ["Baden-Wuerttemberg","Bayern","Berlin","Brandenburg","Bremen","Hamburg","Hessen","Mecklenburg-Vorpommern","Niedersachsen","Nordrhein-Westfalen","Rheinland-Pfalz","Saarland","Sachsen","Sachsen-Anhalt","Schleswig-Holstein","Thueringen","end"];
states['ES'] = ["ARABA","ALBACETE","ALICANTE","ALMERIA","AVILA","BADAJOZ","ILLES BALEARS","BARCELONA","BURGOS","CACERES","CADIZ","CASTELLON","CIUDAD REAL","CORDOBA","CORUÑA, A","CUENCA","GIRONA","GRANADA","GUADALAJARA","GIPUZKOA","HUELVA","HUESCA","JAEN","LEON","LLEIDA","RIOJA, LA","LUGO","MADRID","MALAGA","MURCIA","NAVARRA","OURENSE","ASTURIAS","PALENCIA","PALMAS, LAS","PONTEVEDRA","SALAMANCA","SANTA CRUZ DE TENERIFE","CANTABRIA","SEGOVIA","SEVILLA","SORIA","TARRAGONA","TERUEL","TOLEDO","VALENCIA","VALLADOLID","BIZKAIA","ZAMORA","ZARAGOZA","CEUTA","MELILLA","end"];
states['IN'] = ["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Punjab","Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttar Pradesh","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli","Daman and Diu","Lakshadweep","Puducherry","end"];
states['IT'] = ["AG", "AL", "AN", "AO", "AR", "AP", "AT", "AV", "BA", "BL", "BN", "BG", "BI", "BO", "BZ", "BS", "BR", "CA", "CL", "CB", "CI", "CE", "CT", "CZ", "CH", "CO", "CS", "CR", "KR", "CN", "EN", "FE", "FI", "FG", "FC", "FR", "GE", "GO", "GR", "IM", "IS", "SP", "AQ", "LT", "LE", "LC", "LI", "LO", "LU", "MB", "MC", "MN", "MS", "MT", "ME", "MI", "MO", "NA", "NO", "NU", "OT", "OR", "PD", "PA", "PR", "PV", "PG", "PU", "PE", "PC", "PI", "PT", "PN", "PZ", "PO", "RG", "RA", "RC", "RE", "RI", "RN", "RM", "RO", "SA", "VS", "SS", "SV", "SI", "SR", "SO", "TA", "TE", "TR", "TO", "OG", "TP", "TN", "TV", "TS", "UD", "VA", "VE", "VB", "VC", "VR", "VV", "VI", "VT","end"];
states['NL'] = ["Drenthe","Flevoland","Friesland","Gelderland","Groningen","Limburg","Noord-Brabant","Noord-Holland","Overijssel","Utrecht","Zeeland","Zuid-Holland","end"];
states['NZ'] = ["Northland","Auckland","Waikato","Bay of Plenty","Gisborne","Hawkes Bay","Taranaki","Manawatu-Wanganui","Wellington","Tasman","Nelson","Marlborough","West Coast","Canterbury","Otago","Southland","end"];
states['GB'] = ["Avon","Aberdeenshire","Angus","Argyll and Bute","Barking and Dagenham","Barnet","Barnsley","Bath and North East Somerset","Bedfordshire","Berkshire","Bexley","Birmingham","Blackburn with Darwen","Blackpool","Blaenau Gwent","Bolton","Bournemouth","Bracknell Forest","Bradford","Brent","Bridgend","Brighton and Hove","Bromley","Buckinghamshire","Bury","Caerphilly","Calderdale","Cambridgeshire","Camden","Cardiff","Carmarthenshire","Ceredigion","Cheshire","Cleveland","City of Bristol","City of Edinburgh","City of Kingston upon Hull","City of London","Clackmannanshire","Conwy","Cornwall","Coventry","Croydon","Cumbria","Darlington","Denbighshire","Derby","Derbyshire","Devon","Doncaster","Dorset","Dudley","Dumfries and Galloway","Dundee City","Durham","Ealing","East Ayrshire","East Dunbartonshire","East Lothian","East Renfrewshire","East Riding of Yorkshire","East Sussex","Eilean Siar (Western Isles)","Enfield","Essex","Falkirk","Fife","Flintshire","Gateshead","Glasgow City","Gloucestershire","Greenwich","Gwynedd","Hackney","Halton","Hammersmith and Fulham","Hampshire","Haringey","Harrow","Hartlepool","Havering","Herefordshire","Hertfordshire","Highland","Hillingdon","Hounslow","Inverclyde","Isle of Anglesey","Isle of Wight","Islington","Kensington and Chelsea","Kent","Kingston upon Thames","Kirklees","Knowsley","Lambeth","Lancashire","Leeds","Leicester","Leicestershire","Lewisham","Lincolnshire","Liverpool","London","Luton","Manchester","Medway","Merthyr Tydfil","Merton","Merseyside","Middlesbrough","Middlesex","Midlothian","Milton Keynes","Monmouthshire","Moray","Neath Port Talbot","Newcastle upon Tyne","Newham","Newport","Norfolk","North Ayrshire","North East Lincolnshire","North Lanarkshire","North Lincolnshire","North Somerset","North Tyneside","North Yorkshire","Northamptonshire","Northumberland","North Humberside","Nottingham","Nottinghamshire","Oldham","Orkney Islands","Oxfordshire","Pembrokeshire","Perth and Kinross","Peterborough","Plymouth","Poole","Portsmouth","Powys","Reading","Redbridge","Renfrewshire","Rhondda Cynon Taff","Richmond upon Thames","Rochdale","Rotherham","Rutland","Salford","Sandwell","Sefton","Sheffield","Shetland Islands","Shropshire","Slough","Solihull","Somerset","South Ayrshire","South Humberside","South Gloucestershire","South Lanarkshire","South Tyneside","Southampton","Southend-on-Sea","Southwark","South Yorkshire","St. Helens","Staffordshire","Stirling","Stockport","Stockton-on-Tees","Stoke-on-Trent","Suffolk","Sunderland","Surrey","Sutton","Swansea","Swindon","Tameside","Telford and Wrekin","The Scottish Borders","The Vale of Glamorgan","Thurrock","Torbay","Torfaen","Tower Hamlets","Trafford","Tyne and Wear","Wakefield","Walsall","Waltham Forest","Wandsworth","Warrington","Warwickshire","West Midlands","West Dunbartonshire","West Lothian","West Sussex","West Yorkshire","Westminster","Wigan","Wiltshire","Windsor and Maidenhead","Wirral","Wokingham","Wolverhampton","Worcestershire","Wrexham","York","Co. Antrim","Co. Armagh","Co. Down","Co. Fermanagh","Co. Londonderry","Co. Tyrone","end"];
states['US'] = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","District of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming","end"];

jQuery(document).ready(function(){

    jQuery("input[name=state]").attr("id","stateinput");

    jQuery("select[name=country]").change(function() {
        statechange();
    });

    statechange();

});

function statechange() {
    var state = jQuery("#stateinput").val();
    var country = jQuery("select[name=country]").val();
    if (typeof(statesTab) == "undefined") statesTab = '';
    if (states[country]) {
        jQuery("#stateinput").hide();
        jQuery("#stateinput").removeAttr("name");
        jQuery("#stateselect").remove();
        var stateops = '';
        for (key in states[country]) {
            stateval = states[country][key];
            if (stateval=="end") break;
            stateops += '<option';
            if (stateval==state) stateops += ' selected="selected"'
            stateops += '>'+stateval+'</option>';
        }
        if(statesTab != '') { statesTab = ' tabindex="'+statesTab+'"'; }
        jQuery("#stateinput").parent().append('<select name="state" class="form-control" id="stateselect"'+statesTab+'><option value="">Choose One...</option>'+stateops+'</select>');
    } else {
        jQuery("#stateselect").remove();
        jQuery("#stateinput").show();
        jQuery("#stateinput").attr("name","state");
    }
}