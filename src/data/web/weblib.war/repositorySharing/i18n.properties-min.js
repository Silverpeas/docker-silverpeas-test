(function(){if(typeof window.i18n==="undefined"||window.i18n===null){window.i18n={}}window.i18n.map={};window.i18n.properties=function(settings){var defaults={name:"Messages",language:"",path:"",mode:"vars",cache:false,encoding:"UTF-8",async:false,checkAvailableLanguages:false,callback:null};settings=$.extend(defaults,settings);settings.language=this.normaliseLanguageCode(settings.language);var languagesFileLoadedCallback=function(languages){settings.totalFiles=0;settings.filesLoaded=0;var files=getFiles(settings.name);if(settings.async){for(var i=0,j=files.length;i<j;i++){settings.totalFiles+=1;var shortCode=settings.language.substring(0,2);if(languages.length==0||$.inArray(shortCode,languages)!=-1){settings.totalFiles+=1}if(settings.language.length>=5){var longCode=settings.language.substring(0,5);if(languages.length==0||$.inArray(longCode,languages)!=-1){settings.totalFiles+=1}}}}var defaultFileName,shortFileName,longFileName;for(var k=0,m=files.length;k<m;k++){defaultFileName=settings.path+files[k]+".properties";var shortCode=settings.language.substring(0,2);if(languages.length==0||$.inArray(shortCode,languages)!=-1){shortFileName=settings.path+files[k]+"_"+shortCode+".properties"}if(settings.language.length>=5){var longCode=settings.language.substring(0,5);if(languages.length==0||$.inArray(longCode,languages)!=-1){longFileName=settings.path+files[k]+"_"+longCode+".properties"}}loadAndParseFiles([defaultFileName,shortFileName,longFileName],settings);defaultFileName=shortFileName=longFileName=null}if(settings.callback&&!settings.async){settings.callback()}};if(settings.checkAvailableLanguages){$.ajax({url:settings.path+"languages.json",async:settings.async,cache:false,success:function(data,textStatus,jqXHR){languagesFileLoadedCallback(data.languages||[])}})}else{languagesFileLoadedCallback([])}};window.i18n.prop=function(key){var value=window.i18n.map[key];if(value==null){return"["+key+"]"}var phvList;if(arguments.length==2&&$.isArray(arguments[1])){phvList=arguments[1]}var i;if(typeof(value)=="string"){i=0;while((i=value.indexOf("\\",i))!=-1){if(value.charAt(i+1)=="t"){value=value.substring(0,i)+"\t"+value.substring((i++)+2)}else{if(value.charAt(i+1)=="r"){value=value.substring(0,i)+"\r"+value.substring((i++)+2)}else{if(value.charAt(i+1)=="n"){value=value.substring(0,i)+"\n"+value.substring((i++)+2)}else{if(value.charAt(i+1)=="f"){value=value.substring(0,i)+"\f"+value.substring((i++)+2)}else{if(value.charAt(i+1)=="\\"){value=value.substring(0,i)+"\\"+value.substring((i++)+2)}else{value=value.substring(0,i)+value.substring(i+1)}}}}}}var arr=[],j,index;i=0;while(i<value.length){if(value.charAt(i)=="'"){if(i==value.length-1){value=value.substring(0,i)}else{if(value.charAt(i+1)=="'"){value=value.substring(0,i)+value.substring(++i)}else{j=i+2;while((j=value.indexOf("'",j))!=-1){if(j==value.length-1||value.charAt(j+1)!="'"){value=value.substring(0,i)+value.substring(i+1,j)+value.substring(j+1);i=j-1;break}else{value=value.substring(0,j)+value.substring(++j)}}if(j==-1){value=value.substring(0,i)+value.substring(i+1)}}}}else{if(value.charAt(i)=="{"){j=value.indexOf("}",i+1);if(j==-1){i++}else{index=parseInt(value.substring(i+1,j));if(!isNaN(index)&&index>=0){var s=value.substring(0,i);if(s!=""){arr.push(s)}arr.push(index);i=0;value=value.substring(j+1)}else{i=j+1}}}else{i++}}}if(value!=""){arr.push(value)}value=arr;window.i18n.map[key]=arr}if(value.length==0){return""}if(value.length==1&&typeof(value[0])=="string"){return value[0]}var str="";for(i=0;i<value.length;i++){if(typeof(value[i])=="string"){str+=value[i]}else{if(phvList&&value[i]<phvList.length){str+=phvList[value[i]]}else{if(!phvList&&value[i]+1<arguments.length){str+=arguments[value[i]+1]}else{str+="{"+value[i]+"}"}}}}return str};function callbackIfComplete(settings){if(settings.async){settings.filesLoaded+=1;if(settings.filesLoaded===settings.totalFiles){if(settings.callback){settings.callback()}}}}function loadAndParseFiles(filenames,settings){if(filenames!=null&&filenames.length>0){loadAndParseFile(filenames[0],settings,function(){filenames.shift();loadAndParseFiles(filenames,settings)})}}function loadAndParseFile(filename,settings,next){if(filename!=null){$.ajax({url:filename,async:settings.async,cache:settings.cache,dataType:"text",success:function(data,status){parseData(data,settings.mode);next();callbackIfComplete(settings)},error:function(jqXHR,textStatus,errorThrown){console.log("Failed to download or parse "+filename);callbackIfComplete(settings)}})}}function parseData(data,mode){var parsed="";var parameters=data.split(/\n/);var regPlaceHolder=/(\{\d+})/g;var regRepPlaceHolder=/\{(\d+)}/g;var unicodeRE=/(\\u.{4})/ig;for(var i=0;i<parameters.length;i++){parameters[i]=parameters[i].replace(/^\s\s*/,"").replace(/\s\s*$/,"");if(parameters[i].length>0&&parameters[i].match("^#")!="#"){var pair=parameters[i].split("=");if(pair.length>0){var name=decodeURI(pair[0]).replace(/^\s\s*/,"").replace(/\s\s*$/,"");var value=pair.length==1?"":pair[1];while(value.match(/\\$/)=="\\"){value=value.substring(0,value.length-1);value+=parameters[++i].replace(/\s\s*$/,"")}for(var s=2;s<pair.length;s++){value+="="+pair[s]}value=value.replace(/^\s\s*/,"").replace(/\s\s*$/,"");if(mode=="map"||mode=="both"){var unicodeMatches=value.match(unicodeRE);if(unicodeMatches){for(var u=0;u<unicodeMatches.length;u++){value=value.replace(unicodeMatches[u],unescapeUnicode(unicodeMatches[u]))}}window.i18n.map[name]=value}if(mode=="vars"||mode=="both"){value=value.replace(/"/g,'\\"');checkKeyNamespace(name);if(regPlaceHolder.test(value)){var parts=value.split(regPlaceHolder);var first=true;var fnArgs="";var usedArgs=[];for(var p=0;p<parts.length;p++){if(regPlaceHolder.test(parts[p])&&(usedArgs.length==0||usedArgs.indexOf(parts[p])==-1)){if(!first){fnArgs+=","}fnArgs+=parts[p].replace(regRepPlaceHolder,"v$1");usedArgs.push(parts[p]);first=false}}parsed+=name+"=function("+fnArgs+"){";var fnExpr='"'+value.replace(regRepPlaceHolder,'"+v$1+"')+'"';parsed+="return "+fnExpr+";};"}else{parsed+=name+'="'+value+'";'}}}}}eval(parsed)}function checkKeyNamespace(key){var regDot=/\./;if(regDot.test(key)){var fullname="";var names=key.split(/\./);for(var i=0;i<names.length;i++){if(i>0){fullname+="."}fullname+=names[i];if(eval("typeof "+fullname+' == "undefined"')){eval(fullname+"={};")}}}}function getFiles(names){return(names&&names.constructor==Array)?names:[names]}window.i18n.normaliseLanguageCode=function(lang){if(!lang||lang.length<2){lang=(navigator.languages)?navigator.languages[0]:(navigator.language||navigator.userLanguage||"en")}lang=lang.toLowerCase();lang=lang.replace(/-/,"_");if(lang.length>3){lang=lang.substring(0,3)+lang.substring(3).toUpperCase()}return lang};function unescapeUnicode(str){var codes=[];var code=parseInt(str.substr(2),16);if(code>=0&&code<Math.pow(2,16)){codes.push(code)}var unescaped="";for(var i=0;i<codes.length;++i){unescaped+=String.fromCharCode(codes[i])}return unescaped}var cbSplit;if(!cbSplit){cbSplit=function(str,separator,limit){if(Object.prototype.toString.call(separator)!=="[object RegExp]"){if(typeof cbSplit._nativeSplit=="undefined"){return str.split(separator,limit)}else{return cbSplit._nativeSplit.call(str,separator,limit)}}var output=[],lastLastIndex=0,flags=(separator.ignoreCase?"i":"")+(separator.multiline?"m":"")+(separator.sticky?"y":""),separator=new RegExp(separator.source,flags+"g"),separator2,match,lastIndex,lastLength;str=str+"";if(!cbSplit._compliantExecNpcg){separator2=new RegExp("^"+separator.source+"$(?!\\s)",flags)}if(limit===undefined||+limit<0){limit=Infinity}else{limit=Math.floor(+limit);if(!limit){return[]}}while(match=separator.exec(str)){lastIndex=match.index+match[0].length;if(lastIndex>lastLastIndex){output.push(str.slice(lastLastIndex,match.index));if(!cbSplit._compliantExecNpcg&&match.length>1){match[0].replace(separator2,function(){for(var i=1;i<arguments.length-2;i++){if(arguments[i]===undefined){match[i]=undefined}}})}if(match.length>1&&match.index<str.length){Array.prototype.push.apply(output,match.slice(1))}lastLength=match[0].length;lastLastIndex=lastIndex;if(output.length>=limit){break}}if(separator.lastIndex===match.index){separator.lastIndex++}}if(lastLastIndex===str.length){if(lastLength||!separator.test("")){output.push("")}}else{output.push(str.slice(lastLastIndex))}return output.length>limit?output.slice(0,limit):output};cbSplit._compliantExecNpcg=/()??/.exec("")[1]===undefined;cbSplit._nativeSplit=String.prototype.split}String.prototype.split=function(separator,limit){return cbSplit(this,separator,limit)}})();