/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.22-log : Database - webplus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10',1,'hr-audit.form','1','<table class=\'view-info\'>\n	<tr>\n		<td width=\"100\" class=\"label\">ç”³è¯·äººï¼š</td>\n		<td name=\"userId\">${applyUserId}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">å‡ç§ï¼š</td>\n		<td name=\"leaveType\">${leaveType}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">å¼€å§‹</font>æ—¶é—´ï¼š</td>\n		<td name=\"startTime\">${startTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">ç»“æŸ</font>æ—¶é—´ï¼š</td>\n		<td name=\"endTime\">${endTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡äº‹ç”±ï¼š</td>\n		<td name=\"reason\">${reason}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">æ˜¯å¦åŒæ„ç”³è¯·ï¼š</td>\n		<td>\n			<select id=\"hrPass\" name=\"fp_hrPass\">\n				<option value=\"true\">åŒæ„</option>\n				<option value=\"false\">é©³å›</option>\n			</select>\n		</td>\n	</tr>\n	<tr id=\"hrBackReasonTr\">\n		<td class=\"label\">é©³å›ç†ç”±ï¼š</td>\n		<td>\n			<textarea id=\"hrBackReason\" name=\"fp_hrBackReason\"></textarea>\n		</td>\n	</tr>\n</table>',0),('11',1,'start.form','1','<table border=\"1\">\n	<tr>\n		<td>è¯·å‡ç±»å‹ï¼š</td>\n		<td>\n			<select id=\"leaveType\" name=\"fp_leaveType\">\n				<option>å…¬ä¼‘</option>\n				<option>ç—…å‡</option>\n				<option>è°ƒä¼‘</option>\n				<option>äº‹å‡</option>\n				<option>å©šå‡</option>\n			</select>\n		</td>\n	</tr>\n	<tr>\n		<td>å¼€å§‹æ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"startTime\" name=\"fp_startTime\" class=\"datetime required\" /></td>\n	</tr>\n	<tr>\n		<td>ç»“æŸæ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"endTime\" name=\"fp_endTime\" class=\"datetime required\" /></td>\n	</tr>\n	<tr>\n		<td>è¯·å‡åŸå› ï¼š</td>\n		<td>\n			<textarea id=\"reason\" name=\"fp_reason\"></textarea>\n		</td>\n	</tr>\n</table>',0),('12',1,'modify-apply.form','1','<h2 id=\"error\" class=\"alert alert-error\">ç”³è¯·è¢«é©³å›ï¼ï¼ï¼</h2>\n<table border=\"1\">\n	<tr>\n		<td>è¯·å‡ç±»å‹ï¼š</td>\n		<td>\n			<select id=\"leaveType\" name=\"fp_leaveType\">\n				<option>å…¬ä¼‘</option>\n				<option>ç—…å‡</option>\n				<option>è°ƒä¼‘</option>\n				<option>äº‹å‡</option>\n				<option>å©šå‡</option>\n			</select>\n		</td>\n	</tr>\n	<tr>\n		<td>å¼€å§‹æ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"startTime\" value=\"${startTime}\" name=\"fp_startTime\" class=\"datetime required\" /></td>\n	</tr>\n	<tr>\n		<td>ç»“æŸæ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"endTime\" value=\"${endTime}\" name=\"fp_endTime\" class=\"datetime required\" /></td>\n	</tr>\n	<tr>\n		<td>è¯·å‡åŸå› ï¼š</td>\n		<td>\n			<textarea id=\"reason\" name=\"fp_reason\">${reason}</textarea>\n		</td>\n	</tr>\n	<tr>\n		<td>æ˜¯å¦ç»§ç»­ç”³è¯·ï¼š</td>\n		<td>\n			<select id=\"reApply\" name=\"fp_reApply\">\n				<option value=\'true\'>é‡æ–°ç”³è¯·</option>\n				<option value=\'false\'>ç»“æŸæµç¨‹</option>\n			</select>\n		</td>\n	</tr>\n</table>',0),('13',1,'leave.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0×\0\0E\0\0\0™BLB\0\0T`IDATxœìİ	xUºÿq—áŸ™+Ì…QÇ{GæŞqñªwQPFÙ‘E6Aö}MØ’°Ë\"\nn#›Ã&ˆÀ„-	IXÂ’ !b€,İş¿]•4M¡iNWŸïç©§ÓÕ\'•:UoşÑé„\nN\0\0\0*¨>\0\0\0 )R\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …Ü@ttôèÑ£k×®}ß}÷İqÇt%c—3 çAÎ†œÕ—~„{ÄÄ=b-Ô­Iyİ’B®+))©E‹?üğğáÃwîŒ:–—oË·Éb7wãšKn·vÿ¼ü|9r†É9iŞ¼ybb¢êKÅ¸G¸G¬ˆºõ«º%…\\Ûîİ»+Uª4yòäË99RŸÆs­m6³X¯±Øìîv€÷—s2eÊ”jÕª­[·Nõ…‚2Ü#Ü#VDİú[İ’B®A.@…\n\"##«•o¤d×%+jk»-ÿê-‹ı7lÜ gIniÕ—\nppXuë‡uK\n).))é÷¿ÿıÆëómy6[^¾-W³Qì¡«ƒ=ÏìænhÕ?2rË¯ıkŞvÖ\r÷÷ˆQ·şY·¤âZ´h1yò$ãòÈµÉq5ì¹E¬°]´%ÇÜ^ØMËşS¦LnözSÕ\r·÷÷ˆQ·şY·¤«ÄÄÄ<ôĞC9¹å\ZØdq]!YçäµÍÅf®íîF®¶ı/çd×¬ù¿ îî+¢nı¶nI!W				¶Ù.Wë²,õşŞØËßw2û»®_Ñ—_iØf{çş PĞÑ£G«¾t¸M¸G¸G¬ˆºõÛº%…\\¥víÚ;vDæÛ.WåÒ‹/7üÑé<îp¶9æ9÷æ9c³í3Vş°!ãBL¾3:Ç“ãÜvÉ¹1×ùá¶„î=z\Z—ğ²ûË=ÛæÃ+m[áSĞçÎ­O>ù„êKç[‘‘‘ÿñÿ±eËÕ¢÷Hàİ#:”7uë·uK\n¹JõêÕ?b³_2IÁÙNçÅç»óç|ç%§sÈ¨°\nólÃæ6gz3=×y,ÇyÄî\\¶s¯t¶¹®âEók]\r›±Û%³‘ï~X´ÿÀèŸ–rï½÷ª¾t>$³óï~÷»+WÊL½yófÕ‡£÷H€İ#š”7uë·u[)dÏ=cÆŒiÒ¤I:uî»ï¾»îºKÖÒnÜ¸±l—goı[Ü6wÜqG^~¶Íu‘.Ê5â»äpæ9\\OÙ\\ëo¾[ÍGGOœnw:±;/Øœ?ÛœçÎ»ö¹*Õn\\f×Å¾h\\òÂı>ôlm€şùùÙ+VT{á|Çœ£#\"~È·Ùøa“fê”””;vìÚµ+...Ş•œœ\\¬§<Vîà=î‘@ºG|TŞ~XÏÔ­ßÖíÍ§.Œ1âÁ¬Y³æĞ¡C×®]}<-=7Ïõ‡Ø¤½zÍ\ZÙ.Ïşñ”Ò¿ÛGŒÌû‹Í.Åš-kyxÑî<{Ù™ï(ìpşüù>5á½ÓO’‡¶g¾QÁ;âö~­ñ……;)Ùpu¸²ÿ€é/cWwÑ|Ès6‘áÃ‡Ïš5kõÕæÌ™Ó¯_?÷‘Œ9²K—.ï½÷4&MšÔ¨Q£àààÛÿ™Gî‘€¹G|WŞ~XÏÔ­ßÖíÍ|ƒœœœ3fT«V­gÏ{öî»Î_‡½²ìİ—Ğ­{wéÿÁÈ×–ûÊ‘‘yåìg™kW¥:œ?]rÎvÚœÎü¼¼?×ªU¡Â*Tzó­N_¿ûÊ×^N÷~<\ZvÏíYÓßgØ[WrvÏÔ²½|ˆ.ñÖ­[e¦^¿~ıÆe-ímÛ¶\r6LÍÌÌ”2îß¿¿uëÖò}§L™\"÷öìÙsîÜ¹r<’â	Œ{Ä§åí‡õLİúmİ–ùdddÔ­[·I“&’-n˜?Še‘Æ›<ıôÓ²_Œ¤\\Õ–eœ}¹Yæ»v’—Oşâ<“ëŒ=zï½÷ŞqçİÿïªmÛ]U©»ââ¥³İu!³ìö,ÏØí…\rY›<\nşş6ÃŞºëÍÑæ\"ÛË÷Ó|2kÇÄÄDEEÉ,¼oß>YËÃØØXù×¡Óx{É’%cÆŒ‘b.\"í±cÇ.^¼8--­¼ÃÜ#pøº¼ı°©[¿­Û²}ƒôôôjÕª½÷Ş{eÊËäÉSªW¯î·¿:o¼óvÁu1ìÌp¹Àùs+/ÿ”ëŒØ•øØOU­öû{*W™µpY®Ó™ç¼”çúÂmQ»\n¿Öõå…kã’_Ùb\\òû˜ş~5ÃŞºÒçh_™µSSS—.]:jÔ¨°°0™”—/_~üøqsÖ6µk×n£ù÷eûöíËå»—	÷ˆÕï‘ÛPŞ~XÏÔ­ßÖm¾D9 )¦› æ²båJÙ\Zßê¦ÕvŞîº0çe1/€ë›ó\\¾¤fÛ„cOÔ©ûÒ+¯ÉsÎqÉqÍsJ­n‹1*Õn^`×b\\]cWöÂµÍs£±ÿ€éï?3ì­óf.÷ bÎÚƒÎÌÌt\Zº\Z:thÉYû]“&MêØ±ã­ë²â±ô=r{ÊÛë™ºõÛºõödddT¯^}õêÕ·AÌeÉÒ¥ÕªUóÃÍÕvŞ¸6r%Î½Pï…}‡Ç&$FíIÜŸ¸}wò})›bîL8\ZŸ¼5>iûî¤¨½É	‡Ó>ıù›­Z™_e3×¶óvÑÃ¢ıL?™ao÷stùsÖ\n\n*eÖ0`À„	Ü³öøñãe–¿Åï{¸G¬{Ü¶òöÃz¦nı¶n½ú999uëÖ½•Ä”\\&OòôÓOûÛ‡UŸÿÉ8g\\¹çúöíéÍ×{ã–f{ÑbóØg£Øş£¿?Ì°·®¬st9sÖ7oŞ¸qãÌyşüù³vzzúªU«BCCsss{öìi¾•(Ï&%%•ÃÈË‚{Ä¢÷Èí,o?¬gêÖoëÖ«o0cÆŒ&Mš”c1—Æ›|ğÁ¾a™•ú³Í~ÖîZ~6Û6›«m¬Í…[\\\rcı•Ï°·®ä}úÌO¥T¯ç³·DdşMII)¶Qfä#F˜í:$\'\'›oYŸ={6<<|îÜ¹¯¾úêÉ“\'oúûŞî+Ş#·¹¼ı°©[¿­Ûƒ¬¬¬ªU«–õ7b¼YdŸ²g¿ú;\"Æ»v™Æe«’i³¶İ[<\Z—0“ş²X=…”œ£CBCï¿ÿşC‰I×,]Ù.ÏJŸò\n\"C†IHHğÜ\"óu½zõÌ¿Ü‘‘ñÉ\'ŸHCR{Ÿ>}äšÃ†\rëÜ¹óåË—O:e³Ùnù”÷ˆåî‘Û_Ş~XÏÔ­ßÖí¿”HÏ=Ë=‚˜K·îİİéØy9óš‹Íİ°]»ƒÎı-B®9G›oÆ^s¦6çh³C9«à±Ö=By›¨[¿­Ûƒ?şñ¾x#ÄıvÈ<àëAzÏ¨ÔŸl¶ŸdíjØÍF¦½°áng^ÕMûşÖM!¥ÌÑ×œ©=çèÀ›©½Á=b¡{„òv£nı¶noğ\röìÙS³fMEsyè¡‡üçÿš1*õŒqöÏ]ª3Æ%qo<sÍš÷·h\n¹æË‹ÍÂ3uÉ9Ú|¶|?#âç¸G¬rPŞ¨[¿­Û|ƒ1cÆ:Ô§)dĞàÁò]|=N7›Í6uêÔ˜¿BVLQ¥šËicñ|x¦Äršş²øU\n)ı»]ïW®7‡¯ßPÊî¹Xw¦6qøó=By_uëÏu[Š|ƒ&Mš¬]»Ö§)dõš57öõ8İV\Z3MÜyçƒÎËËó|Ö¨ÔSE×Àİ(¹¸r8ŠuÓ·¿_¥Ò/±©ôßZ¼æL]±bEoæh?Ÿ©½Á=âÏ÷å}=Ô­?×m)nğ\rzê©;£|šB¢¢¢k×®íëqºeee¹ï7iT©ReÍš5îgJıQ®ÃqÊáº?š‹<,Ş0-ê£{¿J!¥_b§w8áš3µ—s´?ÏÔŞàñç{„ò¾êÖŸë¶7øÕ«W?v<Í§)äxZú½÷Şëëqzªåú¿¯àüì³Ïšÿ…’Q©\'³/ë“×¥úÑ½Åá±İÜènhŞß¯Rˆ³ÔKìıßn*e¦¾áí·3µ—¸Güù¡¼¯‡ºõçº½|ƒ»îº+7/ß§)Dö/µ2vìØR‚ùíäº\0ó2œ,¼%:®lÏ ¿<”óæ?W°teúó‘áë7”|§Z¶Èv/÷ğÃ›d¦¶ÊÉñ’%jÒßúW¸-÷å]\nKÔ‰¿õ¯ <…ä{!•+W6‹²R¥JíÛ·è¡‡Z´háÎË‡\\ŒŒÂµëÂ.Å¶8ŠÖô—å6Tj™”r‰###e¦ş>\"â†•ÿXô÷ˆ?ß#”÷õP·ş\\·×£İçBöìÙc–iÃ†\r_yå•š5k†‡‡»ŸuUªı„İX¤!×Ã½.Üè0/’4Šzô¿p!iğ îæÆÌÌıII[NLÜš}XúŸ>½¯uë¦çÏ²ÙÒ32â3Jøùçƒ²>{ö€{\'²½}û7¤±sç77.İ¼yÅæMË¥¿Aú<¸eÔÈşaaƒÇŒ\"‹4BCM\ZRòx¾ıöËiÓBJÿ™3	;¾)o¾YpèP¤<%û‘Ã»¹ñºûûU\n)ı;½›©òç^òé=â}ÿ=:äæ-¥ÿ‹/>WÊş¿3n’ûwİZJcÍš‰E·ÀÅ‹GÊıø}tPŞ×ã\'u{½ş½{w’—ƒK—RRRvÈÃ¿ÿıÅœË©Gìp½:={õìñ¯;¾‘É_¶Ëœ¿wï÷löÑñøÏÜ~ãß‘ùºœşİë-²ÿFnßïÈDDDÈi­[·î=÷Ü3qâÄk}:]®Š£ğÚ¤»®OÛÛEİÒÍ†İ–Ş£Gû‘#û¿òÊzöìøLnß¾Åôé¡=öç‹®—ùôÜÜ£1ÑkenÍÉIíß¯Kppï#úõë×EŠÏ½ÿaC{¶k×âØÑh)Ç•+ç6løÂÒ¥ÿX±bÎíkäÙ\rüñÄü¼cyyÇòóçç—ö›o66çäÉøúõÿ:`@×aÃzõnŞüÕ  ŞÒ2¸{½zÏÌˆ—=ØòËş¥ÿèÑRSwÊñ·iÓì&Æ[¬¿_¥Ò/±©ô™:P‰ÀK>ºGÊÚÿ…-ÖÿàÍ-[6’ûeÈ#†÷­U«æğá}¤¼åv“íÉI[¯ÜC{·€ÜeAÃz\r6nŒŒ¸+·€ãDÈèrØÍ[ÀÇï£{„ò¾?©ÛköÏÌLøË_Y¸pæËš4yùçŸ¼ñÆkòŠ %z`ÿ&WYÚÒš6}e}ø\"©íåËæŒÙoåŠ¹_}õÉ[m›ûâxüjn¿Á7;vìÀAƒ|šB\r\ZêëqzZ·nİ¬Y³Î=[ò)#/§9ivYÂµÃ£]l]Ô?=-fÎœ©òpîÜiß~»`íÚù‹}tşüİÛ™=û÷ï²;>¼Øş3Nì’íæş#¾_2qbpÖ…C2¥îŠùvïŞ\rM›¾œ°ïûİ»Ã/_–«¥mÜøUƒÏÒ½pÜ}Ğ ®’BòóÊ³éé1ıúvvï¿KçÖîãìÚµ­<ûÍš/ÂÂ=ñÄÿŒİ?,tPjêvy¶­+…È×î*ëx=·ûU\nq–z‰İd¦®R¥ŠVPÁ{>ºGÊÔ¿qã%û\'\'EøÎ´i£gÌ#•,)òäC‡ôpßƒıúuv÷ïÒ¥µ{®[ -æ›o¾Ê7oP¹R¶Ë³æ-pâÄ®ò=~ßİ#”÷õøCİ^³¿DáåËgEí\\“’²-v×·;v|-“¼d­[W˜ıen—WŠM›şµ`ÁçÎí=ª¿¹‡=Úùâxüjnço§^Å¨Ôã®Åa®Ó\nm´_i»òxèZ‡†ü%ëĞÛŞ´å]ûÍ‹}øá‡ã¶l^fö—Ğ`¼ğ_µW\nqÍ›Ç·o[Ù¶m3)ÁU+çdş´wÅŠÙ¯½öÒ—_Î”¥Q£—ÒÒ¢¤Ï÷ß/9slÉãéÔ±åáÃ[¥!Á¥ë;m†÷9²ïŸÿü°¬¥İùíV	û6Ê!eeÌÎN’Ãûùì>‰#K–|²}ûªÖ­šÈ„ŞªUã“»Ê:^wK!^âKŞ„[¼G¼ì1;éñÇÿ»dÿ¸¸o»u{+rËrYêÕ{VÖ[¶,oØğ÷ş÷íÛXxŒ(¼‚İ·€íXÖÏ[` ÜòzPx¼iŞåsüşpPŞnOİ^³|Üwÿó?’W‡1cË<ß¼ùßCF÷oİºiXèÀW^ùÛ/¿’>’¹])ä‡¥×6´‡üƒ6(¨—Ôp÷no•ûñø[İ*şdöìİ\'û÷õ ½çªT‡y9ÇŒõqW£pKÑvÏ†±l\\Ş³g» a=‡ïİ¯ßÛ½zuèÛ§“¤·Ú6KJÚdö2¤ÛÑ£Û‹í?#cWÿşeKÊ‘­§NÅÉ–Y³ŞµÙ¦ß9th÷ˆˆÅ_=wØ°é’BÇd–ìÔ©¥ô—oÑ¯ïÛ²–	·C‡2‡š;ŒıvÜ¸¡æşÛ¶mj³t;~|§ûøß~»åÊ•³‡÷š={ò†\r‹¤èwìXUÖñëoÑâä?Ú(»›¾GÊÔ_*ÿOª¹¬Xÿ˜˜oæÍ›&üÍ7_üßÿ=µjÕì¯¾úèÓO\'fg\'Ş»Ö\Z·€«Û6MÍ¯ò¸\\Ûß~ûÍ+·ÀúŞåzü~rPŞn·§n¯×ÿÌ™İowjyèPÄ¹s	M›¾œ““œ“sX–fÍ^±Û.^üÑ˜1ƒzôh·iÓù‡¨ôÿé§=‡“·¤¦nKJÚlËO-÷ãñ«ºõêÿÔíÖ½»Rˆì9(8Ø×ƒôQ©rÊºÀq¬°m<ôh+±ÅµŞ»gİŒaŸ|2^Ö;w®ZûÍç‹Í<>¡E‹¿çæ$K‡!ƒ»MİVlÿ\'¢û÷{ÛÜ8p@	ÁA½|ğşõë¿:¤Ûºï,_şÙ°¡İÓÓ£N¤Gmß¾2>î[ùF{÷†»Ö{ÖMŸ\"»İ¹c•t=ÄîúæÅŸ\r\ré\Z:à/yDÖÒ®[÷qóYÙÃ´i£jÖüÏÏ?Ÿ6jTßÔ”­²Ñ+73^ÏşÖM!NşÓÑ2º•{Äûş]:·Ú¿c›6Ml¶TÏşáëJìX¾ì³U+g?÷\\Õ_Ï‘¥uë&Go1÷»öª[Àh¸n´ÒÁ¸Fºoó~t…•ò>~ÿ¹G(oÓí©Ûkö¿|)qÒ¤ ¿şµîÄ‰Aß®ıâ…™0a¨±ûïÿ~X:Øm©òJÑ£û[›~XÒ°á}zwœ3grƒ?ú/üo¹¿Õí¿AVVVÕªU}ñvˆìSö|áÂ_Ò{Æ»v<^³í8Z`¬+d´íî-©îş2¯-X0==}ç†\r_NoÔÚµ®\"O}òñ¸õá¥¿ë½Ô­ÅöŸ‘İ¿ÿÛû_÷İüO?ğãÉ˜¡C»Í;eÇöÃ†uO;¾#aßúY³&M<|üø!æOŸo,òµ]»¶™=ûİı	ëåkcw­7n°¹+cnu}¯~ı:H—)øèÖÈeáá»ti%Ï†…\rH5Æø÷âÍŒ×³¿¥Sˆó:3u)ŸÎ3gê@š£½w+÷ˆ—ı·o[>hĞ;²eÍê¹cÆt÷ÿæ›y!£ûM:ò½i#%L<öØŸ§—_şë€e~7‚¸ÜCÌşE	ÛuH\n‘-[·._· Kç7ecXè\0#ˆ§ºº•ëñûÛ=By;oKİ^¯¿Í–rè`DÇ-öîùNrğ+¯<ÿí·_|»ösY$I›ı³9Ğ£Ç[›6-Y¸à}s\'ò0ñP„Ti¹¿Õ­Wß`ÆŒ\Z5.÷\"ûœ>ı}_°LŒ¼,g?µÀX»–Âkã±öxèî&/¾˜öí·ŸËö=»¿›>}ôÚoæ-Z4CæÄ·Ú6Ûµkµl2¤ë±£[‹í?ãD”ñ^ˆk‡+Vüã³Ï&vìĞÂnO9s:Vâ°ü[0.î›ùóß;sz—Ù?5%òµ×^Ü¸ñKó\0V­œ%Ïº\'jçÊzõ	\r•ÿõ7Şéo¼òØ‘#›İ‡mLÁ©®)85òç³»)85çò¡_~Ù_¦ñz«§çu~ˆ^JõÆËoÂ­Ü#Şôß³ûÛ¦Mdg0û\ZÕGB¶»Ã‡9¢·üËRÂÇãÿùı÷Gğşh™ÖÛfößiŞ!×½¤[—.Æ-à\nâ‘gå0òúe¹²®q”õøıó¡¼}]·7ìß§w‡s?ï=ztë«¯Ö‹‰ùzWÌ×²–Z5ûKÁï…,–é}ØĞîòjr`ÿ†Zµ’úôÑñøOİzõ\rrrrê<õÔ”)SË1‚ÈŞdŸ¿d_ôõËÄ¨Ô‡=EÖ®‹án8RÌÅln±n4ŸÏ›òVÛ¦¡¡ı$ÃN:|Íš9’BÆ„\rX·î³ÿàAï=\ZYlÿ\'Nìèßÿm÷şçº’Gã_²rr\rĞ9<|ş´i#dº´Ù»çò¥C½{·ÏËK’öòeŸÎŸ?Í}<§OÇ:´Ñìöæ›¯™Ô”-ÙÙûİÇß¹sKYüÄààÒÍn;²iÓWÆ)Óx=ÏO\0¤gYşúµçs´÷nå)½¿İ~döìI\Z½xîÜw7)Î·ß~#$¤ŸÜÅú7oşŠÙmÛ¶eşgn<}Êu˜}\\·€±1%eóÅìîÃ[@\Z®[ c‹à æ\"·ÀøñƒoåøıüÑ¼¼}W·^öïĞ¡ùë¯¿òÏ/?µ»¿«mt;÷ó=Úş±hÁùWeÊ/¿$têôF¯^í\rê’››è‹ãñŸºõödddT­ZuÉÒ¥åAV¬\\yß}÷;æÓ±İ£RåõşˆÃîZ»…k£Q¼CÑÃo×Îİõµ4~<¹3âû/ıóıE‹>ğìß½{›cG·x~ùÚoæ¼øâ3æOóÜTÔò¥K>|õÕ¢£V˜û_¾ìã9s&;S?F=óÌ“O>ùß»w¯¹æñÔ¯ÿ\\±ãÿå—}ÿûß>ú(LÚƒuÙŸ°N\Zÿüçû]»¶êÕó-9ì2×óx”Ï°å¥¬3uÀÌÑŞ»•{¤ôş[#—uÏË=T¬¿İ–<&¬ÿömÿr÷ÿä“±õêıoXXÿÒ÷/·@±ãÉ¾Ñ-p+Çïÿ÷ˆÎåí»ºõ¦¿İ~¸Kç–ÇGJ»E‹†²ÎÏKìØ±ùÓO?nvH;¾µG÷¶«¿5şÔM?,zíµz{v#;üâó)Ëşõq¹_Õm¾Azºë˜H€¸Å\"QFö³}ûßê¦É¸®„kq8Ì‹T´¶_Ù^rcÉş¹9óóyö¿t1AæSÏş¹¹mù‰×ÜNÎÒ÷oL©{K9#G\"nåøËÔßfØòâıLHs´÷Êñ¹éş/&ÈİtÃşGGÜã±Ğ=¢myûCİ–Ò???1ëÂnó)[~’Ã¬Oİ–íDGGßwß}·ò£ùÚªU«¦=æ“ÑÜ2ãLÉ‡T@²QF£äº°Ïa¶Öııd†-/ŞÌÔ6G{{Äê÷ˆåMİúmİ–ùdddÔyê©F\Z—õ·f¤¿|•|­ş ÆÍÈËIÆb^É¤…İ\rwÇÕuîï?3ly)}¦¼9Ú{Ü#phXŞÔ­ßÖíÍ|ƒœœœéÓß—2íÖ½»7YDúHOé/_åoG-ÆøÙa¢q%‹\ZIf£ØöbÏjŞß¯fØòr½™: çhïqÆ=¢[yS·~[·7ÿ\r²²²FùÀ<ôĞC\rúzõê;£OËÍË—µ´eË ÁƒåYé<|¸ô/Çãö#/\'z¿8‡è_à3ly)9Sêí=î‘€¹G´*oêÖoë¶¾Á={ÆëúiK:÷İwßwŞ)kiË–ĞPÿù?b¼qÇw8ì\\×ãÃQØp/î-%ŸÒ¹¿œ±Š+ª¾t¾â9Sğí=î‘@ºGô)oêÖoëÖïâ¹ZÕ«W?‘¾©ÀqÀ\\œÆAc9puû`Q‡ƒš÷Ï8±ùŞ{«ª¾t>dÎÔ+V®à9Ú{Ü#vhRŞÔ­ßÖ-)ä*µk×‰^â¾ı‹\\÷F×Úy¥ƒÖıåŒ=ùäŸU_:ßŠŒŒ”9ZÖªD=î‘À»G:wîğåMİúmİ’B®ÔÅY  Á}Íœ²x^Âb4ï?<øÑ£º«¾t>7vìXÕ‡à¸GïñÃÏ¬”;êÖoë6ğ‹¯LbbbjÔx ?o·Óu%ä’$—¤pñ|Xü)]ûË¹ªYóQ;©¾t>§ÃLí\rî‘À»Gt¨mêÖoë6ğ‹¯¬Z´h1mêàÇ>§cŸk]àj×©h‹±± ğÙcÙ§m9W-š×W}Ñnfj/qØ=¢ImS·şY·Z_™$%%ıú×wïØ¶ÀuÍ\\—d¯,Ncíj¸·\\yjŸÙAÃş?DÌ©V­Ê¡ƒ_«¾h·ƒ&3µ7¸GÊz$Z­ú¢•F“Ú¦nısn×¢øÊj÷îİr[F|?»À±ÇY`^×âzè(jm1ÛfC«şÛ·Í—³´î»OT_®ÛD“™ÚKÜ#tèSÛÔ­Ö­.ÅWVëÖ­û}µ*Ó¦´åí*pìvì6×NÇî«\Z[®jëˆımù»äÌTúõİ»ã«¾P·>3µ—¸GæÑª¶©[«[Š¯¬’’’š7é¡\Zz{Wô—éá8ãRÅ›ëi¸ÚW7\n\nŸuz¶­ß¿Àw\"=<&japP§\Z5şĞ¢ùKI‰+U_¢ÛJ«™ÚKÜ#qèVÛÔ­_Õ­^ÅwbbbBFw}òÉZÕï«zGÅŠt%c—3PûÉZr6b¢ª¾,\nTĞl¦ö÷ˆÉº÷H-k›º5)¯[‹Ï¢ø{jUĞr¦†¨mµ4ŸÛ)>køüóÏe¦HKKS} úb¦F ¢¶ÕÒüük=x«ÈÉÉù·û7©Ô¦M›ª>}i>S €QÛji~şµ¼U´oßŞü^•*UÂÃÃU¦4Ÿ)À¨mµ4?ÿZŞõ«_™)ä®»îzğÁóòòT”4Ÿ)À¨mµ4?ÿZŞjÕªåùyæûî»oÂ„	ªJGšÏ`Ô¶ZšŸ­ïÿÌ¿ôWÌoûÛÌÌLÕ‡¦Íg\n0j[-ÍÏ¿Öƒ÷\'N”}ì±Ç\Z4h x@Ö>úègŸ}¦úĞ´£ùL\0Fm«¥ùù×zğş/\"\"B\nôßÿıßÍ¨Êú7¿ù4Ö­[§úĞ´£ùL\0Fm«¥ùù×zğ–“••å,ªTioŞ¼Yñ1iIó™ŒÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-¿úÕ¯T‚Ö4Ÿ)À¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©ÊİúùOIIÙ±cÇ®]»ââââ\r±±±QQQÉÉÉÅzÊSaaa·øí\0/1·¨¥ùù×zğÖ¢y¥*WúùÏÎÎnÚ´i—.]zõêÕ§OŸ×_½M›6½{÷îÖ­[ëÖ­×¬Y#}†>kÖ¬ÕW›3gN¿~ıÌlÙ²eäÈ‘²“÷Ş{O\Z“&MjÔ¨Qpppttôí!tÅÜ¢–æç_ëÁ[‹æ•ªœ÷ç¿  àùçŸ?ş|±í,¶nİ*Écıúõ7n”µ´·mÛ6lØ0y6333>>~ÿşı’Z$$&&N™2E‚ÈöìÙsîÜ¹rP„¹E-ÍÏ¿Öƒ·Í+U9ïÏÿ„	şğ‡?dee%$$xn—%©bß¾}²–‡±±±ÁÁÁNãç5K–,3fÌğáÃG‘öØ±c/^œ––VşCÌ-ji~şµ¼µh^©Êyyş§M›Ö§OŸ-Zœ9sæ…^ˆˆˆp?%)$55uéÒ¥£F\n“±|ùòãÇ›)ÄÔ®]»Ö¯_ß¾}ûòà¹E-ÍÏ¿Öƒ·Í+U¹ÉÍš5“HQPP )D¶deeÕ¯__’„ÙÁL!ƒÎÌÌ”‡.\\:thÉò®‡I“&uìØÑgc\\˜[ÔÒüük=xkÑ¼R•+ıü§¥¥=òÈ#k×®5š)Dœ;w®nİºÎ¢TJ\n0`À„	Ü)düøñ’Z|5$ÀÀÜ¢–æç_ëÁ[‹æ•ªÜ\rÏ~~¾»íN!ââÅ‹fÃL!óæÍ7nœ™0æÏŸï™BÒÓÓW­Z\Z\Zš››Û³gOy(åÙ¤¤¤rà¹E-ÍÏ¿Öƒ·Í+U¹2ÿ×_½äFÉ)))Å6JÂ1b„ÙîĞ¡Crr²ù#˜³gÏ†‡‡Ï;7\"\"âÕW_=yòäÍ8pÌ-ji~şµ¼µh^©Ê•éü?÷Üs%72¤ØoÍHş¨W¯ŞæÍ›¥‘‘ñÉ\'ŸHãƒ>èÓ§ÏÈ‘#‡\rÖ¹sçË—/Ÿ:uÊf³İÒÑ×ÇÜ¢–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©JØl¶E‹eee9‹Îÿ={vìØ¡ú¸€òÄÜ¢–æç_ëÁ[‹æ•ªÄøñãå´W¬X±V­ZÒ¨\\¹rƒù¿à¹E-ÍÏ¿Öƒ·Í+U‰‰\'V(á™g	W}h@¹anQKóó¯õà­EóJUâìÙ³wŞy§giØ°á=÷Ü“™™©úĞ€rÃÜ¢–æç_ëÁ[‹æ•ªÊ!C*V¬hFJ•*I\n™0a‚êƒÊs‹ZšŸ­o-šWª*yyyUªT1SHûöí~øáÜÜ\\Õ”\'æµ4?ÿZŞZ4¯T…Ö¬Ycş\\¦F\Z|\"‡¹E-ÍÏ¿Öƒ·Í+U­gŸ}VÎóæÍUPş˜[ÔÒüük=xkÑ¼RÕJKK“ó/kÕ”?æµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-zVjttôèÑ£k×®}ß}÷İqÇ%ÿz‡&dìrä<ÈÙs¢ú²  TĞrnñšŸ­o-ºUjRRR‹-~øááÃ‡ïÜu<-=/ß–o“Ån,îÆ5–Üníşyùùrä<\n’sÒ¼yóÄÄDÕ—B·¹Åßh~şµ¼µhU©»wï®T©ÒäÉ“/çäHö0^Œ]k›Í\"×Xlvw;ÀûË9™2eJµjÕÖ­[§úB!h5·ø!ÍÏ¿Öƒ·}*U^\\e°‘‘‘Æ+q¾ñˆëå¸¨m¬í¶ü«·x.:ôß°qƒœ%‰kª/,OŸ¹Å?i~şµ¼µhR©III¿ÿıï7n\\ŸoË³Ùòòm¹²˜b]ìyf7wC«ş‘‘[~ıë_ó£Ü\"Mæ¿¥ùù×zğÖ¢I¥¶hÑbòäIÆK¯¼îæ¸\ZöÜ¢ãÂvÑ–s{a7-ûO™2¹ÙëMU_4X›&s‹ßÒüük=xkÑ¡Rcbbzè¡œÜ‹òúj“Åõê+ëœü¢¶¹ØÌµİİÈÕ¶ÿåœìš5â·fp+t˜[ü™æç_ëÁ[‹•\Zl³]6^‰/ËRïï½ü]V³¿ëµ¹èË¯4ìÆF³ƒ=ÇsÿĞ?(hÈèÑ£U_:X˜s‹?Óüük=xkÑ¡Rk×®½cGd¾í’ñŠ{éÅ—şètw8Ûœóœ{óœ±Ùö+Øq!&ßãŒÉqn»äÜ˜ëüp[B÷=—çËî/÷l›¯´m…O@ÿ;·>ùäª/,L‡¹ÅŸi~şµ¼µèP©Õ«W?~üˆÍ~É\\dÈÙNçÅç»óç|ç%§sÈ¨°\nólÃæ6gz3=×y,ÇyÄî\\¶s¯t¶¹^¡/š_ëjØŒıØ.™|÷Ã¢ıFÿ´ô”{ï½Wõ¥ƒ…é0·ø3ÍÏ¿Öƒ·*õ;îÈËÏ¶¹^€/Êë«ù’Ã™çp=e/p­¿ùnıı5=qºİéüÅî¼`sşlsw:7îÚçJ!vã%ÜõB~Ñx9/ÜOáCÏFÑö\0èŸŸŸ]±bEµ–¦ÃÜâÏ4?ÿZŞZt¨TãıŒ_lv	\"Ù²–‡íÎ³—ùÂçÏŸÿàãYŞû8ıä)yh+pæédGÜŞÂ¯5¾°p\'%®Wö0ıu¨\røõ£–æç_ëÁ[‹•j¼Ÿ!¯¬YæÚ•BÎŸ.9Og;mNg~^ŞŸkÕªPá\n*½ùV\'Ï/Œß}åk_ªİûñhØ=·gLj¾ó«_ıJõ!hMóûWëÁ[‹•j$‰,ã•U^b³ÌŸÈœ½ì<ù‹óL®3ö@ê½÷Ş{Çwÿ¿{ª¶mwU\nÙ/í®é,»=Ës\'v{aCÖf§¤¿µ9wî\\åÊ•U…Ö4¿µ¼µèP©ÆOU.¸^híÌ×ËÎŸs\\ï…ü”ëŒØ•øØOU­öû{*W™µpY®Ó™ç¼”çúÂmQ»\n¿Öõå…kãåüÊãåü‚çş¦¿µIMM­Q£†ê£Ğšæ÷¯Öƒ·*ÕHçí®İó²˜C– rÁæ<—ï<ù‹mGÂ±\'êÔ}é•×Îä9Oç8Ïä8Ïæ9%‡l‹1Rˆİ|ñv-Æ+·±+{áÚæ¹ÑØÀô×¡6à#qqquêÔQ}ZÓüşÕzğÖ¢C¥\ZIâ¼ñº+¯²ç^¨÷Â¾C‡c£ö$nOÜ¾;yÇ¾”M1w&ŒOŞ\ZŸ´}wRÔŞä„ÃiŸÎşüÍV­Ì¯²™kÛyÏ‡F»èaÑş¦¿µY´hQëÖ­U…Ö4¿µ¼µèP©Æg;äÅõœñ+¯¯çúöíéÍN}ã–f{ÑbóØg£Øş£¿µéÕ«×Ì™3U…Ö4¿µ¼µèP©F\nùÙf?kw-?›m›ÍÕ6ÖæÆÂ-®†±…ş:Ô|ä±Ç‹U}ZÓüşÕzğÖ¢C¥\Z?‘É4^bå7Óf+l»·x>4^3é/‹µ_Ø¿ÿı÷ßo³ÙTˆÖ4¿µ¼µèP©Æ{!™×\\lî†íÚtî¯CmÀ:tè0uêTÕG¡;Íï_­o-:Tª‘B~²Ù~’µ«a7™öÂ†»yU7íûëP(wÇûİï~wúôiÕ¢;Íï_­o-:Tª‘BÎ¯¬gŠ^†Ï/·îg®ÙAóş:ÔÊWVVÖİwßıÕW_©>h1·—BëÁ[‹•Z”BÌå´±x><Sb9MY®Yñññıúõ[»víí¿ğsAxâ‰·ß~[õÀE‡¹½ZŞZt¨T#…œ*z}u7J.®§bİôí_¬6:TËõîÚ¼y³¢ë	tìØ±š5köíÛ·  @õ±ÀE‡¹½ZŞZt¨T#…ü(¯¯Ç)‡ëUöGs‘‡ÅÆ³E}tïï®œœœöíÛÿêW¿2óÇ£>úïÿşïò_µ—~bÿşıR¿ûİïøAŒ_Ñan/…Öƒ·*ÕH!\'WVYŸt¸^†toqxl77ºš÷7kãóÏ?ÿ·û7Ï?æÖ AƒvíÚ©¾ªPãÜ¹s©©©qqq’9z÷îıøãßÿıÓ¦Mãã¨şF‡¹½ZŞZt¨T3…8æKìÉÂ×ÚW¶gĞ_Êy;v¬7dÖä~³J.ño~ó›Ê•+×©S§U«V3fÌØµkÄ?UĞ`n/…Öƒ·*UÆèpÈmFáÚõ¢[¸Ûâ(ZÓ_³6ÒÒÒš5kV¥J•»îºË|)zàx/ÄB²³³›6mÚ¥K—^½zõéÓçõ×_oÓ¦MïŞ½»uëÖºuë5kÖHŸáÃ‡Ïš5kõÕæÌ™Ó¯_?s\'[¶l9r¤ìä½÷Ş“Æ¤I“\Z5j­tp¸.æöRh=xkÑ¡R])Ä~Ân,Ò×Z÷ºp£Ã|–FÑC¯ûÏœ9nãÆ¥òTZÚ®øø\r	û\"Ø,ë¸¸õ?Ÿ=àîß³g‡ÜÜcæş;v|ózûúé\'óóÓŠÏÇO:œ¼Íİ?<ü«?_^Ç_JÏÚğÁï½÷^3ˆÈ?ˆù\\ˆ<ÿüóçÏŸ/¶]‚ÅÖ­[%y¬_¿~ãÆ²–ö¶mÛ†\r&ÏfffÆÇÇïß¿_R‹Ä‘ÄÄÄ)S¦H9pàÀ={Î;§b(¸æöRh=xkÑ¡R+¸~\"“.¯¸Â×İt×ÃÂõ	c{a»¨[º÷ıóòu}§íÖ­«ÂÂOœ8üóÏß6¬×‚3:vh¹aÃâè¨µƒuT·îãcÆ	î3nÜ°úõÿ:aBĞØ±C%[ÈŞÙ±cÍîøõ{÷~/Oíİ»1>.|çÎo‹1ã§3ûşş÷zgÎì\r2°S§VM›¾\Z2pÀ€®·~ü¥ô/Vyyy\'Nüíoûè£ÊS111ª.(nÚ„	şğ‡?H‚LHHğÜ.)D.hTT”¤Š}ûöÉZÆÆÆË³)))K–,3fÌğáÃG‘öØ±c/^œ––¦h4(s{)´¼µèP©Æ{!iGš]ÖF£píğh[—¥¿İv\\\Zaaƒ¾ûîËõá‹^xá™o×.øè£ñ›7/“gß}wÄ¸qCŸ~ú‰ñã‡õîØñÌŸö}³æ‹åËgåæ¦ÊÎ;mğ nsæL•¥NÇÌF¿¾?ûl²û»¤§Åäçİ´iYĞ°^²‡&M\ZŒİÙ²ÏÊåø¯×ÿšµqöìYù‡2¿¦kEÓ¦MëÓ§O‹-Îœ9óÂ/DDD¸Ÿ’’ššºtéÒQ£F………IÈX¾|ùñãÇÍbj×®İFRíÛ·W1xE‡¹½ZŞZt¨T#…w-sVø°h£ıJÛõ”ÇÃôß¶meÇotíÚVÚa¡¿ûnÁºï6jT_Ö’B¶H\n±ïÔ©å?,mÚôåM?,mİºÉ\'cƒ‚zId9õcœ¹ÿ/¾xÃúEæ[¶|ÍÜÿšÕŸñÅtùÖq±ßÎ=eÙ¿>;÷sÂš5Ÿ¯ÿçÔ©£ôï\"µß|‘xhÓ­éıu¨\rMHhÖ¬™DŠ‚‚I!Nã/ŒÕ¯__’„ÙÁL!ƒÎÌÌ”‡.\\:thÉò®‡I“&uìØQÉpà\rÍï_­o-:TªñéTó%ö˜ÃqÌXw5\n·m÷l”¥¿di‡…\rœ4)xèĞîo¼ñê€]îºe‹¤cqqß6iÒà¥—“«VÎ–ş!!ı_{í¥œœÃæ—ñÅ{­Z5\nê)ËŸşTÃÕÖ³E‹¿»RˆıXròæİ»×É>³²JìXµjö:É:ë®Y3OBÉ±£Ûoıø¯×_‡ÚĞAZZÚ#<âşs·f\nq\Z¿s[·nİŒŒgQ\n	\n\n*%…0`Â„	î2~üxI-·}4ğ–æ÷¯Öƒ·*ÕH!òâzTÖc…mã¡GãX‰-ŞöoÛ¦©4‚†õˆ];bDoÉ\"ï¾üÑGc·lùW|Ü·-[¾vèPÄë¯¿rætÜÂ…ôîÕaxp¯¯¿óüóOKÿ#…lXÿ¥¹7×{!FcÍêy²İıÛ¶m*ëE‹>|çÖ<şãÇ…†ô5ªo¹ÿõúëPšÈÏÏw·İ)D\\¼xÑl˜)dŞ¼yãÆ3Æüùó=SHzzúªU«BCCsss{öì)e£<›””tÇ2ĞüşÕzğÖ¢C¥\Z?‘Iu8¾âšmÇÑcm¼ú\Zm»{Kj™úK\nÉÍIêÖ­Í¡ƒC‡t“ş’$…DnY*Ï®Y=·OŸıúu\nĞ¥K«áÃ{ÕwĞÀ.3gÉË=,;ùâ‹iC†t›3gòÜ9“ëÔyT\Z²ôïÿ¶¤÷ñAçè²}úæ›ÆŒ8fÌ ×Ã”Ëñ_¯¿µ¡¡×_½äFÉ)))Å6JÂ1b„ÙîĞ¡Crr²ù#˜³gÏ†‡‡Ï;7\"\"âÕW_=yò¤¯7AóûWëÁ[‹•j¼\"¯¬©ÆÚµ¾îz¬=º»yÓ?//ùÉ\'ÿ§wïö/¿ü×Ó§bš4©?ztß·Ú63ŞYjvKJŒX¾ìSi´nÕxÍš¹_¯šµzõ÷ş?ùdüìÙïîÛ»nß¾uõëÿŸ¬¥ıé§ãgÍšä>¶m›~ùå²I\'ÿüçY¦NáJ!·|ü¥ô×¡64ôÜsÏ•Ü8dÈb¿5#ù£^½zæÇ322>ùäi|ğÁ}úô9rä°aÃ:wî|ùòåS§NñWËü“æ÷¯Öƒ·*ÕH!){Š¬]/´î†#Å\\Ìvá{áF/ûÇÅ®iĞàÿ¢¢V¶z³‘gÿ>³eË³¿¤ŠéÓGÉSmÚ4Z%e¹æş7~©äñ¤¦n¹çß~öÙÄeË>ùpfXrRDrrÄúğ¡¡ınıøKé¯Cm\0JóûWëÁ[‹•j¤Ã#»kín®FñeéŸ›s°wïvûö~ëîß¥sË‡şÏcG·,_öqÇÍ{toÛ¹óÁÁ=Ú¶iÔ}ğà.Ò_ÉšÕ³‹íÿ™g,¹ÿ„}ß-[ö±4æÏŸú¯¥IãÂùİ/½ôìâÅ3Êåø¯×_‡Ú\0•æ÷¯Öƒ·*UÆXàz•u-‡ù\\´¶_Ù^rãM÷wØ“onÿI‰KéŸ›s /ï¹ÑfKòİñ›\rjTšß¿ZŞZt¨TãÓ©’ÉÒ(0%×…}{´µî¯Cm\0JóûWëÁ[‹•j¼’d,æKl’Ã^øĞİpwp\\ıPçş:Ô¨4¿µ¼µèP©ÆçBWÙÄ¢F’Ù(¶½Ø³š÷×¡6€@¥ùı«õà­E‡J5ŞIô~q8Ñ¿€X™æ÷¯Öƒ·*õ;îpØ¸^k9…\r÷âŞRò)ûË«X±¢êKà&é0·—BëÁ[‹•Z½zõé›\nÌÅYpĞh4–W·u8¨yÿŒ›ï½·ªêKà&é0·—BëÁ[‹•Z»ví˜è%îWÙÇ~E^tİ]kç•Z÷—3öä“V}é\0Ü$æöRh=xkÑ¡RCBB‚‚º8äÅ5Áızì”¥Àóå¹ØÃÍû~gô¨îª/€›¤ÃÜ^\n­o-:TjLLL\Zäçívº^eåå6Áx¹-\\<J×şr®jÖücÔÎEª/€›¤ÃÜ^\n­o-šTj‹-¦M\\àØçtìs­\\\rã5¸h‹±± ğÙcÙ§m9W-š×W}Ñ\0Ü<MæöëÑzğÖ¢I¥&%%ıú×wïØ¶Àõzìz¹İ+‹ÓX»\Zî-WÚgvĞ°ÿsªU«’xhµê‹àæi2·_Öƒ·}*u÷îİ2Øˆïg8ö8ÌW\\×âzè(jm1ÛfC«şÛ·Í—³´î»OT_.\0·DŸ¹ıš´¼µhU©ëÖ­û}µ*Ó¦´åí*pìvì6×NÇî«\Z[®jëˆımù»äÌTúõİ»ã«¾P\0n•Vs{IZŞZt«Ô¤¤¤æÍ_z¨Æ‚ƒŞŞıeFzx#Îx7×Òpµ¯n>ëôl[¿=îDzxLÔÂà N5jü¡Eó—’Wª¾D\0Êns{1ZŞZô¬Ô˜˜˜Ñ]Ÿ|²VõûªŞQ±b]ÉØåÔ~²–œ˜è…ª/€rSAË¹İMëÁ[‹æ•ªÜØ±cU€\0¤ùÜ®õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µÜ°RSSS£££ãããe½iÓ¦+VLŸ>½gÏÙÙÙî>ãÇ—íî‡™™™ÿüç?»uëVroÿû¿ÿëp8ŠmüôÓOSRRÜ7lØğñÇßÌ`,Âf³-Z´(++ËYtş÷ìÙ³cÇÕÇ pB`\r7¬Ô£GÎ={áÂ…Ë—/ÿÛßş&YD¶üüóÏv»]=xğ`¿~ıBCC»té2xğàÖ­[K(‘×T³ƒ8qâ„|ÕŞ½{÷ïßß Aƒ„„yÑ‰‰IOO7;œ={öÕW_•ì&»êÜ¹s³fÍ¤=hĞ Ÿ]9?rÚ+V¬X«V-iT®\\¹‚aóæÍª\r@€ …À\ZJ¯ÔØØØ·ß~;88X2Á¸qã}ôQYKP\n\n’íqqqIIIÒyàÀçÏŸ—8’››ë¹“Ï?ÿ|È!óO=õ”Ùèß¿¿„wŸŒŒI-‘‘‘ò½:uêÔ´iSÉ4ï¯’‰\'V(á™g	W}h\0,Œ÷YİH!–áM^~ã7$yŒ3FRÈØ±c%‘´oßşâÅ‹òÔåË—%yŒ=:>>ş½÷Ş“êïİ»÷Î;%¾˜ïšHŸ|ÿı÷æ®Ş|óM³±víZÙ.İ»wÏ;WÇ…dãÆe?h¤ñİwß%\'\'ûjäêœ={öÎ;ïôŒ \r6¼ç{233U\Z\0ã}V7Rˆex“Bä5r§¡AƒfCrÉ¥K—ä))îI“&M›6íé§Ÿ2eŠ$•=z|ıõ×/¿üòªU«öîİë4RHëÖ­ƒ\r<òˆÙ=˜)äÈ‘#Ò­eË–ÙÙÙ;V¯^½Ş°Ö––æë3 Ä!Cd¦0\'ˆJ•*É0a‚êƒ`m¼ÏêF\n±/SÈ6CıúõÍFóæÍÍO§feeIVØ´iÓk¯½öı÷ßKŒèŞ½»lïÒ¥‹ûS¨¥¿bzë­·d½xñâ®]»~j=zt¹ÕäååU©RÅœ#Ú·oÿğÃû1\0”ï³º‘B,Ã›Ò­[7ÉcÇıË_şbşD¦GçÏŸw\Z)döìÙ«W¯nÔ¨‘¬×­[\'ùÃY\"…:´ØçBP2…¬X±¢U«Vãıû÷3fŒ/†ì\'Ö¬YcÎ5jÔĞğ_*\0|÷YM¤Ë¸a\n9xğ $É“\'O:õñÇŸ2eÊ»ï¾+[8`vèÕ«×±cÇŞyçáÃ‡GEEµnİÚyu\nùÇ?ş1wîÜı†\r\Z˜Ï>ûlÎœ9îï\")dÑ¢E’B$|exï½÷;…ˆgŸ}VÎóæÍU€\0Áû¬&Rˆe”B$IüòË/™™™YYY/^lÙ²¥¬¥-[²³³åÙíÛ·›aBRHNNdˆyóæ9âşM]OMš4)¹QBLåÊ•gÏ-)ä£>:bØ°aCXXX9ÒO¥¥¥ÉùÔÏ¾\0P‚÷Y¤)=…$$$ôíÛ7((hÔ¨Q!!!#FŒõÈ‘#‡j¾â4~M¦uëÖ&LHIIiØ°a~~¾ltÿM1ò¯ÿ’÷ïßoşRîÂ…—-[&\r‰>õë×_ºtiyÑ¯iş;ı\0|÷Y™X-£|_óòòÌ†Äˆ‚‚‚’>\\ú—Ûl6³]òO¬ÈÈÈÿøÿØ²e‹êPxŸ•bü[\\	¿ûİïV¬\\)ADÃßæàSšÏíZŞZ4¯TUÌñC¾ÍşÃ›\"\0nÑŞ½{ÇÛ´iÓ§zªzõêwß}·¬¥-[d»ù×›ôÁ›eT¬Xñš?:ïxFs!ˆ\0¸9YYY¡¡¡ÿùŸÿYòï•#}¤§ù÷İ)Ä2*W®|îÜ9ÕG¡‘’ÄDd;Ÿà¥¼¼¼™3gV­Zõ†ùÃ“ô—¯r†/P‘B,£F\Z©©©ªB×‹ æ\"Ûù°*\0oddd<õÔSñBfN:}µxIttLZú‰‹—.ËZÚ²¥C‡ò¬gçºuëÊTÂ‡H!–Q§N¸¸8ÕG¡…Ò#A€—¢££«W¯î?üğâ%KsróJ™[äYéS³fM÷WÉd?ª‡â+¤Ëhİºõ¢E‹TEàó&‚D\0ÜD‡J•*™Iâî»ï1cÆ¥Ë97œXÌEzNŸş¾|•ùå²Ÿ@\r\"¤Ë˜9sf¯^½TE€ó>‚D\0”\"##Ãı.HµjÕ6oŞâå¬â¹ÈW¹?M\"{ÈÍB,#66ö±ÇS}¬¬„ àšòòòÜŸ‘’”|ø&\"ˆ¹È×ºƒHİºuïÃª¤Ë°Ùl÷ßÿşıûUH`*ANŸù©”©ÁóY‚\0O3gÎtÿ ææŞ)öÈ]wİeîPö¬zpåŒb%Ó¦Mkß¾½ê£@%#HHh¨d¾C‰I×œd»<+}\"\0ŠÉÊÊrÿËŒ3n1‚˜Ëôéï»}7Àş)ÄJNŸ>-/–æM‡òrÍbŞğ×\"f1;D\0bÎúÓŸ¼ÿ8jé‹ìÇı[3¡¡¡ª‡XH!óÕW_I-XV¨”rÍ âA\"\0JrÿuÔÅK––K1Ù›¹[Ù¿ê!–\'RˆõôíÛ÷‰\' ˆÜºk~¤XÈğ\"%#ˆù,Ÿ`Ú³g93È<Púß)ë\"{“ùÊÜy ı_3¤ë)((èÔ©ÓİwßÍfnÅõ~#æzQ#|ı†RŠçB˜Íf›:uê‚233K>;vìXsrYº#ˆ¹tèĞÁÜ¹|—Û?p!…XÕW_}%/¢íÛ·ç·fnBé¿”{Í R±bEo\"Al+W®4g€;ï¼sğàÁÅ~u¶iÓ¦æ³_-^Rî)Döiî\\¾‹ªá—;Rˆ…>}zÚ´iòZøØcõêÕkÑ¢Eqqq©©©çÎãß-…7äšAÄËBXVV–ûß$Ò¨R¥Êš5kÜÏºÿLHttL¹§Ù§¹sù.\nÏ@ù\"…XÍf‹9sfëÖ­ëÔ©S£FÊ•+—ü‡;LŞÿi²R‚È\r#A`µjÕòœî¼óÎgŸ}6--Mrÿ½Ô´ôåBdŸæÎå»¨>å†½”é¯£†¯ßP2ÏÉÙîå~øa“÷Š6÷ÿürñÒårO!²O÷wQ=•–Rô)AäûˆŞZÇëÚµ«4ö¢¢¢Ş|óÍÄÄÄİ»wgddœ;wî­·Şê×¯ßğáÃCBBäß£G8p`ÇÍÏE~ÿı÷7şğÃ¥[ß¾}k×®-}‚‚‚ºuëvòäÉ‹/¶oßşÑG7oŞÑ£G›5k¶ºÈ«¯¾ªzôÖV¹res*¨T©’œä‡z¨E‹¼rsH!Ğ7A„Ï…À×z÷î}êÔ©¯¿şZ²Å\'Ÿ|2sæÌçŸ~Îœ9’*víÚå4ş/’äää\'Nüøã¯½öšt–öáÃ‡srrÜ;ùå—_G~~~=l6[zzº´=¿ËàÁƒ%ĞH£sçÎîü	æ[áş]Ü†\r¾òÊ+5kÖw?ËçBÊŠ•DøøÚ†\rüñ‘#G6kÖÌL’Ì·FÜNŸ>ıÜsÏıÃğÄO˜_|ñÈ‘#òlBBÂ°aÃ²³³¥=zôèÄÄDiÄÄÄÈNÌ§ÇÇÇ÷éÓ§víÚ}ûöıøã›7o.İBCCeÍ{!·\"\"\"¢‚ñËİsÏ=\'Näwdn)š’ R¥Jş^”¸xñâ?ş8|øğäääÙ³gwëÖmĞ Aİ»w0`@›6mN:%}233»téböoÑ¢…Ùèß¿ÿñãÇÍvttt¿~ı6mÚôÌ3ÏHcèĞ¡k$yŒ3Æışüç?GEEÉ·;|øğ‰\'N<)ë”””.ÜÖ–uëÖÍš5ëìÙ³%Ÿr¬C‡åBø{!@@áo§B¡­[·~öÙgÒ¸|ùr||üşıû8””dv8sæL“&M‚ƒƒ_ıõGyD‚HPPP£FRSSİ;9vì˜ÃáX±bÅÑ£G?øàù’/¾øBÚæ³kÖ¬‘²wíÚuéÒ¥3fÌNy8gÎœ>úèĞ¡C·È:Ø»w¯93ğ·S½D\nÖød Ä‰\'|ğÁ¾}ûöêÕKb‡d‹iÕª•gÏÈÈÈ‰\'J‘èğõ×_Ûl¿téÒĞ¡Ce‡]ºt9}útXX˜ùTvvv›6m\r\Z”‘‘qüøñ¸¸¸ƒ¾öÚk’ubbbnÓ8µäëÿGæ¿şë¿T±<‘B ;şO](a·ÛÇşıû%6Ì½½C‡îöÊ•+»wï.İÌŸÈ„„„L<Y¾Ğ|6<<üÿø‡Óø´i~~ş;ï¼#)Äıã˜E‹mß¾İıéÔyóæ}õÕWÏ=÷Ü’%KæÎ{»F©£Ğ¢	¤fÍšüŸº7D\n®DJùğ©Dˆ ¸i‡ªW¯iÓ¦íØ±ãoûÛ»EZ·n-Ûµk7aÂó£¦îO#.\\¸ğ¯ıkTTTnnnƒ\ròòòRSSÛ´iã4~æÌ™3ò%édİºufÿ={VÒÉÉ“\'333›7o.ki›=/deeU­ZÕLÓ§¿_.)DöcîPö`ÿ•))p¹ægDJ™ø,n…Ãáp¿¥!cøğáç‹ôîİ[6şôÓOp÷şùçİmÉÒ-66vÎœ9			õë×ÏÈÈíÃ†\rËÏÏoÙ²¥äs‹èŞ½û‰\'–,Y\"ùæı÷ßŸ1c†¬¥½hÑ¢Û7ZıÌœ9Ó\rwß}÷æÍ[n1‚Èîºë.s‡²gÕƒ+g¤ ÷Üİs!‚à6pà´$wš¹¦Ó§Oû\"¸\ròòòÜ8¤jÕªIÉ‡o:‚È×ºßY©[·n±_\0¤àŠ²\"€kÊÈÈpÿU‰7÷ˆ|•;‚ÈŞÜoqRpïƒ@)¢££+Uªdfˆ»îºkúô÷½ÿ°ªô”şîÄÈ~doªä¤ 8o‚À\rItp¿#\"~øáÅK––şwDäYéãşó]@ NRpM¥\"\0/eddÔ­[×óÉÜÒ¡C‡¯/‰IK?qñÒeYK[¶Èv÷Ÿ&s$ ãF\n®ízA„ LòòòfÎœéş„‡—¤¿|Uà}µRp]%ƒÀÍÉÊÊ\n\r\ruÿeÕRHé`äzH!@i<ƒÀ­Û³gÏØ±c›6múÔSOU¯^ıî»ï–µ´e‹l—gUàmE\nnÀ\"+V®$‚\0@ù\"…\07)DÖª\0\n)\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )äÿ·[Ç\0\0\0\0ƒü­‡±§(\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0AöwFá¤4\0\0\0\0IEND®B`‚',0),('14',1,'report-back.form','1','<table class=\'view-info\'>\n	<tr>\n		<td width=\"100\" class=\"label\">ç”³è¯·äººï¼š</td>\n		<td name=\"userId\">${applyUserId}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">å‡ç§ï¼š</td>\n		<td name=\"leaveType\">${leaveType}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">å¼€å§‹</font>æ—¶é—´ï¼š</td>\n		<td name=\"startTime\">${startTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">ç»“æŸ</font>æ—¶é—´ï¼š</td>\n		<td name=\"endTime\">${endTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡äº‹ç”±ï¼š</td>\n		<td name=\"reason\">${reason}</td>\n	</tr>\n	<tr>\n		<td>å¼€å§‹æ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"startTime\" name=\"fp_startTime\" class=\"datetime\" /></td>\n	</tr>\n	<tr>\n		<td>ç»“æŸæ—¶é—´ï¼š</td>\n		<td><input type=\"text\" id=\"endTime\" name=\"fp_endTime\" class=\"datetime\" /></td>\n	</tr>\n</table>',0),('15',1,'timerExample.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0I\0\0\'\0\0\0ë©\n\0\0A`IDATxœíİœTÕİ?şı÷×$6\"<å4šD¥LŒÄ‚`ì1ÂclbbTlXHĞˆ+\n‰F£‰€D\"Å¢(Š4•¢€ô]–ıw.LÖ¥ËìŞï×Í}¹sæî93Ç¼¾fæNQ\0\0@íWTè\0\0\0l\0²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\rÌğáÃ¯¹æš†\rÖ­[wóÍ7/ÚTÅÜãˆç!xN\nı²\0\0l*d6€qãÆxâ‰{íµ×•W^9tè°&M^R\\R\\ÛÒÜ–o¬òæÊÇkwÿ%ÅÅñÄópÙå—ÇsrÂ	\'Œ;¶Ğ/\0@údÖ×›o¾¹Í6ÛtéÒeá¢E‘hr%~ù¾¤$‹7«ØJ–æÛ‰÷çä¦›nªS§NŸ>}\nıB\0$N¶a½DÉ^TT4xğà\\}_œ{·¦¼È_ÑÎí—–ùHÅmSèÿ|ÿçãYŠXè—\0 e²\rU7nÜ¸o}ë[ıû÷+.YRR²¤¸dqlY£ÒÍòK—dİòMªÿàÁ/m½õÖ>œ\0P}dªîÄOìÒ¥s® _¼ò½guVöİú/¼på{‹K•?péâ‘`y{Å‘EÙñåİòÚÜÿ¦›ºÿÓVÕÿ²\0\0l¢dªhÄˆõë×_´x~Tí%%‹òÇ;uêôÄOD£I“&}úô>bÄ.»ì7Ÿ~úéÈ9ÅÅÅY·\\XT²tQnŸe€EÙ©²ã+\Z‹³ƒ	ô_¸h^ƒõ]9\r\0 šÈ6TÑµ×^{ÅW””,ÌÕ÷ãÈüùóó×A4hPì_~ùåI“&o±Å}ûö›ˆıgŸ}VVş¾ÍÂòŠÅÃÿÓXš;X²ğ?íÜñ4ú_~yûk®¹¦Ğ/\0@šdª¨aÃ†¯¼2¸¸dA®_G¦N\ZÑ¥ÿfÎœÓN;mÆÌ™Å%%gù‹¸9yò”/¾˜	&Dç\\Ñ¿0ÿğŠíìæÚ%ËïJ ÿĞ¡/xà…~é\0\0Ò$ÛPEõêÕûè£÷K–.È¶ìàu×]·õÖ[ÏšUşÎÌgŸ}½‡3}úô¸¹dÉ’h¿ôÒKYÏ’òº~öØòFIî<%²FqşæŠó§ÑÒä	Ù\'ô\0\0Øà\nœmFùûßÿ¾eË–\Z5ª[·î–[nûhwÜqq<î-ìğ6¸”æ»ùæ›/)WR^ÖÏª}À€ıë_³¢-X°ğï \Z­Zµ:á„¢qÓM\\¼xq4{î¹»ï¾û±Ç+Yšåñ`~.$,?Ïò›+\'Ğ¿¸xŞf›mVè—n#5jT§Nb\r4nÜ8’ğV[mûhÇ‘8÷z€\0@j\n“mæÌ™Ó¡C‡İwß½Aƒ—^zé3Ï<3lØğ&M^¼¤üİ£ıäSOÅñ¸w·İv‹Ñ¿ ãÜP’œo•’’/J–F¼™ûü7mz÷î=sæ¬hDıšõ¼á†âæûï¿?áƒòİÊ›{àò“¬Ü(ïğŸó\'Ó?æ^Ø®ºÍ;·cÇ{ì±GÑW‰>Ñ3úzÈ\0@\"6v™µhÑ¢;î¸£N:¿üå/Gz«¸déš·Qo>¯mÛèûí·Çc7òh×_¥ùNühÒwŞuì±-\Z6l¸Ë.»l±Å±ö1ÇÇãŞZ4ßò|²4êõ¹Ù>nÎ›¿0W‹-JKK³›Ñ8ãŒ3ò5}ö­›å]\0òç©ĞXZñøÜdú\'œm–,YÒµk×wŞù+SMEÑ?-ôğ€Zo£–YS§NmÒ¤IË–-£‚ÿÊTS)áw\\Ë¦M›Æ6æ€×S~¾‘jïß¿q“&Ûo¿}›6mèÙ³Òû6q$Ç½Ñ\'zFÿš?ß\\>™›«×£pŸ›/UÇûã;®b¶iİºuœ={NÖçê«¯^Z^úÏ]ºtnÅ“,]º¼û¬C…»éŸj¶‰µÚ¸qãŠ¡e§v:óÌ3~äÑáÃGLš<eş‚…±v‰Õ÷Vìÿ¥ÔäÕ\0Ô\n¯Ìš<yr:un¹å–uJ5·.]nªW¯^mùyü|Ç¼;¶yó×¯_¿WïŞ‹\"Í¬~‚qoô‰GÙ<UÃç›û\\Ùœòò}éœ(Ù³ƒíÚµ{õÕ×æÌ÷^wİuÙÁÎ;å.öÎ;c\"ó|òÉ\'eå×˜“{øò}.$üçH.$Ì©xşdú\'™mb•ÆZÍ•½öÚë‘G{|åj>\r\Z4È?ª&¯v\0 VØHeV”,Q»üë_ÿªr°É¶\'zö,*¿šğä3ì*ËÏ·Oß¾;ï¼ó]wu[°pÑZÎ1zvëÖ=­ÉóÍe›ÙKËKùÙ±Mš4éŒÜ›3ÓgÏ‹{ïûÛıÑ>á„N>ùähÜpÃ\reå?€³ E‹;í´Óo¼QÊ‹şò-—r§Zº|_Rñ`îüÉôO/ÛÄjßf›m²|²ÕV[İqÇë´Úo½õ¶xTöğ8x\0TÙÆ(³¦NZ¯^½\'Ÿ|r=ƒM¶=Ú£G:ujòÇWòóíÕ»w”kÏ÷ï_…i\ZôÒ;ìĞûÉ\'kì|sŸI›«æ£vÿ|ôèÑqdiYÙ§³{ı­ùÅeÏ¿4,+X?øàƒeËÊşıï÷éÓgŞ¼yYêËU’íKfW¼™k¯¸¹âüÉôO,Ûd«={¡c¡Æº­ÚjÏK\'ÎVW;\0P+T{™µhÑ¢&Mš¬ÏGÑVŞºt¹©iÓ¦5ó«öùùöí×oûí·û1Uf<6J½>}ûÖÌù–\'™¥Q²+Ü?#W_}uV6kÖ,‚MäœÙŠçÌ/öÍ|àî¹çqï¹çGJr]~†\nç©Ø¨x3™ş)e›%K–ä¿cÁfÜø÷ª¼Úã±ùxÿ¹´\0\0PÕ^fİqÇ-[¶Ü€Á&Û;®åí·ß^İƒ¯‚l¾cŞ¥ŞÀƒÖsšÏ÷ï_œ­Î7—m>+Y:kiùVşcóçÏ?£uëAƒ}ë[ß\ZûÁäÙ—d¥êœù‹G“ıfåsÏ=7sæÌhd-))ln_ŞXºâHy#w$şdú§”mºvíšÿ(ZÕŞ±©¸Å¶ÜrËì„qæBO\0¨}ª·Ìš;wn”æëzU´µÙâœqæšö;0Ù|Gz«yóßuW·5Œü{ïıãÿòïW,\\´¤¸d\r=»uë~ä‘Íãœ5m¾¹Ï¤ÍÌîQÇÏÌ/--mÖ¬Ùy\\|Èá?‰F·nİvÛıÆ¾ÿÁŞßŞgÖ¬Yùn%%Ë›?CÅ›¹0³âù“éŸL¶‰Õ¿ÖYDú\ròßõ­·Ş–¿0´ß½\0ÖUõ–YW]uÕ/ùË\rl²í¼¶m;tèP­ã_WÙ|û¿ğÂ{î¹Ê¯S:}FÛ¶çï°Ã»í¾ûq-[î·ß~QÆıä\'?yı7ç/X¸Êç©_¿şóıû×´ùæŞ·™™ßòÇ#Û<ûì³Y…:lØ°Ù¹k¦…ç»U|lI¾Q2³âñÕmµº2ÙæÚk¯Í^Ù½÷Ş{í/°æ-Î“¿rZÇ=E\0 –©Ş2k·İv«7mŠW¼u³ë®»Vëø×U6ßF÷êİ{•0ÓùÆ_:ìŸÿ|¨C‡«şş÷†xõÖÛnkĞ`¯Ûï¸ãóÙs/)^ùq¶ÆMšÔ´ùæ²ÍŒ’’±/o,Í\Z3—.oäÛ3¿Ôm“ïŸL¶Ùc=²òÈ£=6à×q¶ì´qşBO\0¨eª±Ì\Z9rdƒ\rª)Ød[ıúõã¯TßÖI6ß‰MÚ~ûíWşeO§Ïˆ`©æşûÿ~òÉ\'yä‘M:èôÓOoÕªÕÍ·ÜòïW†vØa÷ŞwßgŸÏ^9ŞÄÙâœqæ\Z5ß\\¶™«×§¯(î§çŠøüÁé«ì°‰÷O#ÛÄ:ÌÈN;í´æß±Y×-Î¶ã;f\'5jT¡\'\n\0Ô&ÕXfış÷¿¿ôÒK«5Û\\|É%ñWªo\n•”””üñ|à²oÃ¯r¾wİÕ­uëÖ+µ]»_ıá†âŞßşö·;w~¾ÿ9wß}wÇ¯ÿuüİ³ÏõÙsÏúãÆŸ3÷‹•Ş¦M›;ï¼«FÍwE¶É¶Os[Å›ÓWÚ>Õ?¶Ú’mÖüêwêÔ)‹gyæÿï:V{vòø+â\0@íUeVË–-Ÿyæ™jÍ6O>õÔqÇW}S¨¤gî—4Ã[lqÉ%—TºLm6ßcmñDÏ•Æ9÷‹y;ï¼óÀA/sÎ9·ß~ûÀh\r~ùŸÿ|è¥Áƒ\ZtòÉ\'ÿìg?ğâÀÃ?¼ëwNöñÊ3ssÌ±5j¾¹lóÉŠª=ßXy+¿«´´R·M·mÉ6k~õ[µj•İûğ#nğÿ®ãœÙÉã¯jú\0@mTeVãÆ‡V­ÙfØ°á\r6¬¾)T2wîÜÍ6Û,«º¢±Ã;<õÔS•æÛ¨Q£•gıâÀAM›6í|ã­[·~ö¹ç¿<dÂÜsÏ=o~ûíwÆ<şø¿N9õÔk¯íØ¾ı¥­Û´yÂ„ÕÍ´FÍ7—m>ª½´ô“ÒòÚıãl‹›•¹{WôÙÔû×–ló•«=»køğü¿ë8gvòø+|\0€Z§\ZË¬zõêMühRµf›&MÎ~5e£ÙgŸ}Š*Øb‹-š5k6iÒ¤ü|ëÖ­»ò¬{ôxì¨£úÕ¯.8ô°Ãúöë÷ö;ï|üñ\':]÷§?ıù½÷\'<ğÀƒôısÎ9÷ú?üáØc}gÌ*~î3›išo.ÛLËÕë±ŸVZ^Üœ?RZáxv0ßØÄû×–lSöU«=;8iò”\rşßuœ3;yü•B?\0@mReÖ–[n¹Ê«~mÀ-ÎõVş£ÿ…•Í7Æ³ò¬Ÿ}®O…W]uõùçŸÿô3ÏŒ?ş‹yógÎúìı	ŞŸğAÏ½.¸à×íÛ_zÉ%í~Æ£ß~{u3­Qó-Êe›ÒÒ¬pŸ¶¼‚_éféO-Tÿ/æ¾_sÆS”û\ZI¡_ºõµÕV[eùnğÿ®ãœù¿R}ÿ\0¤Çû6ëfûí·Ïª®m¶Ù¦uëÖõë×?ñÄ¿ò}›ÉS¦î¸ã½zõnÛ¶íÍ7ß<rä¨Y³>‹x3}ÆÌ÷ŞŸpæ™güñ?üÈÑG}CçÎ5ê}›5Ì7––Fù>uù¾¼”_¾U:Rºb¿öıÿüç.£ßz1;~×]7\\tQÛ‹/j{å•¿É÷ïÓçásÎorÛ…+ö^xN{KJ¦,YüÑâÜ6mÚÈƒjü‘¥%Sâ$Ÿöî1ÇqıõWTÜ;®ùÇZÿñ¯¡QíyßfÍ«=»Ëû6\0@Íáû6ë İÛ£:ê\'?ùIƒ\rúöí[i¾Ù·b*sñ’âèË­·^ğë_wüİï.ºèâ—‡y¾ÿ~ı¿øâKn½õÖ“N>ùég\\4pĞKãß{ou3­Qó-Ï6K#$”oÑˆ\n>¿_~°4+ë£±âæZ÷ÿğÃáH^­oÜüÑ¾ÿêˆçŞxãùøn¾ÿõ×_şÈ#~çA§œÒò“OFÆş­·<Öã8÷¾5ê…Cm[ãÆÿ»Ë.u¢Q·î·\Z5Ú?;øÖ[/DŸ3ŞŞwß½n¸áÊŠÛ~ûí;yÒ«ë?ş5ô¯-Ùæ+W{v¯ïÛ\0\05Gõ^\'­÷“OVk¶‰ó·h±ñ®6`À€¨·š4iòÍo~ó†nXù:i1U^\'-¶—¿üİï~7ö¿ùÍ…?ıéO[µ:¾yóæíÚıê°Ã;ë¬³ûôí÷gÙ¾ı¥#G½µÊsÆ™kÔ|‹Ê?“69êøÒåÕüäò›Ë÷SrÇ—·Wt›¼Nı?öÆŒ£?ûì#øAÖ¿I“ÿ-)ş(ë3xpÏë®»,Ûşë¿vÉ·ãxv¶Å‹?üÓŸ:úô9çœGÚ¶=cø°gî¼óúÅ‹>ÌÎ?kæèfÍ\ZU6WÄvÈ!M™òÚÿêú×–l³æWßuÒ\0€\Z¨\ZË¬N:]tñÅÕšm.¾ä’k;v¬¾)¬¬OŸ>÷ÜsÏ¬Y³V7ßÕı¾Í¼ùºuïŞ´iÓ\'èÙ»÷“—\\Ò¾ÕñÇÇş¡‡~ú™g[·is\\Ë–£ß~{ÜøñŸÏ³òÃó¿oSsæ›{ßfRié¤¥±Ï5–ïK+´+í×®ÿ“½ÿQ$’Æüyãğƒ&>ÿí…gÿû\rûôùÇ„	CÎ;÷çç÷óØŸuÖ©»ìR\'kgÇyâ‡C=ôûwÜñû7ßì{î¹§ÇcÛwÆë¯?wÿı·5o~È´©¯ıûß½®êğëòíª_wXÑX¾¿ê×qïúŒÍıkK¶)ûªÕÅX™ü¿k¿o\0TM5–Y#GlĞ Aµf›úõëÇ_©¾)¬“l¾?š´ıöÛ¯üKíq;BKÕ¯ß Y³f¿úÕW^Ù!²Í‘GY·nİË/¿\"‚ÍØqã>>cåÇÆ‘8gœ¹FÍ7—m>*ßJ³ı¤å7W\\úŸvù]n~EÿéÓGyg@³f¢İÿù‡{õº·WÏ{{õº/ö¯½úl¾d’ö—´ıåù­›4ùßh\\rIÛ+¯øUv×„÷‡öT´£qÛm£9güøÁÑ6ôÉˆFŒíµgo¾ùê\nÛ5YãÕÏÄ½ë3ş5÷¯EÙf\rF\Z•ÅvÚiå»>[œmÇwÌN¥Ğ\0j“ê-³vÛm·Qo®¦`3rÔ[qşjÿºÊæÛ¨qã^½{¯<à¨\0#Ş|øáÄ{şò—sÎ9÷Ä“N:õ´Ónúã¿<äÍ‘£ÆÁfá¢Å+?0ÎÖ¸I“š6ßÜµ²Â}biéÄÜş£òÆò#+Wl¬Kÿƒní¾}ÿ±ë®õ:w¾â¦›:üüç?íĞáWùşiî¾»óİwß˜Û—7\Z6ü^şá=ztoÙ²y¥­U«/Y2!ëğÄ÷œuÖ©±â_÷4h°Gì£}Şy§?úh÷\r2şÕõO#Û„=öØ#K <ÚcşwgËNû?ÿó?…\"\0PËTo™uÕUW×¶m5e›8óåW\\Q­ã_WÙ|û¿ğÂ{î¹`á¢UÆ›/æÍÿø“O\'Lø`Ì»ï¾ıÎ;ïŒ3ş½÷&O™\Z±g•ÿşç©_¿şóıû×´ùæ²M”ìÆ~YéÄåíÜÍ\n‰+YÛş¹lSŞèÔé’N¿¿xöìÑ‡ŞlÎìÑùşM›Ğ»×½å[ï{³F£FûåÏ¿té‡£Fö9á„£&M\ZZR<áóÏFıßÿô÷¿ßš?ÿÿºûÌ3O~¬G÷ÇûSıú»Ç>Úçœ}Ú£vÛ ã_]ÿd²MÇ³Ò AƒU®ö*lq8[vÚ÷ã—\0@ª·Ìš;wîÎ;ï\\oİÄ9ãÌsæÌ©Öñ¯«l¾#G½Õ¼ùïº«Û™iœ\'Îç¬ióÍ}&íƒÒÒ—×ñY»ôÃe¹}®¦Ïµ—æ|°Nı#Û<ôĞcÇX¼hüQGıèCš<óÌß*ölód.Õ”ïË)Ï6_>ÿ‡9ôĞƒşú×?Fç­xş÷ßÔµëïºvı}l»íö_ùöøq/nñ¯®2Ù&[íY¹õÖÛ6Èjód\'Œ3Çù=E\0 –©ö2ë;îhÑâ¸\rmâœQU÷à« ›ï˜wÇFqö|ÿşë9ÍAƒ^ŠóÄÙjà|sïÛD½şÁ²Ü¾|[^ÍWØW¸™ï¶6ı¿øâíí¶Ûö¼ó~öùç£şrOçfÍ\ZwÜgŸuÊ{ãæû7n¼ÿõ×·Ïo¸¾ı~7şââ÷†¾Ò3qÄÁÇsØAĞ©ÓÅC^~|É’ñÙÃ{õ¼ûÊ+Ûe[İºuÊW”o?ş§õÿ\Zú\'“mB×®]ó?²kuıWû–[n™0Î\\èÉ\0µOµ—Y‹-jÔ¸ñM7ıq›8[œó‹yó«{ğUŸoß~ı¢D{ûUüçZnñØvØ¡Oß¾5s¾¹l3¡té„Ø——ïùFé„lËÚË,]~Pÿ”²Í’%Kò?t!|ÜøUü4ÓZnñØü»@Mš4©tÉi\0€µ±1Ê¬©S§FÕòh\ró…ã\'zö¬[·îÄ&m„‘WM~¾½z÷Ş~ûíT…iö{şù(òz?ùdo.Û¼·¬ôıÒ¥åû|cù>×¨ÜAÿÒ÷SÊ6e¹Õ^¯^½|¼©Ú»7Ùû“ÙIâlqÎBO\0¨•6R™5yrùO®òG-×i‹Àçù÷¿_Ù8Ã®²ü|ûöëW§N»îê¶ö_¶Ñ?­Éó-+¯İË·ÒÒ¬¬_±_úŸã+ÜÄû\'–mÂğáÃ·Ùf›,™l¹å–·ŞzÛ:­öèŸÿ(Zœ\'ÎVè	\0µÕÆ+³¢d©[·îú|8-»óÎ;ğáÄ6æõ‘Ÿï˜wÇ6oşã=÷Ü³WïŞkş%¸7úDÏèªáóÍ]K`|iéøe¥ã£±,k¬¼_Şç½\níMºzÙ¦,·ÚóïŞ„½öÚë‘G{|åj>ù«¢eïØ6\0ÀúØ¨eÖÔ©S5nÜ¢Åqëzå´èŠÇÖÀf­A~¾#G½Õÿ…¢½ıöÛ·nİú‰=‡\rs‰Ú/öC‡‹#q<î>Ñ3ú×üùæŞ·—Û²Â}\\éÒå7ó|‡Ò/ßÜ”û\'™mÊr«½I“&Eì¸ãmÚ´yø‘G‡1iò”ùÆ>Úq$ç 3ÿE\0ÖÓÆ.³-*ÿÊN;ít^Û¶k“p¢OôŒşñ¨šöeúµQi¾‘Uîº«Û±Ç¶hØ°aİºu·Øb‹Ø7jÔ(Äñ¸·Í7÷}›±¹Ú}ìŠÆ¸¬Qéx¥{7ñş©f›²Ü¥ºvíšÿæÌZŠşñ(\0\0Ö_aÊ¬¹sç^uÕU»îºkıúõ/ºøâŞO>9tè°ŠïcÄ‘‹/¹$î>W\\yemÿ¥‹5Ï·OŸ¾µq¾¹÷mÆ®ıVZú®şË’Î6™X½;vÜc=¾2ÕDŸèY+V;\0P+¸Ì\Z9rd§NÊ?Õ¨QÅ÷1âÈµ;Æ½…Ş·ò|·ŞzëvØáè£©uóİ|óÍK—YV^Á¿[Zº¼‘ßòGV¾kSîÏØf›mVè—n#ÉV{«V­\Z7n\\¯^½­¶Ú*öÑ#q¼v­v\0 VHüŸ©>Q§N™<pYé;ÙV¶lL®1&·½óåö˜Ælâı§N´Ë.;ú¥\0H“lS`S¦Lyâ‰\'^ıõBd5lØpÄğGóµû²Ò·+lQÊç–ïËşÓa“îÏØî[è—\0 M²Mİzë­EEE¿ùÍo\n=uvíµ×^~ùÙeË¢d¯òËb[V±è¯tsô&ŞÿÊ+Î¹æê¶…~é\0\0Ò$ÛØàÁƒ[µjuß}÷z ëlÄˆ{î¹kñ’7ËÊk÷(âGçŠøå[Å›•ïÚTûÇsÕ ÁnÃ†>Tè—\0 M²\rUwâ‰\'ŞüÇK–•¾UVúVù~Yy#WÙ¯8’;¸lù½£sÛ[›lÿx®N<áÈB¿h\0\0É’m\noàÀ]»v7o^¡²ÎÆ·õÖ[½2äò*¿¼ˆ[Yn_ŞÈùÏ]oe6Áş/¸·NÆ¾ûd¡_4\0€dÉ6…×°aÃ¢¢¢áÃ‡z Uñæ›oÆà¼ğ—e¥#Ë–eu|ùV~³tEcÅ‘¬56©şÿò÷x–ú<×½Ğ/\0@Êd›Â»á†~õ«_½ûî»…HõéÓç[uv¸ù•,yuYé›eËŞÌöe¥o~éfîÈ—\Z•:¤Ø¿¤øÕxf¶Ùz«7ßx¤Ğ/\0@âd6€qãÆpÂõ÷üï+.ÿÅ«Ãÿ1urße¥¯çŠû7²ı²h”·¿ÜX¶üŞ²ŠíÚßÙÒ×§Lî;bØƒW\\~æ{ş÷‰\'1nlÏB¿D\0\0é“m\noÖ¬YË)ô@Ö×ˆ#®½æÜÜ§^İ7ßl³¢MUÌ=†îÏÆˆáúe\0ØTÈ6…7fÌ˜(ˆ4hPè°&}úôùè£¢±lÙ²B\0€Um\n¯¸¸¸M›6]ºt)ô@øj¯¼òJ£F¦L™Rè\0\0P™lëàˆ#(**ºòÊ+=\0\0*“mj„W^yåºë®:th¡ÂW˜={v§NJKKËr_”*ôp\0\0øÙ¦F¸úê«‹ŠŠ~ÿûßz ¬­k®¹f×]w}ÿı÷=\0\0–“mj„—^zéÊ+¯<xp¡ÂZY²dÉ~ô£-¶Øâé§Ÿ.ôX\0\0XN¶ª˜?ş€¢ñùçŸ;¶ĞÃ\0@¶©1î¸ãóÏ?éÒ¥…ë`Îœ9Mš4©S§ÎÛo¿]è±\0\0lêd›šb÷İw/**zï½÷\n=ÖÁâÅ‹[´h±×^{M›6­Ğc\0ØÔÉ65E÷îİ»uë6sæÌB„u³dÉ’?ş8\Zƒ\rzõÕW=\0€M—lÀèÑ£·İvÛo~ó›®œ\0P(²MM1nÜ¸öíÛßvÛm…UQRRò³ŸıìœsÎY¶lY¡Ç\0°‰’mjŠ!C†5mÚ´Ğ¡Š–.]šı¦çUW]5hĞ B\0`“#ÛÔsæÌ¹ñÆûôéSè°^şõ¯EFİ~ûíã-ôX\0\06-²\rlHË–-»à‚zê©¬]èá\0\0lBd›\Zä8í´Ó†\rVè°Ìš5«iÓ¦O?ıt¡\0°©mjvíÚİyç…Àí·ß¯æ}	\0€ê&ÛÔ ¯¼òÊ?şñ‰\'z l·ÜrË\'Ÿ|3fz,\0\0é“m z½ğÂÛm·İÃ?\\è\0\0$N¶©A.\\xî¹ç¶hÑ¢ĞaCêÜ¹sQQÑ…^Xè\0\0$N¶©Y¾şõ¯G<kÖ¬B„\r©OŸ>Ù5Ó†Rè±\0\0$K¶©Yüñ.Y²¤ĞaÃ»ğÂ¿öµ¯İsÏ=…\0@šdØHî¼óÎm¶ÙæùçŸ/ô@\0\0Ò$ÛÔ,8úè£;wî\\èP-&OûO?ıô¯ık¡Ç\0\ZÙ¦fyê©§ŠŠŠ9æ˜B„êR\\\\¼ÿşûÇ«,Ş\0\0lX²MÍ2sæÌˆ7~øa¡B5zà8à€x­=\0€¤È6P\0%%%±æ™g~÷»ßz,\0\0‰mjœË.»ì{ßûŞÈ‘#=ª×Ì™3·İvÛ¢¢¢gŸ}¶Ğc\0HlSãœzê©QïşóŸÿ,ô@¨v½zõºôÒK£‘ıú\r\0\0ëC¶©qFıÆo,\\¸°Ğa#‰`sŞyçıú×¿–p\0\0Ö‡liv›m¶ùÿş¿ÿoìØ±…\0@-&ÛÔ8S§NmÖ¬Ù÷¿ÿıB„ç…^0`@YîK8¥¥¥…\0@­$ÛÔ8‹-Úl³Í¶Øb‹âââB…êã?Ş{ï½Û´i³téÒB\0 ö‘mj¢aÃ†MŸ>½Ğ£`c‹×ıë_ÿz£FæÎ[è±\0\0Ô>²\rÔ ¯½öÚgŸ}ÿûßŞ¸\0X\'²MMtï½÷îºë®7ÜpC¡Ba<õÔS[n¹åñÇïÃi\0\0kO¶©‰î¿ÿş¢¢¢ÿû¿ÿ+ô@(Œ7ß|s§vêĞ¡C¡\0P›È65ÑçŸ>aÂ×ËÚ”M›6-ö±n¹å?v\0°6d›š«¤¤¤ĞC ÀÚ·o_TTôÓŸş´Ğ\0¨d›\Zêˆ#ØrË-\'NœXèPHãÆûö·¿=dÈB\0 mj¨æÍ›o¶Ùf/¾øb¡Be—˜4iÒé§ŸîÚĞ\0\0k ÛÔPÓ¦Mó-ò<òÈ¢¢¢víÚz \0\05—lS£}ñÅ…5Â¤I“N;í´9sæ”­x\'\0€Jd›\Zêõ×_ÿÆ7¾ñƒü Ğ¡féÑ£G£FfÎœYè\0\0Ô8²M\rõé§Ÿí½÷Ş…5HIIÉ~ûíãî»ï.ôX\0\0jÙ¦²¢ªÚà#ñoóµÈF[6z»wï^S\0\0¨íd›ÊjN¶¡±l\0\0\nNiU™Š“*°l\0\0\nN5V™\"•*°l\0\0\nN5V™\"•*°l\0\0\nN5V™\"•*°l\0\0\nN5V™\"•*°l\0\0\nN5V™\"•*°l\0\0\nN5V™\"•*°l\0\0\nN5VÙZ©óçÏ_Ÿ¿²dÉ’õyø\Z,[¶,ß.--]s‡•oR5\'Û¬çª\0H›lSÙ*‹Ô’’’víÚÍœ93äè£6mZşæÜ¹sŸ{î¹Î;ŸrÊ)<òÈ7Şøëî¼óÎJg+..nÔ¨Qœ³Òñá+Œ1\";òÃş°b‡E‹;6î0`@Ï=o¿ıö_şò—Ç{ì]wİ•uèß¿Ë–-Gå|şùç\r6ìÓ§OvÎxlÖç¬³Î\Z3fLÖ~çwb^Ux–¨duÙæ{î‰\'9kwïŞı’œ«®º*ßáùçŸÿíªÄñ²\\ò,YáÓO?ış÷¿_RA–KçÌ™kà†/‹e0}úô2õ¯ãŒ¥¸6=¿ry\0¬™lSÙêŠÔ¨·~ô£İwß}ÇsÌ±áĞC=&\'¢BÔd:t¨_¿~„ŠÒÒÒƒ:è£œ÷Ş{ïğÃÏÎãàƒ><g÷İwoÖ¬Y4;ì°È?e¹*öòòµoD ŠcˆèÕmT®÷ß¿~ıŞ~ûíÏ>û,ïÒ¥Kc`gŸ}öşûïÿ‡?ü!ºyä‘GuT›6mn¹å–¬¾|ì±ÇÚ¶m(cä‡rÈn»í–Í\"{O zÆà÷Ûo¿»ï¾;;í?şñ˜lL­k×®üÙNÆê–Í¤I“â%{óÍ7£æõ×_9rä˜ï/S=Ş}÷İÓN;-ÒHìãeı×¿şÇãŞh–Ó¤I“ºuëF£^½z7ÎÆ½ÑgÖ¬YßùÎwnü²XS§N{O<ñÄ:uêì¸ã›m¶Yœ›o¾9oµÕV±$Şzë­ö¥—^šÏË/¿Gb\0~øá×¾öµ:\\sÍ5|ğÁæ›o¾WN¬á}öÙçñÇ_İs;ıôÓ·Ûn»ï}ï{±2zè¡ìx<ñÀ¬½xñâH/±Dcõ®yy\0|%Ù¦²Õ©Qúg$›6mZ«V­\"ÀD5Ö¾}ûŠŸûŠâ5kD<˜œ3aÂ„|¶‰Ò­cÇ•N;wîÜˆ+ÿ¹F”ÚvÛmc¹â•W^YİòÆ×©S§h\\|ñÅQ2FøñÇÏœ9³K—.Y‡§zê¤“Nš={vŸ>}²#•Ş·‰²;jĞ˜×‚¢–‡Oœ8qß}÷\"uÆŒßıîwóoøPÉ\Z>“öé§ŸFO{DÍìHÓ¦MóËfÈ!Xá¿ÿû¿óí8u())‰œ9bÄˆóÎ;/nşù¯¾új·nİŠ‹‹³Q\"3WÊ6±lâåË!2vœ¼â¨òÙæ¿şë¿\Z4h?I{—]vÉ²Í·¾õ­Js‰l÷æo¾øâ‹±Dc±­râ1ßHM±rÊr/–q¯^½Ê*d›x`‹-b^Ù³±æå\r\0ğ•d›ÊVY¤¾ÿşûW¦L™2gÎœ¨\Züñ¾}û>øàƒÑîÜ¹sYî“EÑŞzë­cß³gÏë¯¿şün»í¶ì$Qºzê©=¿ìŸÿüg–m¦NúRŸ|òI¤©8[ÜbVéÆvİu×¬J£e¹\nòø¶ß~û|;Êë¸wüøñ‘[\"ÿtïŞıèœşğ‡»í¶[Ö~à–-[Y«,÷/îßøÆ7¦OŸşğÃgo+…«¯¾úÖ[oİ8¯B­³ÊeóôÓOÇˆ¤±páÂxªœ¿è¢‹š5kÖ¯_¿ÈmW8ûì³ëÖ­Û¶‚Æñ‚vØawŞyç¨Q£òÙ&²A¼X?şñc‘:ôêÕ‹{³¿¸†l³ÿşûÇ©\"/•åŞúkØ°á‰\'¸–Ù&Û7¿ùÍyóæ­ü„6l¯½öª˜üãÙˆ¹”­È6Y°¹ğÂóßøúÊå\r\0°f²Me«ûøáÃ‡G•?fÌ˜öíÛwéÒåoû[ÔjQÀ~úéYˆñÀ¨A£âüû—eÿtù\'Š¹?¯ä™g‰{_yå•:ì¾ûîYUúÚk¯EİyÖYgÅ]—\\rIö¾MïŞ½oºé¦µœHÓ¦MW>8pàÀ(+£â\\VA=,Xïó§?ı)rÑşğ‡hGr‹œ–ïÚµëe—]¶.Ïå&d•ËfæÌ™cÇ=øàƒËrŸi|²‚7Şx#ß-^îˆ¯íÚµ‹—ìÒœX	Ù]0²/_Eã;îˆFäœÈ<Ñˆãq0BD…[Wåõ×_Ï¿£²æló—¿üåòË//Ë½¹ëä“OÎ²MdõŸU0zôèÈ6Ûn»m¶D#–pÀ×]wİ*Ÿøä¤“Nªxäã?Şn»íbíÅ€÷ÜsÏã;.Îÿşûïç;¬Óò\0X™lSÙ\Z>\\4yòäØGÅõY¤”hŸrÊ)ù{[µjõï|\'ÒÈĞ¡CÉ‰ ’5fÍš~øá»îºë³Ï>ûôË²h^}õÕßşö·Q³7.nöìÙ3ûÒE‘œÊréâ±Çëß¿ÿE_EaY.;_AŒ0ö‘d~øÃFã…^ˆ$vÈ!‡4kÖ,:·nİúôêÕ«“Ê*FøòË/ûÛß~é¥—¢rÍÆıõ|ÍM%kX6?øÁÊr¯În»í©øæ›o>ãŒ3*^N \"Í_¾¬â÷¬üñV+‰4-Š^½z}öÙ½röÚk¯¬Ñ¶mÛX*ù“¬9ÛDÛ{ï½Ëro\nEŠÎg›o~ó›ÏUİ\"Û|ãß¸ûî»#;í±Çıë_W÷„<øàƒùOcfâoÅ	#KG¶‰ç*rò-·ÜsÏOdÍË\0à+É6•­áû6Y‘ší³ê3ûÌXè×¯ßµ×^{è¡‡N›6mÀ€ƒs\Z4hûüEÏ:wîüì³Ï|ğÁÿ-üØcÍ¾Ü®¹æš¨€ÇŒÓ¦M›¸ùÇ?ş±GÑh×®]öÏü_|qäŸ8Ïm·İöæ\n÷ßÏÎğöÛoÿûËâTwŞyg6†(pçÍ›—yÂ„	O>ùäŒœ#<2ÒÔâÅ‹£å·Ğ±cÇH2÷Ş{o—ùáå/0@%_™mÂõ×_Y1¢ìGñÅ_ä;tĞAO}YãÆó÷F=zô‰\'8eÊ”ÕsæÌ9óÌ3#9ä;D’ùÅ/~ñ¯œXrYãÜsÏ]ûl7üãG~nØ°aü¹|¶YógÒÆ¿Ã;ä—w%ñ7ß|óŠ×j‹¹g¿ŒE[¿~ı²Ü5Ê#lçcŞW.o\0€5“m*[]‘\ZÕä-·Ü²hÑ¢,ä³M”ªQFˆ¢3-›nº©K—.õêÕ‹ıŸÿüçìàÏşó(ó•n&’L–mŠ‹‹›4i‘#ú×­[7ÇŸÈ.u•¿jsü¹Ù³gGñ±$†0ùâ/²Ğ\r7Üğ»ßıîæ?üğóÏ?¿{÷îùşÙø#Éüä\'?É¾eqÌ1Çdï,½üòËßÿş÷Ërß»ˆ¹¼ôÒK1µ}öÙ\'şhÔâx`ÙäINÏš³Í#</}¼ÄG}t<ÿÏ=÷\\ÅkÎ6™>úè°Ã‹B?:ÇëRñ®Èw­°ûî»çÛ‘.ò}¾2Ûüå/‰qfL[ËlS–»ÚŞ¾ûî»ºkŠÁÄZ*Ëeé½÷Ş»oß¾e_¾NZöFĞ AƒÊÖby\0¬™lSÙêŠÔæÍ›O›6íê«¯îÖ­[Y…lóÆoÄÁ¬O–m\"6ÌÏ‰ª1kDQÍ¾Häè\nz÷îe›(û\Z6lxÑE=ıôÓhÖ¬Yş‹.ñ§?ùä“(CO=õÔ²Üû?wÜqÇ¨şş÷¿W,ş†\rvì±Çæ/¢Õ¡C‡_|±âDòï5MŸ>½_¿~Ù°óÛSEõ)+ûFYîŸÛ#¤E1š]5UZÃÛ}_ÿú×ã%èøàƒnÙ²å9çœ“}g&Ïv¥_§‰•¿7²ÁğáÃ³+zÇ+á3Æ+¯¼’ÿ(W,¡+Ä+•o?ñÄù“|e¶™1cÆæ›oeİ|¶ùÚ×¾ö\n;î¸JÙ&Æÿ!¬î+7‘yÎ;ï¼ï|ç;ñ\'bFù÷‘*f›²\\¬Úu×]‡²6Ë\0`\rd›ÊVY¤Î›7ïÌ3ÏŒZğ”SNÉ.ëu^ì?üğ¦M›F\ZÉºeÙ&ÊĞã¾¬Gıë_{öì÷Fu{a­[·Î&-/JÆH ‹-zøá‡9æ˜ì2Íq†ìì£ø‹\Z÷‚N<ñÄJÅßã?şöÛoG¤9÷Üs÷ØcŠ_×.«m²SEâªôVRüİ|4Ê,X°`u×ù%³ºl3wîÜûï¿âÄ‰QÜßvÛmÙ½şúëGuÔ?şñ^x¡M›67nóebß¿ÿìÇpbDÏìE‰3D¹Ægì·ß~‘jxN±\Z+ŞŒ{7ö±’øïeöìÙ_Ùmí—7\0ÀêÈ6•­áÃEe¹Bm\r­xµ±Õ=vÊ”).Y²d•¿ŸÿWù•EĞŠøQñù«T}>şøã¬˜®t|\rƒ¤jÖ¼lÊr/S¥#•d¬y5n43fÌ¸v%}ôQÕÎ¶–Ë\0`e²Me_Y¤ÂÊÖrÙ¬5°xñâQ+Ir¦\0@\r§ˆ¯l•Eê‚Ğ¥K—“N:)ûmõ÷ß¿uëÖù.¼aõ²÷sJKKóxé¥—*^8ï‰\'xøá‡?ıôÓ¾¼ğÂÕ5[6U.›’’’víÚÍœ93äè£6mZşæÜ¹sŸ{î¹Î;ŸrÊ)<òÈ7Şøëî¼óÎ|·ã?>ÿ…¨ğÃşpuÃÈ~K\0`Ó$ÛT¶Ê\"uüøñ_|ñÿüÏÿ¼õÖ[Ùt¼óÎ;§zêC=”ı({qqñì³Ï>ofŸ>ŠlÓ¤I“²ÜO:>úè£çŸşäÉ“+Vº|ğÁA\'|÷İw;U™j#>TÅêŞ·‰Hü£ıè¾ûî;æ˜c8à€†\rF¾=&gÌ˜1cÇíĞ¡CıúõG\ZË#^ırŞ{ï½üÃ¼ñÆ?ıéO£ñÀœ•³ã;f~ıúÅ~TÁ¶Ûn[ñf¥¯Z\0¤M¶©l•EjöÛ/|ğôéÓ.\\Ø¸qã¨)#Û<ñÄù‹¤EbùÍ\nßúÖ·òíìŸíŸzê©¨5·Ûn»_üâ]»v=âˆ#öİwßÓO?=Á¨ÈKM›6È4räÈì²¹Ô\"k¸NZöM›±­ZµŠ\0/nûöí£‘ï“7/²Íäœ	&ä³Ígœ1|øğÇ<Bò{9ßıîw³FöıÛ%+üïÿşo¾]C¾\0°ÑÈ6•­²H}ùå—O8á„ÿ÷ÿşßOúÓë¯¿ş‚.ˆÊ2»dí‘G9qâÄ²Ü§Ô¢OVtî¿ÿşY#äÿí<ÿ¾MxñÅ/»ì²hd¿\'“ı‰ìBÏQéöêÕëú/Ë.ÎKµÊe/}Ä•)S¦Ì™3\'’mä“¾}û>øàƒÑÎ.¨ıüóÏG{ë­·}Ï=ã…>…Ûn»-:Œ=úÀŒvóæÍ?ûì³¡9‘‡³FvñºGyäÛßşös\"<gèóÀlüç\0 €d›ÊV÷ğƒã~øáo~ó›—^z)Ÿm\"“ôïß¿,WÈF¤¹:§^½zY#TÊ6Ã†\rëÓ§Ïßşö·N:•UÈ6aêÔ©ßûŞ÷Æ	ç¹œ{î¹çğÃFŸ¨±V·l†şë_ÿzÌ˜1íÛ·ïÒ¥K¼îO?ıt¬ÓO?=»üWtˆ\Z5*’íß¿lÆŒ|ğAD”–-[F\nŠµwÙ—e_Â‰lsûí·gî€È\Zİ»w—m\0€MlSÙ*‹ÔeË–yä‘ûî»ïÙgŸ}ß}÷EJÉ²Íˆ#N>ùä¬Od˜ã?şíœıöÛ/kÄ‘,ÛDb¹şúë·Ûn»Î;GÚk¯½:tèÇ›5k–=<Êß(L+ıÀâØ±cÏ8ãŒjŸ3ëm\r×I›<yrìO:é¤X6-Z´ˆö)§œ’¿·U«VßùÎwÎ:ë¬¡C‡>’³ûî»gY³f•å~ç—¿üåÒ¥K#õîİûá\"!ggˆ‘™ÏÌÙa‡²ÆA$Û\0\0›\ZÙ¦²U©=ôPd’C=tÚ´iİºu+Ë]9mÈ!QSNš4)nFŒéØ±c”wæDyš5âH{ğÌ3Ïä?“‰åC¹îºëbŸyíµ×>üğÃŠoã”É6µÇ\Z¾o“ı4j¶oÔ¨QY…ŸOí×¯ßµ×^›­«X!ƒs\Z4hûˆÍÑaúôé±–N8á„Ò~ößÿûVˆ¥•dÑ¢EŸ|òÉ«¯¾\Z‘&‹IñØ8²páÂ3w\0€\ZB¶©l•EêÓO?dş;ße¹«´iÓæá‡ÎnNœ8ñÏşóá‡ŞëËâHÏ>Q–ÿ¾Mä¢¨qãæo¼eî§Ÿ~\Z¥jvÙ¦–Z]¶yğÁo¹å–X<YÉg›¹sçF”½÷Ş{çÌ™“_W7İtS—.]êÕ«ûX6e¹eA%û!×âââŠË#K™8U‹-fÏ}ÀÄ™[¶l+§:§\0PÉ6•­áÃEY\r:oŞ¼¨V6lXñHÊrŸI;óÌ3+=äôÓOŸ0aBÖ^²dI–m.¾øâîİ»gO9å”nİºåOU)Û¼ûî»²M­°ºeÓ¼yóiÓ¦]}õÕÙÛ}ùl±6…½l]EŒ™Ÿ³ÿşûg3WzôèÑ®]»èsÿı÷ÇÃ_]!û4c$™+¯¼²U«VÙ\'ß²ïÛÌ˜1#ÖÕe—]–}¥\0`!ÛT¶–?0Y6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«L‘JX6\0\0§\Z«¬¨ª\n=p\nÉ²\0(8¥UeŠTªÀ²\0(8¥\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nd\0\0 ²\r\0\0Ù\0\0Hl\0\0¤@¶\0\0R Û\0\0\0)m\0\0€È6\0\0@\nşˆ5im±\0\0\0\0IEND®B`‚',0),('16',1,'leave-jpa.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0§\0\0\0x}Vê\0\0oàIDATxœìİXTWş?~£É&¿}v7š_Lt¿Ùì_Í7&“¨‰)»û‹Æ+Šì¢ €€…f½Ç®±K°ˆ\"Š‚4©†& E°ĞQ`˜öÿÌ=p‡ª2Ü¹sß¯ç>÷9sçÌåÌsî=ogœi¡\0\0\0\0\0\0€zµº\0\0\0\0\0\0\0†á\0\0\0\0\0\0 Ï\0\0\0\0\0\0\0\r@x\0\0\0\0\0\0h\0Â3\0\0\0\0\0\0@\0\0\0\0\0\0\Z€ğ\0\0\0\0\0\0Ğ\0„g\0\0\0\0\0\0€ <\0\0\0\0\0\04\0á\0\0\0\0\0\0 Ï\0\0\0\0\0\0\0\r@x\0\0\0\0\0\0h\0Â3\0\0\0\0\0\0@\0\0\0\0\0\0\Z€ğ\0\0\0\0\0\0Ğ\0„g\0\0\0\0\0\0€ <\0\0\0\0\0\04\0á\0\0\0\0\0\0 Ï\0\0\0\0\0\0\0\r@xn@XX˜““S·nİÚµk×ªU«REÏ\0:\ZtL„~YÀ€`Œ0#â‚~Ë ß\0\04Âs’’’LMM?úè£…Ş¸š™•-«”WÊiQp_¨õfÍíâ®/«¬¤#@ÇÁŞÁÉğáÃéøıÀ0F0FÄıı\0\0àå <×.::ú­·ŞZ½zuYy9M«¸y†f-—³9V-‹\\Á—¼>“5kÖ´mÛöÂ…B¿P ŒŒ1B¿E¿\0\0xiÏµ yC‹-‚‚‚¸IF%÷„f¦Q]æÖ\nyåó[´)Ô÷ó÷££D3Q¡_.\0ÆÆˆ¡ß¢ß\0\0¼\n„g]ÉÉÉï½÷¿ÿÅJ¹L.—UÊ+ha›š\n\n«Æ$U?(èê›o¾‰ÏøI\rÆÆˆ¡ß¢ß\0\0¼\"„g]¦¦¦«W¯âf4¥(×ÕóŒªrõ–r¶½ªš$ë¯Y³ÚdØP¡_4hV##b„~‹~\0\0ğŠŸŞ±cÇòŠ\'4uÓ¢™XĞº¼²ºÌ9[+øB…dë—•—vêÔßÑ*##b„~‹~\0\0ğêŸãìììèè(——q“Œ2Zz\rÒÈü`õ5Óê‡?+(¸¬‚¢\\{ÿFPßÁÁÎÉÉIè—š	ÆÆˆ¡ß¢ß\0\0¼:„ççtëÖ-$$¨Rş”›L<ı±_ÿ{ju¦R}[®N©ceêÈRÅæÓ—ırŠÃ+Õaåêğrõõ§jÿ\nõÖëñ3gÍâfeüÃµËìæ³²¼ê.#¨ãÆµ®]¿ú¥Ó¯   ÿûÿïÕ«W…nˆğ0FŒoŒH¡{£ß\Z_¿\0\0h~ÏÏiß¾}ffª\\ñ”--Z´(U«Ÿ¨ÔÅ\nua¥ú©Zm·ÄµEË¿|×x\\-SgW¨3ÊÕ©\nµÇXª,×L>°Çj\nrn?ò§¬PÉß¬Ş¿qÔÏÊN{ÿı÷…~éôˆBÅ;ï¼sêôi\nW®\\º9Ã1²1\"‘î~kdı\0\0@McbbÜÜÜ†Ò½{÷víÚ½ñÆ´¦òàÁƒi;İûê¢Ù´jÕJVY*×Ì-ĞÔæLO•j™Rs—B¥YŸó¹ø÷N]œVnP¨Õêb¹ºP®~¤VûGÄi&X\nnv¢™£<áf*Uû©º©]¨Şnõ++K[¶l)ì§?,Z\\®”+._Ô_ÀHKK		‰ˆˆ¸yóf\'222444%%E§&İåêêª64Æˆ1‘¦êŞ†ß{Ño©ß\0\0ååÃsqqñ¢E‹>üğÃN:-X°ÀÛÛ;44,3+»BVIk*{zyÑvº÷ÿøÕ¤úMØn=áŞax,WĞ«”Ötó‰B]P¦®TVUxôèÑ¦í»W¬ß{ŸnÊUêJnâr3¶ê±Ü«vR³ ©ğlÿFSŸ»p/šiG¶è/?/\\¸p÷îİÏÛ»w¯••ß˜Å‹O™2eıúõTXµjÕ Aƒ›ù}0FŒfŒ4a÷6üŞ‹~k4ı\0\0@@/s],//ß¼ysÛ¶mgÍšÇO¼êZbãâ§Ï˜Aõ7mÚDmòçĞ„¸whÒPÂÖš	–R÷Tı T-W«+e²O:wnÑ¢U‹o\Z7Iû‘QÑÏ[5á÷£UPho/1šúF9Áª-ø€AÛ›ü?ˆR¢¸ví\ZE‹/úûûÓšÊ×¯_···§{óóó£¢¢nİºeffF:))iÍš5”@şøã˜˜˜¢¢¢¦mL=0FŒcŒ4m÷6üŞ‹~kı\0\0@X/|]ÌÉÉùúë¯‡B‘¸ÁØ¬¡Ò£GÚƒ>I“à&I%Ü¤f%ì£}eêÜÇê‡êÈ?ÒßÿıV¯ÿéÿ¼ıîØñÏM°\"nFQe…fşQ¢P”hïD¡¨*ĞšUĞºËHêß«®hÁÚŞä_°Dñ#<<<44”âD\\\\­éfdd¤£££šûXìñãÇİÜÜ.\\èTÊK—.=vìXVVV¶¤~#F0Fš¼{~ïE¿5‚~\0\0 ¸».fgg·mÛvıúõ/›µ—Õ«×´oßŞ`:’ûx^±f¡(fó†2•º°\\óîD^…: \"éó/¿z·í{o·n³û°G…Z]*S?•ix=4¢ê±š‡W­¹™Ê³-ÜL¥X{ÿFSßÈ&XõG=ågŠééé\'NœX²d‰««+¥‹“\'Offf²øÁŒ?Ş_ËÅ‹ÍÍÍ›ª„1\"ö1¢îmø½ıVìı\0\0À¼Àu‘/]GiJôÒÉ™-§NŸ¦ıP×ß³ziÜ$é‘B3ŸxD›7Ğ«X®.ªTç>–‡Äg|Ùıëû\r|(S?(W?,WÈÔ4ÅºÎM°l^¢Y¸I	·+EÕZ®½‘Û¿ÑÔ7¦	Vc¢…>ò3‹¶¶¶ùùùjî;,XP3~ü¬eÕªU\'Nl’¿Şx#¢#zêŞ†ß{ÑoEİo\0\0Dc¯‹999íÛ·÷ôô|ÅäÌ–ã\'N´mÛÖ\0?¿ÍM’qS\nš@õìõC\\âíÈø¤Ğ˜¤à¨¤àè”¸´Àğ„ñw‚¢R®E%G\'‡Æ¦ÄßÎÚ±çÀh33ö(9[ËißäÊÕ7«÷o4õf‚ÕøhÑäù™Å‡zâÇ¼yóV¬XÁÇåË—S\\yõ?ıB0FÄ;Fô×½\r¿÷¢ßŠ·ß\0\0F]ËËË¿şúëWù´vÍeõê5=zô0´ïãşoÍŠ¸ÙMŠæÎİ¢FÉê+ª¹Ö~´:û7úÆ1ÁzÑhÑ´ù™Åıû÷/[¶ŒE‹ƒjÇììì3gÎ¸¸¸TTTÌš5‹}vƒîMNN~Õgş\"0FD:FôÚ½\r¿÷¢ßŠ´ß\0\0”F]7oŞ<dÈ&LÎl<xÈ¦M›ôı_7Á*”+\nš¥•årM™[³U[4nêÁ«f´xğ0¯Ş«}o“äg\niii:)Z,Z´ˆ•\'L˜’’Â>éZPPàëë»oß¾€€€äææ¾ÊŸ~!#b#úîŞ†ß{ÑoÅØo\0\0MÃ×Å’’’wß}÷E¿[»1í“ölP¿ÿÌ}´/Ÿ›=Ğd\"_.¯*ó[´or3|Ô§Eì¬šÑÂÙÅåïÿ{bRr­]—¶Ó½T§	ó³]||¼ö\n={öd?º›““óË/¿PaÓ¦MsæÌY¼x±½½½……EYYÙıû÷årù«€€1\"º1ÒİÛğ{/ú­èú-\0\0€jøºHY³f5yrfËô3ø·&÷îD~­‹œ/Èk¯ åú¢`Õ\Z-Ø\'6k\r,Z°\nM›ŸEcD\\cİ›A¿W¿\0\00L\r_ÿñèãmgşÍç>ø g#q¬<¹<Öš‚‚òU¾œÿ\\5É×ï«hQkÀĞÆ0\ZcDDcİ›‡~+¢~\0\0`°\Z¸.ÆÄÄtêÔIOÉ™-;v¤¿Ò<Ï¶AÜë!7ixX=ÃxÈÍ$øk­ ñú\"`ÕúAuÂƒvÀ¨-Ø½MşÿŸ\rÆˆXÆº·6ô[±ô[\0\0\0CÖÀuÑÍÍmÁ‚z\rÏ6¶¶ôWšåÉjÈåòµk×:tˆı¤Šê	[p‹öÍ‡5–¨O‹AM°ê‰yu}ùp]Â÷¢_=ÁC{oÀ`0FyŒ {×ıÖû-\0\0€qhàº8dÈooo½†gO/¯Áƒ7Ï³%§OŸfóÂ×_İÖÖV&“ißËM°îWOøBÍEs—R©SMºõ\rj‚UÿKÌÔÿ³=µŒ–-[6&ZxÀhŒC#èŞuA¿5ä~\0\0`\Z¸.~õÕW7n„ê5<‡††uëÖ­y­šûòp~šH…6mÚxyyñ÷r¬{4uP*ï+5ˆ{l¡›ºîŞê:Uõ=ºmc3“UËÏOLN¹s\'\"1ñzii:İûàÁ-³Ñ&EE)rù½ÜÜ¸ü¼Ä‚‚¤¼¼ªÉï6\'\'vüøT¸âãïïq%ğL`àÿ“ÑÑ´‡?şZ¼x‹‹››=-®®¨¼v­KÍöøø]·Îµfû>ücÂ„QT8çõ5ŒêÓ~JKï¼ÜóåëÔ«ş—Xİ¸¼­5`42ZrÀh½‘Æ×Ÿ5kREyv=õ{õúw=ûç‡€Îş>`Càş¹s¿%%Ón¤7yûõ4FĞ½ëb ı¶®ú––ééOŸf¤¥†ÓÍŸ~ú±¬,355üÉ“;¬>uøK—NŞ¸áCKjjXTÔ¥˜˜ËtÎ×S{Äxn\0\0\\×ÅöíÛgdfé5<gfe¿ÿşûÍól™Î;kO_ıõï¾û.++K]5ÁÊå&\r´ÎUjf÷ø-J­íl#_ËsfÌ˜°dñ¼~ızR¾¥iĞÎkÌÇØ°ÁíóÏ?}RšNÕÊË³ÂÃ|gÎœHs&+«©s/šgm=*óû_°À’ÂsÆˆ€€“§Nèß¿×‰»OÜ|*øûı¾}ûÏ2Y¶Lv—Ö•ÜzÔ¨!¬¼{÷şï¼yÓi\'´óáÃ8:Ì¥‚­í¬=¿ÏÉ‰¡j••wiÿTpr²IK§Â˜1Ã^âùêÔ7´	V=/qc¢Eƒ£Áha°£‘ô1F^´ş?|§SŸ‚ÄÈ‘ƒi¼ØÙÍ^´ĞºsçNVv¶³hmON¦NNC`şüÜ˜Ë†€½½%?4Cµ2‡ıû7ÂhÿcÇ×Gûõ7FĞ½ëbı¶Öúùy	Ÿ}Öùğám—N\rÒ¯  iÄˆAYÃ‡¼uëª¦š<wèĞş¾¾Ç©o{xì£Kÿİ1n¬©>Ú#Şs;\0\0€°\Z¸.¾ñÆ²J½†gÚ?Mq–.]ZÏÛ ÍI3oP²ÙCnÕ4¢ÆMå³í9|…ì¬›{÷n Â¾}¼½ó>wÄİ}GQQòÌ™X}kë©QQ~:;¼{7š¶³›—.y¬\\¹¨¤ä6%ğpßØØ€¡CûÅÅFGû—•eP?¿}úü?;»Y(3Ğšr…çJY¶¦Ù7çÎÂïŠÅX¾ÁS§£æyyvq±ûòËÏœ–Ì§BzzµŸÂ3UÈÎzÑç«]›á¼‚õkd´`‹ïE¿šg¥-´½‘{¸|9†XN#½ôy¡úƒ÷­YŸò¼yÓ×­sÙ¼y9õä\rÜV¯^Byƒƒu\riSÇeeİ<w†€­f8qC †@n­CàÕÛ/ÈA÷®GóôÛZëÛÛ[R$\r=Ÿ–\Z\Zq1$ää)*_»æÉ*Ğ¹}ÆŒ	§ÚZT˜´dÉ|öğ™3&è£=/Ôo›g.\0\0 \nR|ç¹uëÖl.õÖ[o™››wìØÑÔÔ”wB©¤9DNÕZ3Ÿ¨Zt¶(«×Úõ]œm(úNš4º²2ÛÛû°»û/[·®¸rå4«ik;óNz˜ÎşïŞ²²¢ğœìE“øC‡¶œ>} /ïÖ©“ûì}äÈ6Z\rê“•Au.ùŸØ²eyÍöLœ8êvJ0âb¦Mçè8wñbëO>ùhñ\"k*OlwY.Ï..NyRšJÍ+(Hpu±=~|WH°—™ÙĞÍ›—=$\'\'úEŸ/¯¡M°êy‰ƒ‚‚(`\\\nh°g\Zå[s¤¿1ÒÈú¥¥©_|ñ¯šõ##/Î˜n~õêZzöüÖAWÏôïß“ß\r©S5C`Ñ\"Í õB~TV\rÉ“¹!àZ5FÖQ£†äæF7Uûõ:FĞ½ë\"x¿­µ~T”ß¿şõ1rİÜ\\¿î5|ø\0\'§ùcÌL¨öë÷ÃãÇ·©ÎàÁ}(<_¾|’\nöö³÷î]ïè0‡zïôéæMŞQŸÛ\0\0„%¹ÿóÃfWıû÷ï×¯_§N|}}ù{5,Å]·P¦üºj£’Í-¨P}“ÛtfÖÌ	–çXYM™=kâœ9îîÛÇœ|Õ×„ç;a:ûÏ¹{ÓÚz*•SSCîİ‹¡-»w¯­¬¤ù^„İ¬€€ßÏ9°`ÁlºIuhr?iâ(ªo5wÊ\\n¡¨<aÂHšú³öDFú.[fÏö?Vó~š¦yÔÌŒp¾ı”NÚ·páœ={Öúù§¹\Zåö}¾:õ\rj‚UÿK¬n\\À0ÊÿÚHz\Z#/TÿÒ¥ßÿ÷;]=­S?,ìüşıOŸŞïåuèßÿşš\nGîØ±ãg.höÏ†\0«Ïı—Ícidd„óûŸ<I3Ÿ\r¯¦m¿şÆºw]¡ßÖUÿÁƒ8:ñ&&&Ú¯¬,½¼üNyYº‰I¹<ûØ±”«gÎ0<yèĞªÿğaüíÛÁéé¡II×äò¬&oHÏí\0\0\0‚køÛ¶Ïzzê5<Óş\rj¾oÛ ÙÀ×_ıöÛo¯\\¹²¶odÍ¦É„²jJ‘­¹Yµ¾Ëm¯*WWËæëÇÄøoŞ¼ô—_VÒšæâŞçSx~T”`j: ¢üU³³›y\'ı†ÎşïŞ´¶šÂö9ş4û³(øáÿøúº/X0ë‚Ïo{ìígggEdgG\\¿~öæMßØú[´õß°ÁÅÖvÆsšt­¼áÓ«×÷..6.Î6Ÿ}ÖÙÙy>-_ıËŞô·Ö­sîÔéŸl\\¼Ø:=ıµÌ“—{¾Úõ\rj‚UÿKÌÔ0ŒõëˆIc¤ñõ§Ls+ş2uÎÊÊLíú4.ı…Å™Óû¿ÿş+OÏ_=Ï=zhjj0Û[\\Ï§!ÀÍÈÖ|v#[{,á†€‚\r¦n¿şÆºw]¡ßÖZ¿ìiÚªU‹şóŸ+W:÷>òÃß®Xá¸b…-Ÿ~ú¿TŸâqQQÂ\nÏ—=ú÷ÿaåä½{×õéóßƒ7qÿó¿‰Û#Şs;\0\0€à\Z¸..]ºt¾^Ã³­­³‹Kó<[æÂ…»wï.((¨y÷îD–R™¥ 5W¨Z+µÊ:ëêúl8thSvV¸ŸßÑõë½½º»o£»¶o_qñ¢;U³³›q\'=Dgÿ9w#¬­§hïßçüá;VåæD.X0sß¾u!Ágíígef†ÅÇ]Ú½{õêÕ‹–/·§I[è±Ó¦İ³g\rİKŒ8¿lÙ¶ÿ±šT¬Ù§••Evv8•¯òõımŠ…•]]lÒÓ)oTU{‰ç«½İĞ&Xõ¼Ä<\nmÚ´‘Ôá6ÆH#ë_?cc3ê{yps³åëŸ;÷«³Ó¼µk—¬[çDËçŸÂ\n}ûşwŞ¼)ŞŞ‡¨fddÕ eìXöX«¹ÜPd]»vÊ÷BÕ \\¬©ÆFJÓµ_ßcİ».ÂöÛºêËå‰	\'ˆ‰¾x÷nD¿~ÿïüùCç½5Ë÷ßÅê—–&Ïœ1>0ğwºˆ°ÇÎœ9åêjÓäíõ¹\0\0@X\r\\cbb:uê¤×ğÜ±cGú+ÍólÄM°25‹’­³ªnVoT<+kîÒº™ùë¯hJDå˜hß\rœ½Ïıêî¾5\"âü¸±Ã\"Â½©¾í.¯>·Mx¶²`OÚ½k×Ï\'ŒPÈ3>ŒÙ»w­™ÙĞ›‘çÜøàA«Ÿv}àÀıı²œ>½—îåÛr¶gÏï\\œç¹¸Ìûì³]\\æSùë¯¿H½}o¿&9(2iNF»ÊÏÓ$EfYYÊã’Äz¾ÚÇG¤¬š_Müàa^=¢®àAE´h¯2F\ZS?*êÂĞ¡}K\'±úK–XíÙ³†¯¿uë²E‹æ®Zå¸nİ’/¾øtãFZ(dÜ	aõoÜğ¬\ZÎlÌsæ‡@u{ª‡À|\ZñUCà)¯Ú~Ã#èŞÚôİo¬oi9±¨0şNzğ€½ÂÃÎ……£5õUV¿*<_>A§wû3éjrëÖ¥Î;äÇé©=Ûo\0\0YÃ×Åüã±qñzJÎ1±q´ÿfx¤™`)Ùì!C©ÌàÖ™šBÕ–êíÚ…êúû÷¯7Ö„&ë3g_»v‰—ç~\nÏ4A¿pá«`k;íÎ`ıß½nmmÁïïŞ5cÆ))I(/K™?Š¯ï\n	tå•é|{>M¦y˜¬\"•Ê¿ï<xp¿CÊØ‰‰—ÙÍQ£±úii×JK“øö[XŒ¢‚­Í´‰G8:Î¦j\nEFàåãË—/x¡ç«}|Ä;Áª0œ]\\êyó­fÀ úF-\ZïUÆHıõò;{ö¬4èÇ¢¢x~;mœ<y”³³uyùmúÃ‡÷g…ë×OççÇV\rû7¹! Ù®\\}­! Ùna1úÙp`CàN`à	Íx…öàA÷æé¯ß6²şsÓaÃú9²…Ö|ıaÃú³úE…qtá8¦yçY‘ñøqâ¤‰#gÏ6·±™VA=_í1ä~\0\0`°\Z¾..^¼xúŒz\nÏ´gGÇfxÄM°hŞp‡Ö*eFU™»©UÈ¨±E³>ïıkDÄ9*çæ„Óè·ß6»»oÑ®?cúØ;é×µ÷îÜ^½¾ãÒï³½…Ş8{üøöz†Ş8Ã¶xü¾ƒBµN{îå†ûm×®]ÿåSk{z÷ş·ÎÆÇ%üôÓÛ¶-£2%ùø¸‹Tøí·-Ó¦¡YÚ½Üˆz¾Úíõ«€QëÇVµ†ÑD‹Æ{•1Rık×N:ØÏ¬(OÑ©¯§»ºÎ>Í×ÿå—={~Këß¿f<ß!p+Ş6ÒPeC€Fî«´ß0Çº7£¿~Û˜úÔ‡§L™BeSÓŸh-«¸=qâˆ=¾dõ33CfÎwöÌ^º\\86p`¯˜˜´ÿÖyxìlòö~¿\0\00L\r_KJJŞ}÷]}¼ùLû¤=7Ãól$î£}éJåªÉ++ï¨¸57±àÊ\n~Kz]õ+*Rhz¤]ÿÉ“D…<M»~Eyreej­û§»êß?­)	ÔÓÔÛW_¥ı/T_ì¬ZF=_˜Ä†1E‹ÆkÂ1òÒõŸ>I|RšØ`ıÔÔ«ÍÓ#èŞjÃè·õÔ¯”İ..guäò4\nÛè·\0\0\0¨Q×ÅÍ›7\Z4¸ÉÃ3ísÃ†ú~†/„{w‚&\ré*n­Yª¦Zk­›|5‰×7‚	V­ÿA´Şkÿô%`ŒˆqŒ {£ßŠ±ß\0\0šF]ËËË»õÕš5k›09ÓŞhŸKŸèû¾n‚•¦T¤ÑZ3‡àÊ4¶°rÕEÕFÔ7	VÍ€Ñ˜Å8¢EãaŒˆtŒH¼{£ßŠ´ß\0\0”Æ^srrŞ}÷İã\'N4Ir>uút»ví22³ôúÜ^7Áº­R¦*š5_¨Zsİ\n¨¯L5š	Ö‹£‰‡1\"Ş1\"åî~+Ş~\0\0`8^àº˜M×QÊ½¯˜œ)Ó~‚ƒCô÷¬^\Z5L¥™@h¥’Í-ª×ŠgÛkn”x}cš`5>`S´h<ŒQÉvoô[Q÷[\0\0\0ñb×Å°°°víÚ½Êç·é±ï¾ûnú½<›WÆ}©LŠR™¢R¦PAÅ\n5×Uunk•%]ßÈ&X	F-\ZcDìcDšİıVìı\0\0À¼ğu1\'\'§ûW_\r\Z4øE¿›êÓ£è±øim÷îD2·°ÙC²RQu“/ğ”Ïß”r}ã›`Õ0Œ/Z4ÆˆŒ	voô[#è·\0\0\0‚{™ëbyyù†\riv5}ÆŒÆDhªC5©>=ÊĞ¾!L÷ÿâ’¸	DRu!™t¶ëÜ+ñúF9Áª+`e´h<Œã#RëŞè·ÆÑo\0\0„õò×Å’’’Å‹ğÁ;vœocsÖÓóÆĞŒÌ¬\nY%­©L[llmé^ªã¸p!ÕoÂvë	÷îDRã¥2õUÆ;Áª0Œ5Z4ÆˆÑŒIuoô[£é·\0\0\0j‚ëbLLÌÒ¥K5ÉîŞ½]»v¯¿ş:­©L[œ]\\èŞWÿÍ¦U«VJE‚J3HT*«\nüÂo©y—”ëÓkÙ²¥Ğ/¾h#‡1bLcD:İıÖ˜ú-\0\0€PğÊÏiß¾ıİì@•ò¶¨U	\\![şx¾œP]!Aâõsî^yÿıw…~éôˆŒS§Oq´h<Œ##éŞè·FÖo\0\0ğüœnİº…‡ç\'*å-­…æüFÍZı¬‚¤ëÓëÚõ¡_:ı\n\n\n¢hAk¡\"<Œã#Fß½Ño¯ß\0\04?„çç8;;;8LQ«hŞÏO5Ô´¨´g:7ã%^¡ãT§%3„~éônéÒ¥B7Á `Œß‘ÂÿkE¿5¾~\0\0ĞüŒÎôBÂÃÃ;tø R­ÖL h&ÏÍ$ªí›ºwIµ>«NşzÃ]è—Nï\Z0FŒqûöm¹\\”””~çÎ´´´ÄÄÄÒÒRºW¥R\r8°¢¢‚Ê—.]Z¼x±Ş­#Æ7F¤Ğ·Ño¯ß\0\04?„g]¦¦¦ëÖÚª”qjeœf­Ò¸éEõn£ªêŞxn‰“l}:V¦Ã{ı¢5‡ÆŒ‰\'R–xôèÑ7ß|³FËİ»wé^ÿ]»vİ»wÊæææ3gÎtqqY²d‰L&Ó{ë›Æˆ‘‰ômô[#ë·\0\0\0ÍáYWrrò›oş)äú!ÍTC3“ˆ¥EÍ­5~Ë³»âX	Ö¿°·mÛ6‰	g…~ÑšCıƒÂƒ¥¥åçŸ>wîÜ;wRxĞ© T*\'Mš¤P(|ğàA\'\'§²²²‹/®X±BŸ­ÖŒ‘#I‰B¿hõ‘HßF¿Å¹\0\0à!<×\"::šf“—ö¨”1j›LhÍMeu¡z+³‚¤ê_?HGé‚Ï/B¿\\Í¤1ïÎM›6­”óÙgŸY[[[YYÑ–}ûöÑ]øÏş3uêÔ…~úé§6lØ³gÏW_}µ}ûöÓ§Oë¿ùMcÄ˜Æˆtú6ú­1õ[\0\0€æ‡ğ\\».¼×¶Íºµóå²•2Z­Šfkµ2ú¹›Ü–ç\n:Œ±¾¼2‚Ì[oş):ê˜Ğ/TóidÀpwwÿå—_øwçnß¾íææF…ÊÊJ™L6}útŠëÖ­Û½{wRRÒŒ3rssÍÌÌôÚr=Á1š1\"©¾~k4ı\0\0 ù!<×)99yøğ;vøG‡ÉaGr²}UÊ›Ü#Š­UTĞ”Ÿ/¨ªîUk—Å__¥¸y7Û7<ô°£Ã¤şÇtøÉI†õ’¾Õ0=z´oß¾;<xÊ5qttŒ—ËåÅÅÅ¶¶¶´}ìØ±zn»¾`ŒÇ‘ZßF¿5~\0\0Ğüîì4­k×ÎíÛ½ÛªeËREÏ@·®éh„‡úe@‹zÆ79baaÁ>ÚúùçŸÛØØÌŸ?öìÙ¿şú+U8~üx=ìíí)füşûï£FZ¼x±‰‰‰³³óäÉ“›é9èÆ#Ş1ÒB’}ı–o¿\0\0h~Ï¢ßV‹ù¡5¿TI¥R±BQQÑo¿ıæááÁß¥T*›°\0/\n}[X8·\0\0ˆÂ³88p€&¸YYYB7Dº\Z0&OüôéÓ’’ssó»ZŠ‹‹ƒƒƒgÌ˜AlllöíÛ·mÛ6şQ\'OÜ³g>ÛPôma5æøÏ™3\'33³¢¢âÎ;tsÀ€2™ŒÊeee¬‚¥¥e```XXXxx8m‰‰‰OJJÒoÓ\0\0$áYÊËËÿüç?ÓkèĞ¡B·Eº\Zœà®Zµª_¿~T(--uqqY¾|ùŠ+híêêêåå•“““Îj>~üxÁ‚Ó¦M›2e\nÍz=z¤÷\'\0Pôma5xü»téòÛo¿]¹r…®tHG)—ËMMMÕÜ›ÿ&&&şşşööö§OŸ^²dÉÙ³g?>~üøfy\0\0\0Rğ,æææì?§µiÓÆ××WèæHTcŞ#ôma5xü)³·”£¢¢BCCG\ZEQ988˜U˜5kÖÕ«W9R\\\\ìììÌ¶ÓFı6\0\0@b0g2tIII¯½ö\ZÏo¼ñÆ‡~(“É„n”!`€±BßVıÇ?&&æ³Ï>sss[¶lÙ7LMM]\\\\ÆK[ú÷ïÿäÉª3dÈ©ààà°ÿş….Y²¤æP\0\0€W9“¡ëÜ¹³ö7£¶k×nÅŠB7JŠ0ÀX¡o«ÁãŸŸŸoaa‘œœ\\\\\\lbb\"«6lØ0•JuâÄ	ÊÕü;ÏT¿   ---##ãöíÛøÎ6\0\0€&„9“A‹®ùË\"ıë_i.%tÓ$Œú¶°ê?ş«W¯şïÿûóÏ?_¸p¡gÏ«ªıë_ÿRs_i^RRÂÂóO?ı4wîÜıû÷÷íÛ÷ğáÃT¹™\0\0€4`ÎdĞV®\\IóªÏ?ÿ¼OŸ>Tøàƒhİ¥K—]»v	İ4ÉAÀ\0c…¾-¬ú?eãäääI“&ÅÅÅåææöïßÿBµÿûß¬ÎÓ§OµßyVsÿÛ™åææ¦ïÆ\0\0H\næL-  €æUûÛßØw†Ñú/ùhÚ$tÓ$Œú¶°\ZsüçÎ[\\\\œ™™9pàÀÈj½zõb÷òáyĞ A‡JLLüä“OŠŠŠôÜv\0\0\0iÁœÉĞ…‡‡—””¨«\'XT¾råŠÀm’$0VèÛÂjÌñŸ8qâğáÃİİİiÍoäË”«)<²wŸ<y2yòdKKK[[ÛÊÊJ=5\0\0@‚0g\rLp……ãÆ\n}[X\r•J5uêÔììl*1‚Ör¹|Ò¤Iß|ó\r«@wQxöòò:|øğ•+W\r\ZGÛ<xêÔ)=7\0\0@B0g\rLp……ãÆ\n}[X¯~ü\nÅãÇYY©TRØ~åF\0\0@-0g\rLp……ãÆ\n}[X8ş\0\0\0bk¶h`‚%,0VèÛÂÂñ\0\0\\³E,aáøƒ±Bß?\0\0€Xàš-\Z¯½öšĞM4LpÁX¡oÇ\0\0@,pÍ\rL°„…ãÆ\n}[X8ş\0\0\0bk¶h`‚%,0VèÛÂÂñ\0\0\\³E,aáøƒ±Bß?\0\0€Xàš-\Z˜`	ÇŒú¶°pü\0\0Ä×lÑÀKX8ş`¬Ğ·……ã\0\0 ¸f‹&XÂÂñc…¾-,\0\0\0±À5[40Á?+ômaáø\0\0ˆ®Ù¢	Vó“Ëåîîî%%%êêã\"t»\0šÎ-ÂÂñ\0\0\\³E¬æ·|ùr:ì-[¶ìÜ¹3Z·nİ‚såÊ¡›Ğdpn?\0\0€Xàš-\Z˜`5¿•+W¶¨áÛo¿õõõºi\0Mçaáø\0\0ˆ®Ù¢	Vó+((xıõ×µ“sÿşıß~ûíüü|¡›Ğdpn?\0\0€Xàš-\Z˜`	ÂÎÎ®eË–,9¿õÖ[W¬X!t£\0šÎ-ÂÂñ\0\0\\³E,AÈd²6mÚ°ğlnnşÑGUTTİ(€¦„s‹°pü\0\0Ä×lÑÀK(^^^ìÃÛ:tÀÿvãƒs‹°pü\0\0Ä×lÑÀK@ß}÷ÿáÃ‡İ€¦‡s‹°pü\0\0Ä×lÑÀK@YYYtüi-tC\0šÎ-ÂÂñ\0\0\\³E,aáøƒ±Bß?\0\0€Xàš-\ZÒœ`………999uëÖ­]»v­Zµªù«ËAÏ\0:\ZtL„~YÀ¨´ä¹Åpàø\0\0ˆ®Ù¢!µ	VRR’©©éG}´páÂ7B3³²e•òJ9-\nnáµŞ¬¹]Üõe••tè8Ø;8Ğ1>|8¡_\"0R;·\Z\0\0\0±À5[4$5ÁŠ~ë­·V¯^]V^N‘™Ëšµ\\Îòs-‹\\Á—¼>“5kÖ´mÛöÂ…B¿P`$un1@8ş\0\0\0bk¶hHg‚E™lPP +¹÷›5)²ºÌ­òÊç·h/R¨ïçïGG)::Zè—DO:çÃ„ã\0\0 ¸f‹†D&XÉÉÉï½÷¿ÿÅJ¹L.—UÊ+ha›š\n\n«Æ$U?(èê›o¾‰ÏoÃ+’È¹Å`áø\0\0ˆ®Ù¢!‘	–©©éêÕ«¸ÄHq±\\SPTTgÈªrõ–r¶½ªš$ë¯Y³ÚdØP¡_47‰œ[?\0\0€Xàš-\ZR˜`…‡‡wìØ±¼â	ÅB9-šĞHëòÊê2[äl­à’­_V^Ú©SG|ÿ6¼\n)œ[?\0\0€Xàš-\ZR˜`9;;;::Êåe\\€,£¥×€!ü1\'V_)«ş¬ à6²\nŠríıA};\'\'\'¡_:1)œ[?\0\0€Xàš-\ZR˜`uëÖ-$$¨Rş”ŠOì×ÿZ©Tß–«dêX™:²T±ùôe¿œâğJuX¹:¼\\}ı©Ú¿B½õzüÌY³¸TYÆ?\\»Ìn>+Ë«î2‚ú7n\\ëÚõK¡_:1)œ[?\0\0€Xàš-\ZR˜`µoß>33U®xÊzÊ¥jõ•ºX¡.¬T?U«í–¸¶hù—ïúÏ‘«³eêì\nuF¹:U¡ö¸K•åš`ù„=VSsû‘?e…Jşfõş£~VvÚûï¿/ôK\"&…s‹!Ãñ\0\0\\³EC\n¬V­ZÉ*KåšÜø„b!=å§JµL©¹K¡Ò¬Ïù\\ü{§.N+7(ÔêÇ\nu±\\](W?R«ı#â4áYÁ%OMş|Â¥ĞªıTİÔ.To7‚ú••¥-[¶ö…Q“Â¹Åáø\0\0ˆ®Ù¢!…	÷îñc¹‚òs)­éæ…º L]©¬ªğèÑ£MÛw¯X¿=;÷>İ”«Ô•\\¨¹[õXîU;©YĞTx¶£©/…¾úƒş#,\0\0\0±À5[4¤0ÁâŞ=¦@XÂÖšğ¬Tç=U?(UËÕêJ™ì“Î[´hÕ¢Å[£ÆMÒ~`dTô³ÇV%L~?Z…öö£©/…¾úóÚk¯	İIÃø\0\0\\³EC\n,.\0—p’a	ûØvA™:÷±úa…:òô÷ß¿Õëú?o¿;vüsá9âfUVh²e‰BQ¢½…¢ª@kVAë.#©/…¾zRTTÔºuk¡[!i¿\0\0\0bk¶hHa‚Å}ôºX“Å,–©Ô…åšwó*ÔIŸùÕ»mß{»u›İ‡=*ÔêR™ú©LóÀë¡UÕ<¼jÍ¥Ğg[¸Z¬½£©/…¾z’Ş¡C¡[!i¿\0\0\0bk¶hHa‚ÅàG\nMV|D{Ê”Ÿ‹åê¢JuîcyH|Æ—İ¿ş±ßÀ‡2õƒrõÃruLMñùz8,sj.pr»RT­åÚ¹ıM})ô\rĞ“›7ovïŞ]èVH\ZÆ/\0\0€Xàš-\ZR˜`qø)õìõC\\âíÈø¤Ğ˜¤à¨¤àè”¸´Àğ„ñw‚¢R®E%G\'‡Æ¦ÄßÎÚ±çÀh33ö(9[ËißäÊÕ7«÷o4õ¥Ğ7@OÜİİÍÌÌ„n…¤aü\0\0ˆ®Ù¢!…	÷ÿ–)qÉbaÑÜ¹³[4ÂÈ‘#Y}Eõ\"×ÚvAgÿÆQ_\n}ôdöìÙ[¶lº’†ñ\0\0 ¸f‹†&X\\x.”+\nš¥•årM™[³U[4nêK¡o€|şùç‘‘‘B·BÒ0~\0\0Ä×lÑÂ‹ûØv>—)(æËåUe~‹öM.Uæ£>-Rè ·nİúûßÿ.—Ë…nˆ¤aü\0\0ˆ®Ù¢!…	÷Îs~­‹œ/Èk¯ åúRè &LX»v­Ğ­:Œ_\0\0\0±À5[4¤0ÁâÂs\\GkMAÁ\nùŠª_Î®šäëK¡o@“ËÈÈxçw<x tC¤ã\0\0@,pÍ\r)L°¸ğü„«ÓãC.%òÖZAâõ¥Ğ7 i•””üéO:zô¨Ğ\rIœÛ\0\0Œ®Ù¢!…	VuxfËnÑ¾ù°Æò\0õi©µoDEEYYYy{{7ÿë’ó—_~9yòd¡\ZR8·\0\0\\³EC\n,.<ß¯…|¡æ¢¹K©Ô©&İú:}#11±sçÎüïx]¹rE ×QFFF§NæÎ«R©„nhHáÜ\0\0`pÍ\r)L°¸ğ|b¡Ry_©	‡÷ØB7uÜ½Õu\ZUË–ş~TÎÊŠˆ»zëVP\\Ü•ÈH¿ÂÂd¾şÌ™+*²ÙŞ&N]×ş{ôèZY™£ÓíÛNI¹Á×¿páØÖ­+›ªıõÔçûFyy¹¹¹ùk¯½Æbs—.]şö·¿•””û²‚¸uëuwŞyŸÖ6(R8·\0\0\\³EC\n,.<çrÖ¹JMz¼ÇoQjmgùBcêS$6uüµk..v+W.:p`“ƒıœC‡¶M˜0ÊÏï÷ĞP›ù3è®¯¿şÒÍÍŞÑqî²e½{ÿwÅŠ…K—:¤¤„Ğ²2oŞ¸q>*Ê?66îŠ¹|ó¦mÉÌˆd4ïá?ıÔëÁƒ[ÎÎ¶NN6“\'™\rÚŸÊóæÍxõö×SŸõüùÏn¡¥OŸ>ãÇúUa¥§§ß¼y“¢²¥¥å_|ñ÷¿ÿ}İºuø†0C#…s;\0\0€qÀ5[4¤0ÁbáY©dÉ0·*\"Ö¸©|¶=ç…êËåw©àêjçãsô¢ïñ~øÎÛû·mÛV¦:?ÿ¼dÙ2‡=º._îèà0gâÄQyy·¼¼Ÿ<¹¯¢\"‹*ìÛ·ÁÆfæŞ½héŞısV°²š²k×Z¾=YY7++³i‡ö–Ë‡éçä4ÿ÷ß÷6IûëªOÇméÒ¥-\Zk\ZŒ½Ä­[·îĞ¡C÷îİG½yóæˆˆü³aj!s;\0\0€qÀ5[4¤0Á¢ç¨TR>Ì©Zk²bÕ¢³EY½ndıë×<)ÊNŸ6¶»¸Øúøüæãã>hPZSx¾rå4m§´xùäĞ¡ı._>i6zhnnŒ£ÃJÚ÷îÅ²½ıúëæ‹³9˜íßÓóm§BdäÅ={Öyxì),Lôò:äë{líZgkëiT8wîpRÒµWiıõYßÈÊÊ211iÓ¦Ío¼ÁÔ|€wœÎí\0\0\0Æ×lÑÂKwÜBŠˆüºj£’åF*Tß|‘úffCé.\nÏ«V-Z`7kÄˆAó¬§ÚÚÎ¸zåİé;dHßüµõÔ3göÓgçùşXV–ÎöO!yô¨!–ö–ÿû¿ìí-©lj:ğ×_7Ñş““¯EGû1°¸8™Òò™Óû/\\p¿àói/Ïƒwî„½zûëª¯İ7|}}?üğÃ÷ßŸåç¿üå/ø?Ï\0†L\nçv\0\0\0ã€k¶hHa‚ÕBó±íl\nŠÊª¸˜­¹Yµ¾Ëm¯*WWË~¡úcÇ˜PodÄ…E‹æ®ZµğçŸmÛ¶âÊ•“Q7/9(1áÊ°aı>ˆ;|x‹¥å¤…s(Eÿ÷¿ßP}zø¯¿n¼xñ(Û\'Ufû÷ôü•Â3ß1cL¨àî¾}êÔ±Û·¯¤ÅÅyşâÅÖMÒşºêëô\r™L¶råÊ¿şõ¯]ºt¡»ÂÃÃ…zA AR8·\0\0\\³EC\n,îç,¥2KAk®PµVj•uÖ/RŸÂsEyÚôéãØÍ¤-S§ŒÙ¶mùÕ«\'©ìåy`ÎœIVs-\\]m¦X˜-\\hé´ÄÚfş´-[–VT¤Ó(<ÛÙÎØ»w--ÜÿyÖ¬­¦Ğvş¯ŒÕ„ç¬ßß5jÔ`77[Z¬¬4;l’ö×U¿Ö¾QPPpñâEüN€“Â¹\0\0À8àš-\ZR˜`qá9S³(Ù:«êfõFÅ³²æ.­›\r×—U¤uíú™åì‰}ûş÷şı›C†ôqr²7v˜&<_ñ`õ“’®œôØEe3³!”¥OŸŞëyv?¿ÿ_~Y¹gÏš¸X?Zz÷şw\\œ_l¬ß+wï^Í·‡Âó‘#[<<vY[YüöÛÖß~Û²víW—ù¯ŞşzêK¡o\0+Œ_\0\0\0±À5[4¤0Áâ¾0Œ%Ã¥2ƒ[gj\nU[ª·k\Z]ÿæÍó}úü\'4ÔsôèÁÚõ·n]zõª+ÇÆønØàL…1fCÂÂ<©2-µîğàŞ5Û“~ıí·ÿ¶k×Ï¿ïÜ²Å-%ùJJÊU_ßÃ..ó^½ıõÔ—Bß\00V¿\0\0\0bk¶hHa‚Å…gÊ„wh­RfT•¹›Z…Œ\Z[\Z[¿¼,ÙÒrBlÌ¾ş‹Ñ}ôÿed{ü¾câÓ™3Ç[Låè0kìØ¡ö3mm¦Q}\nÒ^^ûuöÿí·]kî?.Ö×Ãc\'Üğû‰_hcñ£øüşØ±mMÒşºêK¡o\0+Œ_\0\0\0±À5[4¤0Áâ>¶®TŞ©\nŠ¬¬¼£âÖ\\häÊ\n~Kú+ÖWp7_bÿÉÉ—ë©O)]Vq›•åò4ıµŸÕ—Bß\00V¿\0\0\0bk¶hHa‚Å½óL0]Å­5KU\\ÔZkİä«I¼¾ú€±Âø\0\0\\³EC\n,.<§)i´ÖäC¾ Lc+WmQTmD})ô\r\0c…ñ\0\0 ¸f‹†&X\\x¾­R¦*š5_¨Zsİ\n¨¯L•Bß\00V¿\0\0\0bk¶hHa‚EÏQ¥	‡šE©d¹±z­x¶½æF‰×—Bß\00V¿\0\0\0bk¶hHa‚Å}aXŠR™¢R¦PAÅ\n5×Uunk•%]_\n}ÀXaü\0\0ˆ®Ù¢!…	÷Îs2·°d˜¬TTİä|åó7¥\\_\n}ÀXaü\0\0ˆ®Ù¢!…	÷“¸p˜T]Hfí:÷J¼¾ú€±Âø\0\0\\³EC\n,îç¤Æ/Je\"ê«Äã\0\0@,pÍ\r)L°Zµj¥T$¨41Q©¬*ğ¿¥æ]R®OG¬eË–B¿t\0ğ’¤pn\0\00¸f‹†&XíÛ·¿›¨RşÁµ*+$pËÏ—ª+$H¼~Îİ+ï¿ÿ®Ğ/\0¼$)œÛ\0\0Œ®Ù¢!…	V·nİÂÃóáP¥¼¥µPVä7jÖêg$]ŸX×®ŸıÒÀK’Â¹\0\0À8àš-\ZR˜`9;;;8LQ«(Æó1RM‹J;UêÜŒ—xı…S–Ìú¥€—$…s;\0\0€qÀ5[4¤0Á\nïĞáƒJY´Z)%Æs)±jÑ¾©{—TëÓ±êÔé¡7Ü…~é\0à%IáÜ\0\0`pÍ\r‰L°LMM×­µU)ãÔÊ8ÍZ¥)pÑ±z·QUuo<·ÄI¶>+Óá½…~Ñ\0àåIäÜ\0\0`pÍ\r‰L°’““ß|óO!×ib¤&%ÆÒ¢æÖš¿åÙ]q¬‚ë_ØÛ¶m›¤DO:nãÆÛ¾}{yy¹Ğ/ \0¼‰œÛ\0\0Œ\0®Ù¢!	Vtt4=Ù€K{TÊµŠEÍ¢¹©¬.ToaeVTıàëé(]ğùEÍ}ÜÊï¼óÎÓ§OU*Õ½{÷„~\r ±¤sn\0\0;\\³ECR¬.¼×¶Íºµóå²•2Z­Šfkµ2ú¹›Ü–ç\n:Œ±¾¼2‚Ì[oş):ê;\\J¥òÌ™3 ²Ïo¼áèè(è\0%©s;\0\0€¨áš-\ZR›`%\'\'şcÇÿãè09\"ìHN¶¯Jy“KQl­¢‚¦ü|AUu¯Z»,şú*ÅÍ»Ù¾á¡‡&uèğ?¦ÃLN:]ëqûùçŸ[µjµ~ız*_¾|™²´J¥jŞ—\0^€ÔÎí\0\0\0â…k¶hHs‚îì4­k×ÎíÛ½ÛªeËREÏ@·®éh„‡®ÿ eff>~ü˜\nİ»w§Ç;v¬Y^+\0x-$yn\0\0#\\³E,a-]ºTè&¼…B±aÃ†=zTTT(•Êï¿ÿŞÍÍ­¬¬LèvÀspn\0\0\\³E,a‰úø_ºt‰Úß±cGJÑ”¥„n\0Tõ¹\0\0@RpÍ\rL°„%öãíÚ5*üúë¯¯½öš­­­Ğ-\0\r±Ÿ[\0\0\0¤×lÑÀKXFsü×­[÷ç?ÿùÈ‘#T>vìØ¡C‡d2™Ğ.£9·\0\0\0=\\³E,aÓñ/,,¬¬¬T(ÿüç?éy±w¤år¹Ğí\"c:·\0\0\07\\³E,aßñ§´|èĞ¡#F¨Tª²²²?üpÎœ9x\Z ™ß¹\0\0ÀXáš-\Z˜`	Ë¸¿··÷k¯½öÍ7ßP¹¨¨èÚµkB·@*ŒûÜ\0\0`LpÍ\rL°„eôÇ?!!!<<œ\n«W¯¦\';oŞ<¡[ 	Fn\0\00\Z¸f‹&XÂ’ÎñßºukÛ¶mııı©¼SRR\"t£\0Œ–tÎ-\0\0\0b‡k¶h`‚%,IÿòòrZ—––¶nİšxDDİ,..º]\0FHRç\0\0\0QÃ5[40Á–¿J¥:ş¼•óòòşò—¿Œ;V¡Pİ.\0£\"Ás\0\0€Háš-\Z˜`	KâÇÿÌ™3o¼ñ†‰‰	•³²²èf‹—%ôS0,\0\0\0bk¶h`‚%,ÿÜÜÜÔÔT*ØØØ¼trÆaĞA\0\0 ¸f‹&XÂÂñçíß¿üøñHÂ\0Mã\0\0@,pÍ\rL°„…ã¯á I`\0\0ˆ®Ù¢	–°püu <4	Œ#\0\0\0±À5[40Á¿„g€&q\0\0 ¸f‹&XÂÂñ×ğĞ$0\0\0\0Ä×lÑÀKX8ş:ê\nÏ;vìHKKãoúùùmß¾½®ôíÛW©TÎ™3\'&&†ß(—ËÇŒSRRÂo?~|yy9+ÇÆÆ<yÒÛÛÛÃÃãÖ­[ôÀGÑöÃ‡³:OŸ>-..~ü<ÚBÛù}²¬¦¿UXXHû9sæŒ³³sii)_!22òøñãô·N:Eë\'N\\½zµ‘\'///...99™EFFFVVVfffzz:m‰§{µÿ\n_.**òññiäŸ\0£s\0\0€Xàš-\Z˜`	Ç_G]á¹  `À€ùùù®®®...&&&T¶±±¡{)*S\n±2™¬²²’î¢5…É-[¶Ğvº—Êşşş;wîÜ»woNNÎúõëé®=zlÛ¶mÓ¦MÑÑÑ)))K—.\r		Ù¸q#eÚÄÄÄ	&lŞ¼yÜ¸qeee¬\rvvv3gÎ\\ô¼Y³fÙÛÛóíüè£&MšdeeE¤?qôèQ\n®wïŞå+899Q>¯FÉ™şïÅ‹éá´Ï¹sçÒó¥5ıEÚ²k×.5‰×­[·õyK–,éÙ³çš5k\"\"\"¨¥qjğï¿ÿîààÀöI1ÛÜÜ¼é_*0l8·\0\0\0ˆ®Ù¢	–°püuÔó±m\n½\n…\"((ÈÑÑ‘òäĞ¡CO:Ew=~üxöìÙ¶¶¶”.\\øñÇÓšÊw---éŞ{÷î?~Ü××÷Ç,..8p`nnîÈ‘#i=}útö¶™™­)N³\Zğı÷ßÏ˜1ƒc™şîíÛ·)Ÿ³·—i]QQ‘NÛùFÒ>ë‚Ôfz\n¹Õh‡ÚáY[Ÿ>}jİ••EOçşıûÙÙÙ*•*))‰8oß¾}i#{\"7n¤Bjj*ú[Æç\0\0\0±À5[40Á¿ZÃsttô¾}û(\'Sîõööö÷÷_¿~ıüùó©àãã“’’Buâãã÷ìÙÃê›˜˜°ÂŞ½{ùıPxŞ¹s\'…á	&ĞM¶öğğ`÷RN¦µ½½=…RkkëY³fUVV^»v­wïŞTPW‡ç5kÖPÜ¥XN_²d‰Nxşúë¯­Ÿ7wîÜÉ“\'óŸÍ¤L»¥Ú¦M›¼¼¼j=u…çnİº­á|ùå—r¹\\\'<k§÷Õ«WSÂ¿téÒîİ»ë?ì`|pn\0\0\\³E,aáøë¨5<§¦¦ÆÆÆR,,--¥´ìééy‘ãÍÉÊÊbÕöïß?oŞ<™Löá‡9s†\"%Eå\'O°{CBBºtéBa•\"t=Ø{×‹-â“§¹¹ù£GÆ›““ÃÿŸgÚ9ågV…ç­[·†‡‡ÓMª³nİºzç999™¢8%jJş666´¦<˜òmÍÊu…gSSSV ¦ÖÏ£FÒ©¿yóæË—/×Ó*0J8·\0\0\0ˆ®Ù¢	–°püuÔó±möñæcÇM›6mÇÕÕÕÉÉI»NDDÄäÉ“øáÊÛüöÀÀÀ™3göïßüøñQQQ´Ê®*•ŠêlÛ¶ÕYµjÕúõë7nÜØ½{÷¢¢\"J¶jîÍ[V…ç-[¶ğá™ê×Ï§N\Z=z´¥¥åœ9sh=`À\0ş«ÎùÿŠL-gohS\Z?ş|Íçû*á¹´´”¯›¶ğß‹Òs\0\0€Xàš-\Z˜`	Ç_Gƒá™EÓekkk777¾Âõë×\'MšTPP@ñ’Ò¯¹¹ùÃ‡Ù]ì)O˜0¡¬¬líÚµööö¾¾¾”©¦šû&í¬¬¬7nxyy±sSº6l¿ıõWÊŞvvvÓ§Oß·oŸvx~ğàÁ¬Y³>|îÜ9şQ”–ÙËÕZá™š1xğ`¶ñEÃs—.]l8ü1Åïšá¹¤¤døğáqqqtóæÍ›İ»wgO$ç\0\0\0±À5[40Á¿úÃ³»»;…çyóæå¬_¿…ç\'OP(¥ír¹\\]ıŞìıû÷)Cñ{`©øÀÇgÕV¯^Íîòğğpqq¡}R`¦®æ~ê½÷ŞÓş@5Ï:­ÒÏgÏİ±cG=á™-ûî.Jà‡Ú³gåí½{÷^¸p¡æó­+<³/\'İ)„ë„ç~ø?¥t5÷™ó^¼xqÊ”)ÈÏRƒs\0\0€Xàš-\Z˜`	Ç_G]á9##£uëÖ”6)<oÛ¶-•ãçççêêªæÂ3åj¾òĞ¡CY¡´´tîÜ¹PÙMöæo¿ı¶¸¸xË–-kGM™}=µšK›>>>–––EEE»ví¢øÈî¥lnn>çyÈÙ›É´“¾}ûÒ(2„ÿÂ°îİ»óá™5iÃ†\r“\'OV*•111fff‹/f¿>MÉÜÊÊjÁ‚°-ZôÏş“ÖT¦-ô,´æZíÄÎÎßy‡èÈPùüùóıû÷§ãFåÓ§OOŸ>ı%_\'œ[\0\0\0Ä×lÑÀKX8ş:ê\nÏ·nİb¿JuøğaöıØ?îİ»÷‰\'´«ÑÍ>}úèüGhŞÈ‘#¯^½zìØ1J¤ìr¹ÜÅÅ…wzùòå”Æ)WSüfoŞ–••QBfïStÏÍÍÕÙgaaáÙ³gÕÜg¶wìØAŠß¡¡¡|\n®999j.áÓn{õêE\rĞŞƒ¯¯ï7ß|“——Gşøã\nÉ”x³ªQ™¶$$$ğß|¦¢;…sí7ºY§?JÍæd‹9r¤¢¢¢ÖÃF	ç\0\0\0±À5[40Á¿z>¶ÍÈd2öÙl¢T*õÑ\n™ü{ÑM‹­ÛÙ7‡4!œ[\0\0\0Ä×lÑÀKX8ş:\ZÏÍ†’y=šğúnC=÷â;´¡2\0\0\0 A¸f‹&XÂÂñ×QWxŞ¾};K’÷îİ“ÉdK–,aß&­­k×®T\'###77÷Áƒ>¤Bff&_aşüù´‘ÄÛ¶mKHH ½ñ\\]]ùút×œ9sêjç7ß|S3ÙîØ±Cû&ûùùQ³ó¬kEíìŞ½»——×éÓ§k­ğŸÿü‡/³fß½{×ÛÛÛãããÃ~R¤	ç\0\0\0±À5[40Á¿ºÂ³§§§¥¥%ÆŒCÉpöìÙ´¾uëÅE¾û’íüøã{8Ø´i»—â4û\ZmGGG—sçÎ-]º”}uii©šûµ*5÷“W–J§‹-bÕ\\4\r‹¥¿Û§OŸøøø˜˜\n¨ÙÙÙ¬BAAıÅüü|\náô\'è&&&Tæ¿»~r¹\\ç¿%\Z5Š\"ôÊ•+óòòøÌO‘ŞÎÎnñâÅ;w¦çB7)¢÷ïß_¡PäææÒ=|øpPP:h={ö\\¸p!Uã¿D\r$ç\0\0\0±À5[40Á¿z>¶|ûöí‘#GzxxĞzË–-”Ù›«îîîóçÏÿôÓO­¬¬.\\¸pñâEÊ“S¦Lá3çªU«233œœ(~\'$$Œ7ÎÍÍmçÎ”±Y…­[·&%%8q\"%%åşıû‘‘‘´OÊÃ999ì· )–SjİÏùê«¯XÁÚÚšß¡Êb)»R^¥¬N‘ÕÙÙ™}ÕYƒè/Rƒ)´Ó>Ù/9S<7oÅã©S§²„O¨1ìw§X´¾råÊäÉ“ù÷Ï)iSfşã?(Æ«¹7ÛÕÜ·pO›6í…_3œ[\0\0\0Ä×lÑÀKX8ş:j\rÏqqq¤\ZQXXèààŸŸÏ¾Èš¡T¦âPVìØ±cTT»‹Âd¿~ıN<Iétùòå”®ııı)£Rx¦ı”••%&&²ïÁ¦ Jq”\"èæÍ›×¯_OıÛo¿e¿5uèĞ!şgŸ)¸²‚··7m§ígß¾}ÔÈââbÚHû§‡Sv¥‚ö¯UÕ#--mÇ»wï¦uzz:=#5÷9{G:55uíÚµ¿üòı!: =zô FRÀŞ¾}ûÆé©¹ğL÷øñãÿş÷¿ÕÜÛìåååtÜ(ç¿ü«\"„s\0\0€Xàš-\Z˜`	Ç_G­á¹¨¨ˆR¥©©éÑ£G)=~÷İw«V­êÖ­¥D\n|5\n“&L -£GŞ°aƒ——åäAƒQf¾wï%ØáÃ‡SØ¦TgÑ¢Eo¿ıöÏ?ÿLù3//¯  €‚±……U ,MéÔÉÉÉÅÅÅ××—vÅöO!ÙÌÌÌ‘óñÇ³Âˆ#Xx¦d;räÈÒÒRú[9Şœ¬¬¬Æ<}??¿M›6Ñ“]±bEpp0û9èĞÕÜÇÂÃÃÃ“““©Â­[·èiRã)öÇÅÅİ¸qãöíÛj.<\'$$¨¹J 51ºkÙ²eìŸA:pn\0\0\\³E,aáøë¨çcÛ,\r’Ÿ~úI¥R7¿ëáÃ‡³fÍ¢ğLå]»vQÂ<|ø0eÎ¨¨¨èèhö­ÔT ¨©æ~Ì9))‰ıŸd[[Û°°0¶ª¼{÷n*\\¹reöìÙ7oŞ´¶¶...æÿJıï<3¬UÇ›6mÚ««k]¿;]“¿¿¿»»;¨%¡¡¡”í)NO:U»B¡ ÆwêÔiÀ€vvv3gÎäï¥ğ<}úôE‹}öÙgìÈ,^¼xìØ±l\0\rœ[\0\0\0Ä×lÑÀKX8ş:\ZÏyyyãÇWWÇTŠÁ´>{ölDD«àëëKù“2äÄ‰©pîÜ95÷e`_|ñ…a\nÌK—.\r\n\n¢P!%%eğàÁ%%%:t  J)²ZZZRöşòË/)¦Î›7ïäÉ“j.<ÓFÿóL÷ÖÏ§N\Z=zô2ıQ77·F>ıøøxGGGŠ¾ööö©©©ìÿùÏòo\Zß½{—W¯^½>ùäíŸÑ211áËü;ÏfffÅ‡\rvàÀF6\0ŒÎ-\0\0\0bk¶h`‚%,õ‡çœœœîİ»SÂTs‰‘2ªö—HSŠĞ}×¯_oeeEwQaõêÕ—/_¦{iıèÑ£ÊÊJggçÉ“\'/Y²äöíÛqqqì?$³_{bá¦‚ÏªU«nŞ¼©æŞì¥õÎ;÷íÛw‹Ó§OVØµk×Ş½{ù6Px¦ÄN\r£P}”CmĞÏTáüùóõŠñ®®®´[zl·nİØÿâ¦»¨ıÔé)P¥åã?fŒŒ¤†Ql?>l///ÚB•ûöí«ıµä 8·\0\0\0ˆ®Ù¢	–°püuÔ\ZËËË)èRœ2eÊáÃ‡ÙÆ;wîœ;wîáÃ‡,Ùª¹Ÿª*..ÎÎÎ¾ÿ>ÔeË–=xğ€Bcaaajjêš5k¦NJÙ•Ò&{¿šÂ0ûÂ$,,lüøñsçÎ]±b=êÂ…T™b*ı]\nÀ5Û9dÈš322Z·n½gÏ\nÏÛ¶mKåøùùQæëìŞ½Û××·Öç.—Ëû÷ïoaaA1\'\'‡EOáÀÔNj¼öZ9rdª–~ıú±íô¨?şøƒ%í#Fœ9sfèĞ¡?NLLüê«¯ø¨ƒàÜ\0\0 ¸f‹&XÂÂñ×QkxNKKcß˜EÁ˜\"å¹¹9¥åŸ~úéÒ¥KÙ·ˆñ	^·n“HÕ(ª¹O_[YYÙT›1cF@@@9‡î¥Àlff¶~ız¥RÉëììÌŞ‹ÖF®fãoİºÅ~•Š¾‡‡(¸öîİûÄ‰|ŠÖüNÕcãÆ,´S={6=SÏiÕÒµk×š{ îééÉ”šûÒ5‘ã†s\0\0€Xàš-\Z˜`	Ç_G=Û~!O<ÉËË{¹Çòoe×ƒËºV2™ŒuÂ‡ğ&ôğáÃëğ¿üÒ„s\0\0€Xàš-\Z˜`	Ç_G#Ãseeec\"îKã£/€HáÜ\0\0 ¸f‹&XÂÂñ×QWx¾páBjjªšû\06­OŸ>½iÓ&5÷•µ?ÏÌŒ=ºæø-Sı>}ú<}ú´f|óÍ75ß1Ş±cGZZ\ZÓÏÏoûöí\r>#\0AàÜ\0\0 ¸f‹&XÂÂñ×QWxÎËË377?şüØ±c£¢¢|||;Ñ¿ÿGéT®ù³Æ¥¥¥½{÷f?Ú7yòäšâîİ»ÅcccÙ—iÇÇÇÇÄÄ„‡‡³¸N\n\n\nŸŸïêêÊ~&ÚÄÄ„Ê666¯şÄšÎ-\0\0\0bk¶h`‚%,u…g…B¡R©>}JQùÀİİİ)µò_ˆµhÑ\"\n´K—.]¶lÙ_|Ak777ggçÅ‹³\n¡¡¡C‡¥¬ZµjôèÑÖœI“&\r\Z4ˆU İÚÙÙéüŒ3ÕÙ³gßŒœœjIPP££#=–vH‚}I€AÁ¹\0\0@,pÍ\rL°„…ã¯£ÖğœŸŸ?dÈŠ¬Tîİ»÷‚lmm)9/\\¸ğÓO?euòòòŠ‹‹KKKíííÇ;yòäÂÂBÚ¢ıµa;vìˆŠŠêÑ£EèC‡)•Ê½{÷RİK…K—.±ò¨Q£XÁÛÛ›UˆŞ·oådÚ\'mô÷÷_¿~ıüùó©@IıR4€áÀ¹\0\0@,pÍ\rL°„…ã¯£®wËÊÊ¬¬¬ÊËË‡®½}èĞ¡Ú7ıüü&L˜àîî¾mÛ6ĞÃ;ÆŞ(îÕ«­ùÿüL!ÙÌÌÌ‘óñÇ³Âˆ#XxNMM9r$åsJË9Şœ¬¬¬¦;\0M\0ç\0\0\0±À5[40Á¿z¾m»‚óÓO?mĞÒ½{w¾BQQ¥_*PxV©TT377W{&&&%%%TxôèQûöíu¾¯»şw™qãÆÑšø´iÓvp\\]]œœ^ı‰4-œ[\0\0\0Ä×lÑÀ«ùÉårwww–âØñ‰‰			º]¡ğ¼›3lØ°{ZÀî}üøñ˜1cØ;ÀÕÜ{Å]ºtálBBÂìÙ³YyÿşıTÖù¿Ê’,X óçÍ›W3<ÓG½ŒcmmíææÖ´àÕáÜ\0\0 ¸f‹&XÍoùòåtØ[¶lÙ¹sg*´nİš%Æ+W®İ4áÕ•Jeß¾}+**¸OË7ß|C÷&&&öéÓ\'))ÉÌÌlşüùÿú×¿lllÆ{éÒ¥:„……Qº‹ıĞTaaáÈ‘#årùàÁƒïŞ½Ëÿ‰;wÒoqho¬°k×®½{÷òu(<»»»Sx¦P}”³~ız„g0@8·\0\0ˆ®Ù¢	Vó[¹re‹\Z¾ıö[___¡›&¼ºÂóÚµk<Hÿó<dÈZ?yò$33“ß8lØ0¾\\TT¤æ~zÄˆTˆ4hĞõë×©œ’’Ò­[7ÿšíVGFFFëÖ­÷ìÙCáyÛ¶m©???WW×—yª\0M\rŸj\0\0#ä1Ñ@xn~¯¿şºvrîß¿ÿÛo¿ŸŸ/tÓ„Wkx¦H`ii©T*©<räH¶Q¥RQ<xpÍ°·£uPŠˆˆ0`ÀƒøiiitğÓÓÓu*÷İw5÷pëÖ-öIïÃ‡{xx¨¹ÏŠ÷îİûÄ‰‚\0úƒOµ\0\0\0ˆò˜h <ÂÎÎ&¸l^ûÖ[oQ~[±b…Ğ2õüŸçÆ+++{Å=Ü¾}»{e2åyVf‘ÀàS-\0\0\0b„<&\ZÏ‚ ôÕ¦M6µ57ÿÿÛ»ÿ «êúñãßqd‡ÿÂ¢?ğˆ$m&ÍQ·ÂI§ŠQÂTœ‚LB$“ELKEÌ-+©ÑIÀ)	™&”D’¾˜  |A@PPØUQL]~ˆ€ÉçÕ÷»±Ë¾ø±zYöñ˜;wNçûŞ{.îé<÷{N¿®]»¾óÎ;å~QG…‰gh›Õ\0­‘}ßVC¨”ËìÙ³‹İÜ.]ºø\\¨D<Ã‘pT\0´:ö}[\r¡RFİºu‹÷¿3`µqâ„£Z\0 Õ±ïÛj•2Ú´iS¼ÿÅ¥‰)ˆg8Bj€ÖÅ¾o«q4„Ê†\r-Z´lÙ²¸Ÿ?şƒ>8iÒ¤ïÿûÛ·o/-óÓŸş´8ÑqaëÖ­øÃØx´/|áÏáô›ßü¦¸ÆoaîÜ¹wŞygK¯Çá8\ZŞÿ£Šx†#ç¨\0hEìû¶\ZGC¨lÜ¸qòäÉ÷İwßŸşô§sÏ=7:æüë_ÿz÷İwãÑÕ«W_}õÕUUU7nÜÈ‘#ûöí-ıÄO„šššxÖŠ+V­ZÕ£G•+W._¾|ñâÅ›7o.xıõ×Ï;ï¼HîñãÇÇP—_~yïŞ½czÄˆe[í}û,Xğ±}ìñÇ/ãk8Úˆg8rj€VÄ¾o«QöPY²dÉ÷¾÷½k®¹&Rö†n8õÔSã>úvÌ˜11éÒ¥ï½÷Ş¼yó}öÙXxøğáo¾ùfTô~ßâûİï~÷£ıhj½³Î:«˜6lX4yi™ÚÚÚˆíèÕøY—]vY¯^½\"Å~šı!‹fşèG?úàÌ™ÑÏ®ÂZ\"¡Eø=€ÖÂÿg·\ZGÉÖ·¾õ­æë¯¿>âyÂ„	ÒıúõÛ±cÇ¾úköF0_wİuË–-»í¶Ûêêê†òÏş3ª»øŒ:–¹÷Ş{}ôÑb¨‹/¾¸˜øË_şócâé§Ÿ¾ç{¢“ßzë­˜ù·¿ı-Æ‰‰¿şõ¯ëÖ­ûğ×·(çyóÛ³÷İÇ›ÿöó\r7Ü°eË–bú¥—^ºêª«´ä9çœ³{÷îıfÎ˜1£ô§Š…ÆhŸ¸mÛ¶GydÍš5‹/~ê©§â_*&xâ‰ÃxµâÏŠ+bãÙ«W¯³Î:«S§NqÓ1\'æÇ£å~\0@Óìû¶\ZÇwÜ{ï½WîW±¯gÏÿ¬×£Gb\"rzçÎñPTåÏ~ö³‰\'~şóŸ¿å–[\"°#ÿfÍšõÕ¯~õÏşs±G‘Ü·oßkê|òÉÅDŒPÄósÏ=‹]tÑEÛ·oZ~è¡‡©÷—zş‘\rË¹¸}pıüÂ/\\yå•1ñÿê=ùä“_|ñÚµkŸ~úéÚÚÚ7ŞxãÛßşöÕW_=vìØqãÆrÊ)×]w]¼uÃ‡ÿîw¿[\\öÑGıú×¿şË_ş2:tègœËŒ3fàÀ‘â;vìè×¯ß©§:uêÔ7öîİû¡÷wŞy‡ñ‚Å3’ºººªªªÎ;ÿŸL,KÆòå~É\0À±ïÛjtèĞ!\nªÜ¯â?ñüëuïŞ½˜èÓ§OqÂ°ØÕ‹Ä?şùçŸ!õ;hĞ ˜?`À€Ò‰Ášÿä¹•÷Ó§O˜üM½ñãÇG~˜«¹¯©r.õsÌoñï?2ä•W^™5kV$ñ¯ıëêêêsÎ9gÊ”)ÃO=õÔ¾úÛ¬[·®¦¦æå—_w8éõë×ïÚµ«4È¶mÛâ­Ş³gÏUW]µwïŞÍ›7ÇtÃŸ2räÈâ¿¢Ë/¿¼43¢ú0^°x†ƒ¿¼ñİ±cÇ4›ŠåãY1\0ÊÅ¾o«Ñ¥K—\r6”ûUì8p`¤ì„	>ûÙÏ‡mG§½ùæ›ûêãyòäÉ=ôĞ\\÷sæÌ‰lŞ×(G\ZµßwøÃ6ç|ğ’K.¹¡Ş°aÃ®¿şús5TÎÅ-æ·ìùÃæÎû¹Ï}îÚk¯íİ»wÃ‘¸ÅÑ%[¶l9ûì³[ïôÓO/&¾ò•¯<÷ÜsñèÊ•+G]üãºë®[»vmL,^¼8)XX¶lÙ~ğƒ3Î8cèĞ¡wŞygŸ>}b±ªªª¸÷É3|pjkkc[×°ŠcëqÙe—M›>cÑ¢Å›6×ìØùvÜÇtÌéß¿<ÚpáÊÊÊ¡Ü+\0ü‡}ßVãÌ3Ï\\ºtiy_ÃêÕ«#˜o¾ùæ[o½5bï–[nùùÏsyæ™bÁƒ¿ğÂW\\qÅØ±cŸ|òÉ¾}ûîûïxŞ»ç{VÕëÑ£G1q×]wM™2¥ôS\"ï¿ÿşˆçˆêiõn»í¶3›/ç¢ŸwìØñòË/Ç›¶nİºÉ“\'8pÄˆƒ\rŠwàÒK/}å•WöÕ_ô«øcD¸ğÂ‹‰aÃ†½øâ‹Åô¢E‹®¾úêùóçñ‹_Œ‰Q£FEG07|ë>ó™ÏÄ¿Kü¸õë××ÔÔ¼ôÒKqÿüóÏ¿õÖ[‡úšÅ3¤â·²S§N¥îÚµëôìzgw3Û–x4–9é¤“JÏŠbœr¯\n\0 [ÑHÊ2¾€àmÛ¶EÂÕÕÕE}]tÑEqÓ1gûöíñèÂ…‹xŞµkW„ßÔ©S÷ÕÇséRU\r}ãßh<3Ú»C‡Ï¿úÕ¯«7wîÜñãÇĞ+X8˜rş úùÿøÇ]wİµ¯ş¼kË–-[µjÕ3Ï<³råÊâìåáÕW_wìšk®ùæ7¿yòÉ\'G?3æ‚.hx<B¼{ñoİÆñ‹_ÄS~ÿûß§j³gÏ®¬¬¼òÊ+xà;î¸ãî»ïÿÿdñ>¯Y³æP_°x†æEñ¶oß¾øM©¨¨ˆ_ºoïJ7,Å-–œ4éöxVñôG?@ÙÙ÷m5ª««\\Æ!7tèĞ¶Ÿüä\'ãÆûñ÷×^{í¨Q£Šœ÷Õ‡_Dş7ŞøüóÏ÷ìÙ³øÂmétÜûéÖ­[ã™ÅU©î»ï¾?şñûê¿ÇÛ½{÷è½tí\n_Î-ÛÏ555ŸøÄ\'âíw2j9’øï»ä’K\Z.¹`Á‚›nº)Ê9ŠwÖ¬YûówîÜÿ\"1à€¶lÙRú£ÃöíÛ/½ôÒ#FÔÖÖ¾øâ‹K—.]½zõùçŸ‰¾xñâÃxÍ‡ôíÍ†ï-‚Ö%~ÑJŸ9üãÿûß?È­JÃ[<«ôMéÍñÛ\0P^vd[%K–œvÚiå~‡ t›¨ß&Ï¾~ıúæŸ¾wïŞbºtÔ÷êPË¹eûùİwßÕ\\µjU¤ìèÑ£Kóû÷ï_š9sæ Aƒb±â°íqãÆİ|óÍ¥Oõ~øáßşö·ûêÿZ±gÏ+®¸\"â¹tÌöı÷ß¿páÂÒ	Ã¦N:mÚ´³Ï>{ÆŒ÷ÜsÏa¼`ñ›¯Ò÷œ£œŸ]·ş0Ê¹¸ÅsKı\\YYéüa\0PFvd[(ÉO<1âªÜ/äØÔ¸œ·¼úZ3{´\r=ò~^³fÍ—¿üåèä‰\'>ñÄç{îÏßW|o|íÚµßùÎwn¼ñÆâÏ½zõ*xß}÷}éK_zòÉ\'ßyç=zÄõ†\r.½ôÒ}õçÓ~õÕW«ªª\"ªçÌ™S,?|øğ×_=¢ú¥—^ÚºukŸ>}â>¦‹¯U-¢ºººÈİŠŠŠÃûÌy¿ÏŸÛµkW#—{å\0 íÏ­I”Õá]Uˆæ5.çqUU\'xâšµÏ6¹/óãÑX¦¥úùßÿşwéäèä±cÇ¾ù¾!C†ÄÌ×^{­tV¶pÎ9ç”¦#}c±%K–L™2eåÊ•İ»w/í=zô={.ºè¢ÈïÒÑƒ\rª©©™1cFdùí·ß~ÇwÄ}L—÷ëôp,©««+1;~Å°œ‹Û¤I·vìØÑõŸ \\Äsk²eË–h¼âÛÅ´”&Ë¹ØOm²Ÿ‹r.hÁ~>$¥s€5Öä¹ÙJâ?¡ı®ü´¬qãÆÛ‡OúÓ†°æo1NéüÛUUUå^E\0h£Äs+3mÚ´Ø…òÉCKi¦œ›ìç†å\\Ş~N;w.6Óg<Ğ\"å\\Üb´bØ¿Ü«\0m”xn}†zúé§ëç#×ä÷œ÷kã†ıÜ¸œ‹G[öûÏ@ëµ|ùòbËÛæ¯ç|¨·-¶WÅà+V¬(÷Š@[$[Ÿ÷Ş{ï²Ë.«¨¨püö‘8Ğ¹µTÈ?2·™®nxÓÏpÛ»wï­·Şzï½÷nİºµñ£&L(6±•nÁr.nıû÷/Ÿòá¯8\0 [«iÓ¦Eûõë×Ïù·CóW¥j²Ÿ;î¸ƒ)gıÇ¶™3g[€ã?~äÈ‘û];ªW¯^Å£Ó¦Ïhñx1‹ÁKçÛ\0>Lâ¹Û²eËÄ‰#áN;í´ÁƒßÿıK—.İ°aÃo¼Ñäu•)Ìõœ›ìçƒ,gıÇ°ºººÒŸÒbâ„N˜={véÑÒå-ZÜâñcƒÇO)ã;\0\0m–xnõöîİ»dÉ’êêê¾}ûyæ™]ºtéĞ¡CãI)L9§ıœ–³~†cØ)§œÒpƒpüñÇwëÖmÓ¦MñP§NŠ™›6×´x<Ç˜ÅàñSÊı\0@[$i[²œ‹ÛÃÌmügˆ˜ór„Ç›ı\\ú\Z$pl«¨¨(&vì|»Åã9Æ,ı”roJ -Ï´-,ˆ~~tŞ<Ÿ<‡§C‡Å¦ }ûöıúõûÔ§>uá…úä\0yâ™6ç`úÙw&•.FÕ³gÏ¯}ík\'tÒÃ?\\zÔwà&i‹šïggÛdŞ¼yñë_YYù‘|ä¦›nr¶m\0h;Ä3mTôó	\'œà:ÏÀ¡š3gÎİwßıúë¯7~¨t‚ƒşıû·x<»Î3\0”—x¦íj|æí-¯¾ÖL!¨«ãYÊ+V¬(¶±ØõÎî,ç-¶WÅàñSÊ½¢\0Ğ‰gÚ´Æı<®ªª™Ï–÷s,¯œ’Î;‡é3hÁxÑŠa?ùÉO–{ Ï´uÍôs“Ge7ìgåì§êı\rÈI\'´óí]-RÎ1NŒVã—{ ÏĞt?7s>°¢Ÿ•3ĞX]]]Ç‹Ğ4éö‰ç§0FñË½Š\0ĞF‰gø&¿ÿÜÌ¾¬ï9R]]]´nEEÅßÿşø–sŒĞ®]»bÀ¹Ü+\0m—x†ÿÕ¸Ÿæ¦œıìŞ½»tÁç;>»nıa—s<·ô9veeå~WÆ\0>Lâş¿Cígå4©¶¶¶S§N¥~>¼ÏŸãY¥rÑbÌr¯\0´iâşËÁ÷³rš±hÑ¢öíÛéÛ®]»I“n?øó‡Å’±|éhí\'F+÷\n@[\'aÓÏÊHEñ–>]»v>ãæ¯ÿÆ2¥skŸ9+g\08\ZˆghBóı¬œƒT[[[YYÙğâğ±méß¿ÿ´é3-Z¼isÍoÇ}LÇœ˜6\\8ëhm\08JˆghÚúY9‡d÷îİÕÕÕ¥o/¤X>åa\0pôÏp@ûY9‡§®®®ªªªsçÎi6Ç2±¤ë9ÀÑF<Cs\Zö³rÜòåË\'L˜Ğ«W¯³Î:«S§NqÓ1\'æÇ£å~\0@ÓÄ3$Š~~pæLå\0\0m–x†Ü‚¢œã¾Ü/\0\0(ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0	ñ\0\0\0‰ÿ¢MÌ8ó¥n©\0\0\0\0IEND®B`‚',0),('17',1,'leave-dynamic-from.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave-dynamic-from\" name=\"è¯·å‡æµç¨‹-åŠ¨æ€è¡¨å•\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º-åŠ¨æ€è¡¨å•</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\">\n      <extensionElements>\n        <activiti:formProperty id=\"startDate\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"endDate\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\">\n      <extensionElements>\n        <activiti:formProperty id=\"startDate\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" value=\"${startDate}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endDate\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" value=\"${endDAte}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" value=\"${reason}\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"deptLeaderPass\" name=\"å®¡æ‰¹æ„è§\" type=\"enum\" required=\"true\" writable=\"true\">\n          <activiti:value id=\"true\" name=\"åŒæ„\"></activiti:value>\n          <activiti:value id=\"false\" name=\"ä¸åŒæ„\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:formProperty id=\"startDate\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" value=\"${startDate}\" datePattern=\"yyyy-MM-dd\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"endDate\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" value=\"${endDAte}\" datePattern=\"yyyy-MM-dd\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" value=\"${reason}\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reApply\" name=\"é‡æ–°ç”³è¯·\" type=\"enum\" required=\"true\" writable=\"true\">\n          <activiti:value id=\"true\" name=\"é‡æ–°ç”³è¯·\"></activiti:value>\n          <activiti:value id=\"false\" name=\"å–æ¶ˆç”³è¯·\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\">\n      <extensionElements>\n        <activiti:formProperty id=\"startDate\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" value=\"${startDate}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endDate\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" value=\"${endDAte}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" value=\"${reason}\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"hrPass\" name=\"å®¡æ‰¹æ„è§\" type=\"enum\" required=\"true\" writable=\"true\">\n          <activiti:value id=\"true\" name=\"åŒæ„\"></activiti:value>\n          <activiti:value id=\"false\" name=\"ä¸åŒæ„\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:formProperty id=\"startDate\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" value=\"${startDate}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endDate\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" value=\"${endDAte}\" datePattern=\"yyyy-MM-dd\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" value=\"${reason}\" readable=\"true\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reportBackDate\" name=\"é”€å‡æ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\" readable=\"true\" writable=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" name=\"\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" name=\"\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave-dynamic-from\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave-dynamic-from\" id=\"BPMNPlane_leave-dynamic-from\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"10\" y=\"90\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"90\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"218\" y=\"190\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"358\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"495\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"590\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"625\" y=\"283\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"280\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"190\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-24\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-27\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642\" y=\"135\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642\" y=\"283\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514\" y=\"217\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323\" y=\"217\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"299\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"135\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270\" y=\"245\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"280\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625\" y=\"300\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('18',1,'timerExample.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"timerExample\" name=\"å¯åŠ¨æµç¨‹30ç§’åä¼šè®¾ç½®æµç¨‹å˜é‡TIMER_OK\" isExecutable=\"true\">\n    <startEvent id=\"timerstartevent1\" name=\"Timer start\"></startEvent>\n    <serviceTask id=\"setResult\" name=\"è®¾ç½®å˜é‡\" activiti:expression=\"${execution.setVariable(\'TIMER_OK\', execution.getProcessInstanceId())}\"></serviceTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"timerstartevent1\" targetRef=\"timerintermediatecatchevent1\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" sourceRef=\"setResult\" targetRef=\"endevent1\"></sequenceFlow>\n    <intermediateCatchEvent id=\"timerintermediatecatchevent1\" name=\"TimerCatchEvent\">\n      <timerEventDefinition>\n        <timeDuration>PT30S</timeDuration>\n      </timerEventDefinition>\n    </intermediateCatchEvent>\n    <sequenceFlow id=\"flow4\" sourceRef=\"timerintermediatecatchevent1\" targetRef=\"setResult\"></sequenceFlow>\n    <textAnnotation id=\"textannotation1\">\n      <text>æµç¨‹å¯åŠ¨åç­‰å¾…30ç§’å†æ‰§è¡Œ</text>\n    </textAnnotation>\n    <association id=\"association1\" sourceRef=\"textannotation1\" targetRef=\"timerintermediatecatchevent1\"></association>\n    <textAnnotation id=\"textannotation2\">\n      <text>è®¾ç½®å˜é‡TIMER_OKåæµç¨‹ç»“æŸ</text>\n    </textAnnotation>\n    <association id=\"association2\" sourceRef=\"textannotation2\" targetRef=\"setResult\"></association>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_timerExample\">\n    <bpmndi:BPMNPlane bpmnElement=\"timerExample\" id=\"BPMNPlane_timerExample\">\n      <bpmndi:BPMNShape bpmnElement=\"timerstartevent1\" id=\"BPMNShape_timerstartevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"30.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"setResult\" id=\"BPMNShape_setResult\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"190.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"360.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"timerintermediatecatchevent1\" id=\"BPMNShape_timerintermediatecatchevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"110.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"textannotation1\" id=\"BPMNShape_textannotation1\">\n        <omgdc:Bounds height=\"50.0\" width=\"100.0\" x=\"91.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"textannotation2\" id=\"BPMNShape_textannotation2\">\n        <omgdc:Bounds height=\"50.0\" width=\"125.0\" x=\"280.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"65.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"110.0\" y=\"117.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"295.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"117.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"145.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"190.0\" y=\"117.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"association1\" id=\"BPMNEdge_association1\">\n        <omgdi:waypoint x=\"141.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"127.0\" y=\"135.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"association2\" id=\"BPMNEdge_association2\">\n        <omgdi:waypoint x=\"342.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"242.0\" y=\"145.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('19',1,'dispatch.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"dispatch\" name=\"å‘æ–‡ä¼šç­¾\" isExecutable=\"true\">\n    <documentation>ä¼šç­¾</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUser\">\n      <extensionElements>\n        <activiti:formProperty id=\"rate\" name=\"æŠ•ç¥¨æ¯”ä¾‹\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"100\" name=\"100%\"></activiti:value>\n          <activiti:value id=\"70\" name=\"70%\"></activiti:value>\n          <activiti:value id=\"50\" name=\"50%\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"incept\" name=\"å‘é€è‡³\" type=\"string\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"content\" name=\"å‘æ–‡å†…å®¹\" type=\"string\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"countersignUsers\" name=\"ä¼šç­¾å‚ä¸äºº\" type=\"users\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"countersign\" name=\"å‘æ–‡ä¼šç­¾\" activiti:assignee=\"${countersignUser}\">\n      <extensionElements>\n        <activiti:formProperty id=\"rate\" name=\"æŠ•ç¥¨æ¯”ä¾‹\" type=\"enum\" writable=\"false\">\n          <activiti:value id=\"100\" name=\"100%\"></activiti:value>\n          <activiti:value id=\"70\" name=\"70%\"></activiti:value>\n          <activiti:value id=\"50\" name=\"50%\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"incept\" name=\"å‘é€è‡³\" type=\"string\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"content\" name=\"å‘æ–‡å†…å®¹\" type=\"string\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"countersignUsers\" name=\"ä¼šç­¾å‚ä¸äºº\" type=\"users\" writable=\"false\"></activiti:formProperty>\n      </extensionElements>\n      <multiInstanceLoopCharacteristics isSequential=\"false\" activiti:collection=\"${countersignUsers}\" activiti:elementVariable=\"countersignUser\">\n        <completionCondition>${dispatchWorkflowService.canComplete(execution, rate, nrOfInstances, nrOfActiveInstances,\n					nrOfCompletedInstances, loopCounter)}</completionCondition>\n      </multiInstanceLoopCharacteristics>\n    </userTask>\n    <userTask id=\"send\" name=\"ä¸‹å‘æ–‡ä»¶\" activiti:assignee=\"${applyUser}\">\n      <extensionElements>\n        <activiti:formProperty id=\"incept\" name=\"å‘é€è‡³\" type=\"string\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"rate\" name=\"æŠ•ç¥¨æ¯”ä¾‹\" type=\"enum\" writable=\"false\">\n          <activiti:value id=\"100\" name=\"100%\"></activiti:value>\n          <activiti:value id=\"70\" name=\"70%\"></activiti:value>\n          <activiti:value id=\"50\" name=\"50%\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"incept\" name=\"å‘é€è‡³\" type=\"string\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"content\" name=\"å‘æ–‡å†…å®¹\" type=\"string\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"countersignUsers\" name=\"ä¼šç­¾å‚ä¸äºº\" type=\"users\" writable=\"false\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"countersign\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"countersign\" targetRef=\"send\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"send\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_dispatch\">\n    <bpmndi:BPMNPlane bpmnElement=\"dispatch\" id=\"BPMNPlane_dispatch\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"30.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"countersign\" id=\"BPMNShape_countersign\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"110.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"send\" id=\"BPMNShape_send\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"270.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"430.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"65.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"110.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"215.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"375.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"430.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2',1,'dispatch.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0N\0\0<\0\0\0I_l¨\0\0$,IDATxœíİTõèqJ…p«nUB„»º»sİÚ½[+‚»©ÔÆlv7êP01ñl%MB@²ñ*F²»I4›,ÆÄÇnBÄa5jTD^‚*2<| ( À0ÓÓÓ÷ßİ3Í8Âè4Íüæó©S§NŸş÷¡gş]ç|éyuÉ\0T—J?\0\0ÊEê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤^-^¼xâÄ‰ıúõëÕ«×±ÇÛ¥³J{ú¤ÏCúl¤ÏI¥§¥İ˜ß¢¨óƒÔ+‹êêê¡C‡|òÉ×^{íÂ…‹j6nª«ÏÔgÒÒPXJ½yàş=¾®¾>}Òçá[cÇ¦ÏÉ!CÖ®][é)z_ÌoìùˆDêµ¿eË–uïŞı¦›nÚ[[› pEÌ¯3™b\rdÉ4”¶ƒOŸ“iÓ¦õìÙsîÜ¹•¨÷ÈüÆ_€`¤^;KW¸.]º<ùä“…Ëa}á½ü5±y»°nÈÔ¿{OË¥3Œø‘‡Óg)5S¥§«ÍÌoìùˆGêµ§êêê~ô£<òßõ™ºL¦®>³/-ÅV7ó\ZêŠÃJjü“O>ñ| c}¥ÏüÆ_€¤^{\Z:tèM7ı¿Âõ/]üjó\rûš¯ˆMÛÍ{j‹û›†uÊñÓ¦İtîyƒ+=im`~cÏ/@HR¯İTUUõéÓ§vßît‘Ë¤%	LëÚúæíâ’)®Jû:íø½µïôíÛ§£üÌ¦ù=¿\0QI½v3iÒ¤qãÆe2{—Ã½iùôYó×UÇç/Íß¿ÑPØYĞPÛòøÆûÍ‰\'Vzê‹ù=¿\0QI½vÓ¯_¿§Ÿ~²>³§pÙÛówÿxæ«¹\\M6÷B&·¦.·¢.÷Ì;\r3f?öğ–Uõ¹Åµ¹ªÚÜü=¹Göå¾7Õˆ¯,\\#÷–Şr»xsÿv¦é®\0ã.|êÔSÿªÒSwXÌoìùˆJêµ›Ş½{×Ô¼˜iØS\\ºtéòN.·»1·³!÷f}nO.÷Íë®ïrÌÿüÄ™C¶dr›êr›öå6Ôæ^lÈı×Âip&™Ü]|l~#S8NfOq£¾t³ùø1ÆoÜôÒ	\'œPé©;,æ7öüDUáÔ[¾|ù”)S\r\ZtÚi§õêÕ«k×®i¶˜ö§{+ûôÚäØc­«\'“¿\nîN¹tuß“ÍÕeów54æ×¿~è¿ÿWßÿ3ñ†é\r¹ÜÛ\r¹™Ü›™Ü\\î‘%+ó)ĞP¸æ¯¦»×Ô¦ã4İl¹Ñ¼?Àøúúw9æ˜ÊNÜa2¿±ç÷p¬X±bêÔ©ƒîß¿Jÿnİº¥uÚN{Òşto¥Ÿ ÀAT&õvîÜ9~üø?şã?îÛ·ï˜1c|ğÁE‹×lÜ´¯.ÿk÷ÓöœHûÓ½\'tR\Z™ÆWäy¶Iá›·3\r©ŞIëtswCnûŞ\\}¶iÀ;nû×Û¿sË¿nzåµt3Ó˜«/$ÂÓKW4=¶ğÀ¦ƒ¸‘°ÿøaÆ§½r“Öæ7öüÂ®]»&Oü\'ò\'ğ›2Ó˜42¯ôSØïHŸ…kkkgÌ˜Ñ³gÏ‘#G._±ò÷üÁ¥ıËŠ•«.1\"¿í¶ÛÒcğ³m“Â;7éò¶«¸Î§@6÷ÆÜëïä2¹\\}]İŸrJ—.ÇvéÒıó\roùÀg]¶ÿ±M×ËÒqZl4´Ü¿+Ìø’æ7öüT]]İÌ™3{ôèq˜?S”Æ§G¥ÇVúéäÑ³ğ–-[0hĞ p0òZßÀƒN?ıôt„#ù„Û¤p9ßU¸¼¥ëÜ®âø¶ïÍ½òvnë¾Ü3«×ŸpÂ	Ç×í|°Ç…¿+–,}6\rnÈ_)w54ìjy††¦´.hqWñ%Ìoìù=P:Ûôïß¿eÃüñÃ‡¿û{/®Ú¸ióî={Ó:m§=Ã†\rK÷¶œÎuGóù\nè<ÜYxÓ¦M={ö¼å–[Úy-—›nšÖ»wï£ö×t¾H·3µkØY¼ÂímÌ½Y›×ç}¹G—¬ıË¿êß£çG?ø¡ßşÓÿÚ—Ë½S—ÛSøoÿüEKš›xÓºpMİ¿§pMİÙòøaÆw”0¿±ç·•tIg›R·|òÉ÷Ü{_í¾ºCœ Ò½iLß¾}K:šÏW@çq„ÎÂé|—N|¿øÅ/Şsç—_Î“ªñÈ<í6)\\Îw4ä¯|;ÒR¼Â¥\ZØ™É½UŸ{åíÌÓ«6üÕi>óÙÿ»µ.÷zmnkmn{].ÅÀüªB\n4¯ ù¥pù,ª¡ii¹³pü0ã;J\n˜ßØóÛR:_uïŞ½˜kİºu›1cÆ½µ‡yJ#§O¿5=ªøğtµTÖ‘8oÙ²%ıïvÎœ9ï³óŠË½÷İ×³gÏ£ğ+#…ËùÂÅ/]êŞ:ãÓg¬|ş…gV­]´|í‚g×.X¶îé•/=^µfáª—Ÿ|vİSÏV/XV½hÅºU/lüş?ùü•)®3;ZŞ,l7ßl>~˜ñ%Ìoìù-)¯Š¡–N5¿ûİïá4•Uú¿t´£ğ|te?×ÖÖ0àı|İö _É=ıôÓ¶ŸÒ(|?VºÂ½U¸Î¥‹Ü[W]5òp¾‰ûüó?WßĞ¼dZ§åF«ãÇßQRÀüÆß¢ºººÒ÷ç¥Î«^÷Â{>M¥Ç–j/ı”P)e?Ï˜1cĞ AíØyÅeàÀA·İv[¹Ÿ|›RàÍLÃö†üòfq;“ÉoÖÅM{ò…=Æw”0¿±ç·hæÌ™¥¯Û¾·÷óZ½·×µk×âÓ‘+ıÁTyÏÂ»víJÿ¯mëÏÛÎ’™|Tı¾½Âø¶®sé²·-“iÚ.íiy³pÜf|Z:J\n˜ßØó›+œ¯J?E›şÚ.gªéÓo-0¯ü¾= \"Ê{0aÂÈ‘#Û½óŠËå#FŒ?¾¬Ï¿M\nïúl;è’)md> 3ï()`~cÏo2iÒ¤b–}üã?üŸÃ8ô’Sú™ÜÉ“\'WúC:£ò…O:é¤r¼¥WzcïÄO,ëóo“B\n¼‘É¼‘Öù†âÆ¶†¦Òö¶w\rëôã;J\n˜ßØó›”şÆ=÷Ş×gªt´âaÓñ+ı!QÏÂË—/Oÿ-Sç—>}ú=\'·[—·­Í×Â­…k^içÖƒèäã;J\n˜ßØó›Î$Å ;şøãıûóÚº¤£}ä#)ÜßÉ¼2…§L™2fÌ˜²¦Ş¨Ñ£Ó¿R¾¡•L&sóÍ7ßyçÛ¶m;ğŞæ(.¯––7·°¼n|Z0¿y~§NZ¬±áÃ‡·û™jØ°aÅƒ§åÈà@\'WÆ³ğ Aƒ|ğÁ²¦Şœ8p`ù>„Vf~srÜqÇ=ºÕoO(¤ÀkÍ¹ÒÆKş®l¶Õ°Î;şèIóÛ™çwğàÁÅ{ï¾çŞv?S¥cş•J}ø@§UÆ³pÿşı.\\TÖÔ[´hq¿~ıÊ÷!´²k×®c9¦xÊNşğ‡xàÒ½…x5]ä²Ù×²ùKİ«Å%İl½Q¸·yLgô¤€ùíÌó[úuz‹Wµû™*³xğô¯Tğ3\0tNe<÷îİ{CÍÆ²¦^ÍÆM\'œpBù>„rÊ)]Z8î¸ã>ñ‰OlÜ¸1×”¯.oiıJ6-|µ´\'Ûbqgi£“?zR g~;ñü–şBÆÆM›ÛıL•Y<xúW*ı9\0:2…»víº¯®¾¬©—ŸNÖ¥o²©¸ü.[¼Î½ÒtÁ;àfvÿş-Æ§›]\nßÀTé©;,âóy´ïÒAæ·ôWkwïÙÛîgªtÌÒ¿R¾S.ÀAyW¯m>ô¡OÙİ»w¿ä’Kúôé3tèĞÒ»>ÙlºÚmiZç¯|MK«=Ùæµñiér4½ëc~;íüzWˆÊ÷êµAé×1œyæ™Ÿıìgûöí;oŞ¼Ò½ùhØÜPXÒFºà•ÖM;³Å«`Úh¾Ù–ñK–Ì]WıTÚ¸ğÂ!¯¿¶âî»¿Ğñ#G^:wîÏqü}µ/â§mß¾úÀçsáÏ[·nşÛo¿ğÖ›kxböõ“GïÜYıÆÖU»w¿øşŸÿïô¤@eç÷Ï¿\0ÖÍO]4äµæÀã¯yéCıì ÇêÉ_]}õe{÷®O#×¬yâkW?Ï¿£Ì¯ïÕ¢*ïOàŞ?gNYS/ÿœsÜOà>úè£]\n¹üƒüà\r7Üp°ŸĞÜ”.{Ù¦‹ß¦üÍ¦õæÂş¦íæa›Ú4şÂ/»~ıÂíÛŸûüç¦›ßşö·&MºæÀñ™úW^ùO;v<ĞãgêkRN›vİ¸q_kuü_Íş÷.œ*pÊ”oşøÇÓ/¹äü!CÎúÊ—¿˜ş¡—^|úı?ÿß7şèIJÍï›o®¾ğÂó¾vÅ¥£F¸âŠK?ùÉcÆŒ¼æšËÓL}ñƒÓ½ÅñM/€mï~püúúš«®üÒş@‹çsÙemØ°ø×ÜyãÒ¡Ò?Ñ¯Ï>¿~ˆªŒgá©S§^3jTYSoÔèÑ“ìß\Zš;wîí·ß¾}ûöï*¼ë³1›İØÖ…¦u¶Åv«õaşùÇSx­iÁwL»ñÆñicıú?ùÉôªªß~{ík¯=û¹Ïsùå}ãë_=úòÑ£.OëSOı‹—_ü…/zùå…ÅãìÜ±æ‚şêWÿ¶çÍıÙˆïxkuñøK—>töÙ—©ßRS³ø;ßûØc÷½óvõàÁÿØĞPóşŸÿ!Æ=)«Üü–Æ×Ô,J¥~àøç×¼û°~AÚ.¾\0víZûÚ«…Àe}ã…@á5PzlH/€ìÆ5«ûÔ§ş:mŒ\Zuù¥ÃÎO³ß¿ÿ_~ıë_Jæ7×â÷ê\r6¬İÏT~¯PAşZF»)¤@M~É×›n6ïlØ¿¿«ÅÍ?<~ÁüÙ×]÷õ[n™øçşñï~÷ºéÓ\'İrË¤iÓ&\\ı¨W_y¦8~ÅŠ‡ÿó¾Çïxë¹‹/R:T}İú»îšyæ™gÜxãµU‹½ô™ßTUızæÌ©ş}ÚóÊ+Ïdê_Ş¾}e\ZüÚ«KÇ™Rà¶Û¦Ôí{iû¶•íòü1ş¨JC(ëü–Æ×lXxÕUÃûÈ=ÛJŸùÂ²`AËÀÄÂ`bÓàÕâ`ãÊÒ ¡fÇ–/€épî¹Ÿ4èöì®¾è¢óòÿPÍ¢1ß‘ÿw3Ìo²bÅŠbùk@0øoà._±2¿¬Ï¿M\nß¶_¼ÎmÈf7Ö5ù¦=Íû[n´qüæÍUıûÿåİwÿKZîºkÆüİ7ß\\Y\Z_·ïÅ³Ïştmíéæ~4í7¿™U:şªUıÖÈ·ß~~ÆŒëÓ£fÍšÖi;“Y?{öë_šŸŸâàöÛoºğÂs«×>n®Zùğ•W^š²oîÜŸîxkU»<ÿƒï()pæ7-55¯ºrø¦M‹Î?ÿì4İ­ÆoŞ¼¸Å`fÓ ùøuu/µxÜü›g•şÈ#?Ÿ5ëÖK.²|ù¼G{OÚ_³áé1cF´ûóï¸ó›+ÿßÀıÓ?ıÓJˆ@gTŞ³ğ„	.1¢L©—<vÜ¸²>ÿ6)¤@ºÂ½œÖÙ\rMÛ…›-66°§\rã‡ÿÜ!g.]ú›g—şfÎœÿä\'û·\Zÿô‚_}uÄE;w>wî¹ÿØYßòøßÿş\r7Ş8núô‰©ğ¾÷½)i}ë­“Óüà†4`ù²‡¾ü¥-º?İœ0áÊ©SF¥õwÜ¸ş¥§¦NıâO´Ëó?èø’G`~¶àª«†§ñ¯¾ºä¬³ÎØXótË{‡_ÚôXúÌƒsîÿQéP:şÓfõ«ïÜ±*ÿÈ?ê]ÇO©÷«Ùw¤ÂK“ûo|éoşæÔ	ã¯üÖ·¾zç·šßdòäÉÅ&ëÛ·ï½µíršJÇIG+vò‘ın€¢ò…wíÚÕ£Gr¼±—™¼sçÎ²>ÿ6)|/ÕÕËM—½âvöåÆÂºp	,l7”ö¬oÓø[oøƒ|\']•øÃÿW»·úŒ3şzÉ’ÿÿqË_üÅÿ^¼øşVÇ_µrŞÊ•óÖ®}tğà˜5kzª·êêÇV?÷ğs«.=Ÿ•+æ®^ıÈæM‹¦MŸn>üğ]©óÚëùÿ¾ñ%Ê=¿Åñ55®ºrxqüºuÿú×?.¿õÖI?üÁ\rép{zÔ^\0Us<ş¬â`Ñıÿ’‹Ï{ë­[__šZğù5¿½úê/íÜ¹jÛÏnÛ¶ÌüæšÏWÅ,›>ıÖv9S¥ã˜œ_éèŒÊ~1cÆ9çl÷ÔKÇLçĞr?ù6)¼ë“.oëëüÒtñk±nq³4ìßW[}íµWŒı•â°‰¯úÛ¿pï½ÿràø7¶.½òÊa×O¾zÈ3_|áñ_x?orÚ˜7ïÎiÓ®mõ|ŞygõùçŸ•mxéâ‹Ïİ½{Í°K†¼öjÕûş‡ßQR |óÛr|MÍü«®º´Õø¦À¨¯oN¼.ÿ¸/½\08~ËÀëouüK.9¯4~Ã†ùß}Y»?ÿ;¿E3gÎ,–Y·nİ~÷»\'Şçi*¡k×®Å¦#Wúƒ:©²Ÿ…kkkOëßÚ´›Û±óÒÑÒ1ß~gw¹Ÿ|›Rà¥ÔIi¿Ú•6²/—âvÓ†¦‡3~ëÖ%?ûÙmi{ûöggÎœ|öÙgL»iÜ™g~jÖ¬ïnxù©âà×_¯úço6lÈ«¯,N7ÓşK/zÙe_˜7wV]]u:ÈŞ=k¦L¹fäÈ‹—.}`şüÿ|ä‘»Î>ûÓ7Ü0¦ô|vìX¾wïšÇ»{÷îÕ»v®|`Î~şóuûªß|sÙû|ş‡ßQR |óÛrüú—¸âŠ‹[/¾\0Òvz|oæõépSóàåõO‡½şZÕ·/€W^Y”lhzü÷¼;Ó x´/|a`é°Õk½úêj÷çßqç·¨®®®ôözôèQ½î…÷|šJ-½G8`À€V¿Ûàˆ9gá-[¶¤SŞ½÷µÏw:ÿröì^½zm¨Ùxy›Rà…Æì‹Ù†üº´Ñ´.l´Ğ–ñ÷Ü=ãSŸ:ıîŸßV_·6İÜñÖ²û·©gõ©5O-Zø‹?³`ş¶:àªUñÅG{WÚŞ¾í™¯|ùó7İø­şğŸv×ô_şòûsúÉÈ‘®~nnqü÷fN3æ²ñãGNÅu×}mÂ„+Æ_;2¿çÚ‘íòüßø’åßâøU+\ZvÉy÷İ·ıÁ@«ã·|¤%\r.\rXúÌœ¯¸°İŸÇß’t¾*ıåŒtâzoïí¥G•:/-³ÒĞy¡³ğ¦Mùß¤š*í}v^êÅtœ>2O»MÒkÌ_êòK6[¼\n6¯öï?pg\'ßQR Àüî«]m~ÇâÅ‹»wï^µ®]»NŸ~ëáÿ”F\Z™Æ—¾n›“VéèÔÜY8ïzõêõ~¾’››ş£¼şå\rGì9·IáÛö×e³ë\Z³ëÒFcqãÀuÓ˜Zlwêñ%Ìoìùm%¯Jïí%\'Ÿ|ò=÷Şwèß·—îMcJ?o[|?OçwDÏÂ[¶l9­ÿsÎØÖŸÉMãÓ£ÒcÂ¯Û–Şõ©.,Åë\\u¶¡éfi£4 ûî›y|GIó{~”ÎWèÒÂG>ò‘aÃ†İ}Ï½‹WmÜ´y÷½i¶Ó´¿ô{’KßŸçë¶ÀÑàHŸ…kkó_İ8şøã/1âp‚/I#Óøô¨£íç0Z)|/×ÚÂ¥nmóFuq£ÕşV÷vòñ%Ìoìù=¨ººº™3g–¾ëî0¥ñéQ~8JTæ,¼k×®	&œxâ‰}úô¹fÔ¨ûçÌY¸pÑ†šûêêÓ:m§=£FN÷¦1ã®½¶Cü>ªÂ»>kÉfŸ7¾±ã¤€ù=¿‡Î?“\'O.ı-CHcÒÈq¾:\nŸ…—/_>uêÔügO;­W¯^Çw\\Z§í´gÒäÉGÏß·=Ç{l¶aMcş‚÷|6Û´QZJ{¼«3OŸ±c9¦ÒSwXÌoìù=ÅóÕàÁƒû÷ïß»wïnİº¥uÚN{Òşu¾:ÿî£G:éoŞôxcvuqÉ5®)l¬),«ß½½¦yÀšN>~ËæßpBJOİa1¿±ç *©×núõëWµøŞÒ¥®1û\\‹%]ùJ;óëÜşz|úŒzêŸUzê‹ù=¿\0QI½v3iÒ¤±c¿œkLW¸U¥‹b.--¯‘­n®êäã¯÷•‰×¨ôÔó{~¢’zí¦ªªêc;±¾nY.©K×¼U…k^ÓÒòfë»:ëøô¹êÛ÷¤E^é©;,æ7öüD%õÚÓĞ¡C¿{óèÆìÊ\\ve~İ˜ß(\\›÷v66İ»ª°¬ì´ãÓçjè¿¯ô¤µù=¿\0!I½öT]]ıt{zşù‹bşš·\"-¹Â:¿QÚ³ÿ®•Åpücş¨gÏ?¿æşJOZ˜ß¶ÎïÚççTzÒ\0:;©×Î–-[Ö¥K—G{Gcvy®±xÙË/ù›Ùææ=ÅíâF§\Z¿`ş¬ôYšûĞ¿UzºÚÌüÆ_€x¤^û›;wîG{~ø»7_“©[Ò˜]–k\\V\\ç²ËŞu³°ç]­DŸ©_’>3İ?ĞmÙ³÷Tz¢Ş#ó{~‚‘zeQ]]=dÈgú|ìÆı§%‹ïÚ²i^cviáZølqİ˜6òÛïŞhlº7×r»ãolXºyÓ¼ªE?7vøÇ>öGC‡|¦zíìJOÑûb~cÏ/@$R¯Œªªª&M¼ìÔSOéİ«Ç±ÇÓ¦?£IúØÓg ß©§¤ÏFÕâŸVzZÚù-Š:¿\01H=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Â’z\0\0aI=\0€°¤\0@XR\0 ,©\0–Ô\0Kê\0„%õ\0\0Âúÿ¥eH³f°*\0\0\0\0IEND®B`‚',0),('20',1,'dispath-apply.form','1','<table border=\"1\">\n	<tr>\n		<td width=\"100\">æŠ•ç¥¨æ¯”ä¾‹ï¼š</td>\n		<td>\n			<select id=\"rate\" name=\"fp_rate\">\n				<option value=\"100\">100%</option>\n				<option value=\"70\">70%</option>\n				<option value=\"50\">50%</option>\n			</select>\n		</td>\n	</tr>\n	<tr>\n		<td>å‘é€è‡³ï¼š</td>\n		<td><input type=\"text\" id=\"incept\" name=\"fp_incept\" class=\"required\" /></td>\n	</tr>\n	<tr>\n		<td>å‘æ–‡å†…å®¹ï¼š</td>\n		<td><textarea id=\"content\" name=\"fp_content\"></textarea></td>\n	</tr>\n	<tr>\n		<td>ä¼šç­¾å‚ä¸äººï¼š</td>\n		<td>\n			<input type=\"text\" id=\"countersignUsers\" name=\"fp_countersignUsers\" value=\"admin,leaderuser,hruser\" size=\"50\" class=\"required workflow-users\" />\n			<!-- <select id=\"users\" name=\"fp_users\">\n				<option value=\"leader1\">leader1</option>\n				<option value=\"leader2\">leader2</option>\n				<option value=\"leader3\">leader3</option>\n				<option value=\"leader4\">leader4</option>\n			</select> -->\n		</td>\n	</tr>\n</table>',0),('21',1,'dispatch-apply.form','1','<table border=\"1\">\n	<tr>\n		<td width=\"100\">æŠ•ç¥¨æ¯”ä¾‹ï¼š</td>\n		<td>\n			<select id=\"rate\" name=\"fp_rate\">\n				<option value=\"100\">100%</option>\n				<option value=\"70\">70%</option>\n				<option value=\"50\">50%</option>\n			</select>\n		</td>\n	</tr>\n	<tr>\n		<td>å‘é€è‡³ï¼š</td>\n		<td><input type=\"text\" id=\"incept\" name=\"fp_incept\" class=\"required\" /></td>\n	</tr>\n	<tr>\n		<td>å‘æ–‡å†…å®¹ï¼š</td>\n		<td><textarea id=\"content\" name=\"fp_content\"></textarea></td>\n	</tr>\n	<tr>\n		<td>ä¼šç­¾å‚ä¸äººï¼š</td>\n		<td>\n			<input type=\"text\" id=\"countersignUsers\" name=\"fpu_countersignUsers\" value=\"admin,leaderuser,hruser\" size=\"50\" class=\"required workflow-users\" />\n		</td>\n	</tr>\n</table>',0),('3',1,'leave.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"è¯·å‡æµç¨‹\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${afterModifyApplyContentProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${reportBackEndProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" name=\"\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" name=\"\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"10\" y=\"90\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"90\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"218\" y=\"190\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"358\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"495\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"590\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"625\" y=\"283\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"280\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"190\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-24\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-22\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642\" y=\"135\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642\" y=\"283\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514\" y=\"217\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323\" y=\"217\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"299\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"135\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270\" y=\"245\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"280\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625\" y=\"300\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('4',1,'leave-formkey.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave-formkey\" name=\"è¯·å‡æµç¨‹-å¤–éƒ¨è¡¨å•\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:formKey=\"start.form\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\" activiti:formKey=\"dept-leader-audit.form\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\" activiti:formKey=\"modify-apply.form\"></userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\" activiti:formKey=\"hr-audit.form\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\" activiti:formKey=\"report-back.form\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" name=\"\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" name=\"\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave-formkey\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave-formkey\" id=\"BPMNPlane_leave-formkey\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"10\" y=\"90\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"90\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"218\" y=\"190\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"358\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"495\" y=\"87\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55\" width=\"105\" x=\"590\" y=\"80\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35\" width=\"35\" x=\"625\" y=\"283\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40\" width=\"40\" x=\"250\" y=\"280\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"190\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-24\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495\" y=\"107\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535\" y=\"107\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590\" y=\"107\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"-22\" y=\"-17\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642\" y=\"135\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642\" y=\"283\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515\" y=\"127\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514\" y=\"217\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323\" y=\"217\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"299\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142\" y=\"135\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270\" y=\"245\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270\" y=\"280\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290\" y=\"300\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625\" y=\"300\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11\" width=\"100\" x=\"10\" y=\"0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5',1,'leave-formkey.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0×\0\0P\0\0\0ÊYßj\0\0TIDATxœìİ	xUºÿq—áŸ™+Ì…QÇ{GæŞqñªwQPFÙ‘E6Aö}MØ’°Ë\"\nn#›Ã&ˆÀ„-	IXÂ’ !b€,İş¿]•4M¡iNWŸïç©§ÓÕ\'•:UoşÑé„\nN\0\0\0*¨>\0\0\0 )R\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …Ü@ttôèÑ£k×®}ß}÷İqÇt%c—3 çAÎ†œÕ—~„{ÄÄ=b-Ô­Iyİ’B®+))©E‹?üğğáÃwîŒ:–—oË·Éb7wãšKn·vÿ¼ü|9r†É9iŞ¼ybb¢êKÅ¸G¸G¬ˆºõ«º%…\\Ûîİ»+Uª4yòäË99RŸÆs­m6³X¯±Øìîv€÷—s2eÊ”jÕª­[·Nõ…‚2Ü#Ü#VDİú[İ’B®A.@…\n\"##«•o¤d×%+jk»-ÿê-‹ı7lÜ gIniÕ—\nppXuë‡uK\n).))é÷¿ÿıÆëómy6[^¾-W³Qì¡«ƒ=ÏìænhÕ?2rË¯ıkŞvÖ\r÷÷ˆQ·şY·¤âZ´h1yò$ãòÈµÉq5ì¹E¬°]´%ÇÜ^ØMËşS¦LnözSÕ\r·÷÷ˆQ·şY·¤«ÄÄÄ<ôĞC9¹å\ZØdq]!YçäµÍÅf®íîF®¶ı/çd×¬ù¿ îî+¢nı¶nI!W				¶Ù.Wë²,õşŞØËßw2û»®_Ñ—_iØf{çş PĞÑ£G«¾t¸M¸G¸G¬ˆºõÛº%…\\¥víÚ;vDæÛ.WåÒ‹/7üÑé<îp¶9æ9÷æ9c³í3Vş°!ãBL¾3:Ç“ãÜvÉ¹1×ùá¶„î=z\Z—ğ²ûË=ÛæÃ+m[áSĞçÎ­O>ù„êKç[‘‘‘ÿñÿ±eËÕ¢÷Hàİ#:”7uë·uK\n¹JõêÕ?b³_2IÁÙNçÅç»óç|ç%§sÈ¨°\nólÃæ6gz3=×y,ÇyÄî\\¶s¯t¶¹®âEók]\r›±Û%³‘ï~X´ÿÀèŸ–rï½÷ª¾t>$³óï~÷»+WÊL½yófÕ‡£÷H€İ#š”7uë·u[)dÏ=cÆŒiÒ¤I:uî»ï¾»îºKÖÒnÜ¸±l—goı[Ü6wÜqG^~¶Íu‘.Ê5â»äpæ9\\OÙ\\ëo¾[ÍGGOœnw:±;/Øœ?ÛœçÎ»ö¹*Õn\\f×Å¾h\\òÂı>ôlm€şùùÙ+VT{á|Çœ£#\"~È·Ùøa“fê”””;vìÚµ+...Ş•œœ\\¬§<Vîà=î‘@ºG|TŞ~XÏÔ­ßÖíÍ§.Œ1âÁ¬Y³æĞ¡C×®]}<-=7Ïõ‡Ø¤½zÍ\ZÙ.Ïşñ”Ò¿ÛGŒÌû‹Í.Åš-kyxÑî<{Ù™ï(ìpşüù>5á½ÓO’‡¶g¾QÁ;âö~­ñ……;)Ùpu¸²ÿ€é/cWwÑ|Ès6‘áÃ‡Ïš5kõÕæÌ™Ó¯_?÷‘Œ9²K—.ï½÷4&MšÔ¨Q£àààÛÿ™Gî‘€¹G|WŞ~XÏÔ­ßÖíÍ|ƒœœœ3fT«V­gÏ{öî»Î_‡½²ìİ—Ğ­{wéÿÁÈ×–ûÊ‘‘yåìg™kW¥:œ?]rÎvÚœÎü¼¼?×ªU¡Â*Tzó­N_¿ûÊ×^N÷~<\ZvÏíYÓßgØ[WrvÏÔ²½|ˆ.ñÖ­[e¦^¿~ıÆe-ímÛ¶\r6LÍÌÌ”2îß¿¿uëÖò}§L™\"÷öìÙsîÜ¹r<’â	Œ{Ä§åí‡õLİúmİ–ùdddÔ­[·I“&’-n˜?Še‘Æ›<ıôÓ²_Œ¤\\Õ–eœ}¹Yæ»v’—Oşâ<“ëŒ=zï½÷ŞqçİÿïªmÛ]U©»ââ¥³İu!³ìö,ÏØí…\rY›<\nşş6ÃŞºëÍÑæ\"ÛË÷Ó|2kÇÄÄDEEÉ,¼oß>YËÃØØXù×¡Óx{É’%cÆŒ‘b.\"í±cÇ.^¼8--­¼ÃÜ#pøº¼ı°©[¿­Û²}ƒôôôjÕª½÷Ş{eÊËäÉSªW¯î·¿:o¼óvÁu1ìÌp¹Àùs+/ÿ”ëŒØ•øØOU­öû{*W™µpY®Ó™ç¼”çúÂmQ»\n¿Öõå…kã’_Ùb\\òû˜ş~5ÃŞºÒçh_™µSSS—.]:jÔ¨°°0™”—/_~üøqsÖ6µk×n£ù÷eûöíËå»—	÷ˆÕï‘ÛPŞ~XÏÔ­ßÖm¾D9 )¦› æ²båJÙ\Zßê¦ÕvŞîº0çe1/€ë›ó\\¾¤fÛ„cOÔ©ûÒ+¯ÉsÎqÉqÍsJ­n‹1*Õn^`×b\\]cWöÂµÍs£±ÿ€éï?3ì­óf.÷ bÎÚƒÎÌÌt\Zº\Z:thÉYû]“&MêØ±ã­ë²â±ô=r{ÊÛë™ºõÛºõödddT¯^}õêÕ·AÌeÉÒ¥ÕªUóÃÍÕvŞ¸6r%Î½Pï…}‡Ç&$FíIÜŸ¸}wò})›bîL8\ZŸ¼5>iûî¤¨½É	‡Ó>ıù›­Z™_e3×¶óvÑÃ¢ıL?™ao÷stùsÖ\n\n*eÖ0`À„	Ü³öøñãe–¿Åï{¸G¬{Ü¶òöÃz¦nı¶n½ú999uëÖ½•Ä”\\&OòôÓOûÛ‡UŸÿÉ8g\\¹çúöíéÍ×{ã–f{ÑbóØg£Øş£¿?Ì°·®¬st9sÖ7oŞ¸qãÌyşüù³vzzúªU«BCCsss{öìi¾•(Ï&%%•ÃÈË‚{Ä¢÷Èí,o?¬gêÖoëÖ«o0cÆŒ&Mš”c1—Æ›|ğÁ¾a™•ú³Í~ÖîZ~6Û6›«m¬Í…[\\\rcı•Ï°·®ä}úÌO¥T¯ç³·DdşMII)¶Qfä#F˜í:$\'\'›oYŸ={6<<|îÜ¹¯¾úêÉ“\'oúûŞî+Ş#·¹¼ı°©[¿­Ûƒ¬¬¬ªU«–õ7b¼YdŸ²g¿ú;\"Æ»v™Æe«’i³¶İ[<\Z—0“ş²X=…”œ£CBCï¿ÿşC‰I×,]Ù.ÏJŸò\n\"C†IHHğÜ\"óu½zõÌ¿Ü‘‘ñÉ\'ŸHCR{Ÿ>}äšÃ†\rëÜ¹óåË—O:e³Ùnù”÷ˆåî‘Û_Ş~XÏÔ­ßÖí¿”HÏ=Ë=‚˜K·îİİéØy9óš‹Íİ°]»ƒÎı-B®9G›oÆ^s¦6çh³C9«à±Ö=By›¨[¿­Ûƒ?şñ¾x#ÄıvÈ<àëAzÏ¨ÔŸl¶ŸdíjØÍF¦½°áng^ÕMûşÖM!¥ÌÑ×œ©=çèÀ›©½Á=b¡{„òv£nı¶noğ\röìÙS³fMEsyè¡‡üçÿš1*õŒqöÏ]ª3Æ%qo<sÍš÷·h\n¹æË‹ÍÂ3uÉ9Ú|¶|?#âç¸G¬rPŞ¨[¿­Û|ƒ1cÆ:Ô§)dĞàÁò]|=N7›Í6uêÔ˜¿BVLQ¥šËicñ|x¦Äršş²øU\n)ı»]ïW®7‡¯ßPÊî¹Xw¦6qøó=By_uëÏu[Š|ƒ&Mš¬]»Ö§)dõš57öõ8İV\Z3MÜyçƒÎËËó|Ö¨ÔSE×Àİ(¹¸r8ŠuÓ·¿_¥Ò/±©ôßZ¼æL]±bEoæh?Ÿ©½Á=âÏ÷å}=Ô­?×m)nğ\rzê©;£|šB¢¢¢k×®íëqºeee¹ï7iT©ReÍš5îgJıQ®ÃqÊáº?š‹<,Ş0-ê£{¿J!¥_b§w8áš3µ—s´?ÏÔŞàñç{„ò¾êÖŸë¶7øÕ«W?v<Í§)äxZú½÷Şëëqzªåú¿¯àüì³Ïšÿ…’Q©\'³/ë“×¥úÑ½Åá±İÜènhŞß¯Rˆ³ÔKìıßn*e¦¾áí·3µ—¸Güù¡¼¯‡ºõçº½|ƒ»îº+7/ß§)Dö/µ2vìØR‚ùíäº\0ó2œ,¼%:®lÏ ¿<”óæ?W°teúó‘áë7”|§Z¶Èv/÷ğÃ›d¦¶ÊÉñ’%jÒßúW¸-÷å]\nKÔ‰¿õ¯ <…ä{!•+W6‹²R¥JíÛ·è¡‡Z´háÎË‡\\ŒŒÂµëÂ.Å¶8ŠÖô—å6Tj™”r‰###e¦ş>\"â†•ÿXô÷ˆ?ß#”÷õP·ş\\·×£İçBöìÙc–iÃ†\r_yå•š5k†‡‡»ŸuUªı„İX¤!×Ã½.Üè0/’4Šzô¿p!iğ îæÆÌÌıII[NLÜš}XúŸ>½¯uë¦çÏ²ÙÒ32â3Jøùçƒ²>{ö€{\'²½}û7¤±sç77.İ¼yÅæMË¥¿Aú<¸eÔÈşaaƒÇŒ\"‹4BCM\ZRòx¾ıöËiÓBJÿ™3	;¾)o¾YpèP¤<%û‘Ã»¹ñºûûU\n)ı;½›©òç^òé=â}ÿ=:äæ-¥ÿ‹/>WÊş¿3n’ûwİZJcÍš‰E·ÀÅ‹GÊıø}tPŞ×ã\'u{½ş½{w’—ƒK—RRRvÈÃ¿ÿıÅœË©Gìp½:={õìñ¯;¾‘É_¶Ëœ¿wï÷löÑñøÏÜ~ãß‘ùºœşİë-²ÿFnßïÈDDDÈi­[·î=÷Ü3qâÄk}:]®Š£ğÚ¤»®OÛÛEİÒÍ†İ–Ş£Gû‘#û¿òÊzöìøLnß¾Åôé¡=öç‹®—ùôÜÜ£1ÑkenÍÉIíß¯Kppï#úõë×EŠÏ½ÿaC{¶k×âØÑh)Ç•+ç6løÂÒ¥ÿX±bÎíkäÙ\rüñÄü¼cyyÇòóçç—ö›o66çäÉøúõÿ:`@×aÃzõnŞüÕ  ŞÒ2¸{½zÏÌˆ—=ØòËş¥ÿèÑRSwÊñ·iÓì&Æ[¬¿_¥Ò/±©ô™:P‰ÀK>ºGÊÚÿ…-ÖÿàÍ-[6’ûeÈ#†÷­U«æğá}¤¼åv“íÉI[¯ÜC{·€ÜeAÃz\r6nŒŒ¸+·€ãDÈèrØÍ[ÀÇï£{„ò¾?©ÛköÏÌLøË_Y¸pæËš4yùçŸ¼ñÆkòŠ %z`ÿ&WYÚÒš6}e}ø\"©íåËæŒÙoåŠ¹_}õÉ[m›ûâxüjn¿Á7;vìÀAƒ|šB\r\ZêëqzZ·nİ¬Y³Î=[ò)#/§9ivYÂµÃ£]l]Ô?=-fÎœ©òpîÜiß~»`íÚù‹}tşüİÛ™=û÷ï²;>¼Øş3Nì’íæş#¾_2qbpÖ…C2¥îŠùvïŞ\rM›¾œ°ïûİ»Ã/_–«¥mÜøUƒÏÒ½pÜ}Ğ ®’BòóÊ³éé1ıúvvï¿KçÖîãìÚµ­<ûÍš/ÂÂ=ñÄÿŒİ?,tPjêvy¶­+…È×î*ëx=·ûU\nq–z‰İd¦®R¥ŠVPÁ{>ºGÊÔ¿qã%û\'\'EøÎ´i£gÌ#•,)òäC‡ôpßƒıúuv÷ïÒ¥µ{®[ -æ›o¾Ê7oP¹R¶Ë³æ-pâÄ®ò=~ßİ#”÷õøCİ^³¿DáåËgEí\\“’²-v×·;v|-“¼d­[W˜ıen—WŠM›şµ`ÁçÎí=ª¿¹‡=Úùâxüjnço§^Å¨Ôã®Åa®Ó\nm´_i»òxèZ‡†ü%ëĞÛŞ´å]ûÍ‹}øá‡ã¶l^fö—Ğ`¼ğ_µW\nqÍ›Ç·o[Ù¶m3)ÁU+çdş´wÅŠÙ¯½öÒ—_Î”¥Q£—ÒÒ¢¤Ï÷ß/9slÉãéÔ±åáÃ[¥!Á¥ë;m†÷9²ïŸÿü°¬¥İùíV	û6Ê!eeÌÎN’Ãûùì>‰#K–|²}ûªÖ­šÈ„ŞªUã“»Ê:^wK!^âKŞ„[¼G¼ì1;éñÇÿ»dÿ¸¸o»u{+rËrYêÕ{VÖ[¶,oØğ÷ş÷íÛXxŒ(¼‚İ·€íXÖÏ[` ÜòzPx¼iŞåsüşpPŞnOİ^³|Üwÿó?’W‡1cË<ß¼ùßCF÷oİºiXèÀW^ùÛ/¿’>’¹])ä‡¥×6´‡üƒ6(¨—Ôp÷no•ûñø[İ*şdöìİ\'û÷õ ½çªT‡y9ÇŒõqW£pKÑvÏ†±l\\Ş³g» a=‡ïİ¯ßÛ½zuèÛ§“¤·Ú6KJÚdö2¤ÛÑ£Û‹í?#cWÿşeKÊ‘­§NÅÉ–Y³ŞµÙ¦ß9th÷ˆˆÅ_=wØ°é’BÇd–ìÔ©¥ô—oÑ¯ïÛ²–	·C‡2‡š;ŒıvÜ¸¡æşÛ¶mj³t;~|§ûøß~»åÊ•³‡÷š={ò†\r‹¤èwìXUÖñëoÑâä?Ú(»›¾GÊÔ_*ÿOª¹¬Xÿ˜˜oæÍ›&üÍ7_üßÿ=µjÕì¯¾úèÓO\'fg\'Ş»Ö\Z·€«Û6MÍ¯ò¸\\Ûß~ûÍ+·ÀúŞåzü~rPŞn·§n¯×ÿÌ™İowjyèPÄ¹s	M›¾œ““œ“sX–fÍ^±Û.^üÑ˜1ƒzôh·iÓù‡¨ôÿé§=‡“·¤¦nKJÚlËO-÷ãñ«ºõêÿÔíÖ½»Rˆì9(8Ø×ƒôQ©rÊºÀq¬°m<ôh+±ÅµŞ»gİŒaŸ|2^Ö;w®ZûÍç‹Í<>¡E‹¿çæ$K‡!ƒ»MİVlÿ\'¢û÷{ÛÜ8p@	ÁA½|ğşõë¿:¤Ûºï,_şÙ°¡İÓÓ£N¤Gmß¾2>î[ùF{÷†»Ö{ÖMŸ\"»İ¹c•t=ÄîúæÅŸ\r\ré\Z:à/yDÖÒ®[÷qóYÙÃ´i£jÖüÏÏ?Ÿ6jTßÔ”­²Ñ+73^ÏşÖM!NşÓÑ2º•{Äûş]:·Ú¿c›6Ml¶TÏşáëJìX¾ì³U+g?÷\\Õ_Ï‘¥uë&Go1÷»öª[Àh¸n´ÒÁ¸Fºoó~t…•ò>~ÿ¹G(oÓí©Ûkö¿|)qÒ¤ ¿şµîÄ‰Aß®ıâ…™0a¨±ûïÿ~X:Øm©òJÑ£û[›~XÒ°á}zwœ3grƒ?ú/üo¹¿Õí¿AVVVÕªU}ñvˆìSö|áÂ_Ò{Æ»v<^³í8Z`¬+d´íî-©îş2¯-X0==}ç†\r_NoÔÚµ®\"O}òñ¸õá¥¿ë½Ô­ÅöŸ‘İ¿ÿÛû_÷İüO?ğãÉ˜¡C»Í;eÇöÃ†uO;¾#aßúY³&M<|üø!æOŸo,òµ]»¶™=ûİı	ëåkcw­7n°¹+cnu}¯~ı:H—)øèÖÈeáá»ti%Ï†…\rH5Æø÷âÍŒ×³¿¥Sˆó:3u)ŸÎ3gê@š£½w+÷ˆ—ı·o[>hĞ;²eÍê¹cÆt÷ÿæ›y!£ûM:ò½i#%L<öØŸ§—_şë€e~7‚¸ÜCÌşE	ÛuH\n‘-[·._· Kç7ecXè\0#ˆ§ºº•ëñûÛ=By;oKİ^¯¿Í–rè`DÇ-öîùNrğ+¯<ÿí·_|»ösY$I›ı³9Ğ£Ç[›6-Y¸à}s\'ò0ñP„Ti¹¿Õ­Wß`ÆŒ\Z5.÷\"ûœ>ı}_°LŒ¼,g?µÀX»–Âkã±öxèî&/¾˜öí·ŸËö=»¿›>}ôÚoæ-Z4CæÄ·Ú6Ûµkµl2¤ë±£[‹í?ãD”ñ^ˆk‡+Vüã³Ï&vìĞÂnO9s:Vâ°ü[0.î›ùóß;sz—Ù?5%òµ×^Ü¸ñKó\0V­œ%Ïº\'jçÊzõ	\r•ÿõ7Şéo¼òØ‘#›İ‡mLÁ©®)85òç³»)85çò¡_~Ù_¦ñz«§çu~ˆ^JõÆËoÂ­Ü#Şôß³ûÛ¦Mdg0û\ZÕGB¶»Ã‡9¢·üËRÂÇãÿùı÷Gğşh™ÖÛfößiŞ!×½¤[—.Æ-à\nâ‘gå0òúe¹²®q”õøıó¡¼}]·7ìß§w‡s?ï=ztë«¯Ö‹‰ùzWÌ×²–Z5ûKÁï…,–é}ØĞîòjr`ÿ†Zµ’úôÑñøOİzõ\rrrrê<õÔ”)SË1‚ÈŞdŸ¿d_ôõËÄ¨Ô‡=EÖ®‹án8RÌÅln±n4ŸÏ›òVÛ¦¡¡ı$ÃN:|Íš9’BÆ„\rX·î³ÿàAï=\ZYlÿ\'Nìèßÿm÷şçº’Gã_²rr\rĞ9<|ş´i#dº´Ù»çò¥C½{·ÏËK’öòeŸÎŸ?Í}<§OÇ:´Ñìöæ›¯™Ô”-ÙÙûİÇß¹sKYüÄààÒÍn;²iÓWÆ)Óx=ÏO\0¤gYşúµçs´÷nå)½¿İ~döìI\Z½xîÜw7)Î·ß~#$¤ŸÜÅú7oşŠÙmÛ¶eşgn<}Êu˜}\\·€±1%eóÅìîÃ[@\Z®[ c‹à æ\"·ÀøñƒoåøıüÑ¼¼}W·^öïĞ¡ùë¯¿òÏ/?µ»¿«mt;÷ó=Úş±hÁùWeÊ/¿$têôF¯^í\rê’››è‹ãñŸºõödddT­ZuÉÒ¥åAV¬\\yß}÷;æÓ±İ£RåõşˆÃîZ»…k£Q¼CÑÃo×Îİõµ4~<¹3âû/ıóıE‹>ğìß½{›cG·x~ùÚoæ¼øâ3æOóÜTÔò¥K>|õÕ¢£V˜û_¾ìã9s&;S?F=óÌ“O>ùß»w¯¹æñÔ¯ÿ\\±ãÿå—}ÿûß>ú(LÚƒuÙŸ°N\Zÿüçû]»¶êÕó-9ì2×óx”Ï°å¥¬3uÀÌÑŞ»•{¤ôş[#—uÏË=T¬¿İ–<&¬ÿömÿr÷ÿä“±õêıoXXÿÒ÷/·@±ãÉ¾Ñ-p+Çïÿ÷ˆÎåí»ºõ¦¿İ~¸Kç–ÇGJ»E‹†²ÎÏKìØ±ùÓO?nvH;¾µG÷¶«¿5şÔM?,zíµz{v#;üâó)Ëşõq¹_Õm¾Azºë˜H€¸Å\"QFö³}ûßê¦É¸®„kq8Ì‹T´¶_Ù^rcÉş¹9óóyö¿t1AæSÏş¹¹mù‰×ÜNÎÒ÷oL©{K9#G\"nåøËÔßfØòâıLHs´÷Êñ¹éş/&ÈİtÃşGGÜã±Ğ=¢myûCİ–Ò???1ëÂnó)[~’Ã¬Oİ–íDGGßwß}·ò£ùÚªU«¦=æ“ÑÜ2ãLÉ‡T@²QF£äº°Ïa¶Öııd†-/ŞÌÔ6G{{Äê÷ˆåMİúmİ–ùdddÔyê©F\Z—õ·f¤¿|•|­ş ÆÍÈËIÆb^É¤…İ\rwÇÕuîï?3ly)}¦¼9Ú{Ü#phXŞÔ­ßÖíÍ|ƒœœœéÓß—2íÖ½»7YDúHOé/_åoG-ÆøÙa¢q%‹\ZIf£ØöbÏjŞß¯fØòr½™: çhïqÆ=¢[yS·~[·7ÿ\r²²²FùÀ<ôĞC\rúzõê;£OËÍË—µ´eË ÁƒåYé<|¸ô/Çãö#/\'z¿8‡è_à3ly)9Sêí=î‘€¹G´*oêÖoë¶¾Á={ÆëúiK:÷İwßwŞ)kiË–ĞPÿù?b¼qÇw8ì\\×ãÃQØp/î-%ŸÒ¹¿œ±Š+ª¾t¾â9Sğí=î‘@ºGô)oêÖoëÖïâ¹ZÕ«W?‘¾©ÀqÀ\\œÆAc9puû`Q‡ƒš÷Ï8±ùŞ{«ª¾t>dÎÔ+V®à9Ú{Ü#vhRŞÔ­ßÖ-)ä*µk×‰^â¾ı‹\\÷F×Úy¥ƒÖıåŒ=ùäŸU_:ßŠŒŒ”9ZÖªD=î‘À»G:wîğåMİúmİ’B®ÔÅY  Á}Íœ²x^Âb4ï?<øÑ£º«¾t>7vìXÕ‡à¸GïñÃÏ¬”;êÖoë6ğ‹¯LbbbjÔx ?o·Óu%ä’$—¤pñ|Xü)]ûË¹ªYóQ;©¾t>§ÃLí\rî‘À»Gt¨mêÖoë6ğ‹¯¬Z´h1mêàÇ>§cŸk]àj×©h‹±± ğÙcÙ§m9W-š×W}Ñnfj/qØ=¢ImS·şY·Z_™$%%ıú×wïØ¶ÀuÍ\\—d¯,Ncíj¸·\\yjŸÙAÃş?DÌ©V­Ê¡ƒ_«¾h·ƒ&3µ7¸GÊz$Z­ú¢•F“Ú¦nısn×¢øÊj÷îİr[F|?»À±ÇY`^×âzè(jm1ÛfC«şÛ·Í—³´î»OT_®ÛD“™ÚKÜ#tèSÛÔ­Ö­.ÅWVëÖ­û}µ*Ó¦´åí*pìvì6×NÇî«\Z[®jëˆımù»äÌTúõİ»ã«¾P·>3µ—¸GæÑª¶©[«[Š¯¬’’’š7é¡\Zz{Wô—éá8ãRÅ›ëi¸ÚW7\n\nŸuz¶­ß¿Àw\"=<&japP§\Z5şĞ¢ùKI‰+U_¢ÛJ«™ÚKÜ#qèVÛÔ­_Õ­^ÅwbbbBFw}òÉZÕï«zGÅŠt%c—3PûÉZr6b¢ª¾,\nTĞl¦ö÷ˆÉº÷H-k›º5)¯[‹Ï¢ø{jUĞr¦†¨mµ4ŸÛ)>køüóÏe¦HKKS} úb¦F ¢¶ÕÒüük=x«ÈÉÉù·û7©Ô¦M›ª>}i>S €QÛji~şµ¼U´oßŞü^•*UÂÃÃU¦4Ÿ)À¨mµ4?ÿZŞõ«_™)ä®»îzğÁóòòT”4Ÿ)À¨mµ4?ÿZŞjÕªåùyæûî»oÂ„	ªJGšÏ`Ô¶ZšŸ­ïÿÌ¿ôWÌoûÛÌÌLÕ‡¦Íg\n0j[-ÍÏ¿Öƒ÷\'N”}ì±Ç\Z4h x@Ö>úègŸ}¦úĞ´£ùL\0Fm«¥ùù×zğş/\"\"B\nôßÿıßÍ¨Êú7¿ù4Ö­[§úĞ´£ùL\0Fm«¥ùù×zğ–“••å,ªTioŞ¼Yñ1iIó™ŒÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-¿úÕ¯T‚Ö4Ÿ)À¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©ÊİúùOIIÙ±cÇ®]»ââââ\r±±±QQQÉÉÉÅzÊSaaa·øí\0/1·¨¥ùù×zğÖ¢y¥*WúùÏÎÎnÚ´i—.]zõêÕ§OŸ×_½M›6½{÷îÖ­[ëÖ­×¬Y#}†>kÖ¬ÕW›3gN¿~ıÌlÙ²eäÈ‘²“÷Ş{O\Z“&MjÔ¨Qpppttôí!tÅÜ¢–æç_ëÁ[‹æ•ªœ÷ç¿  àùçŸ?ş|±í,¶nİ*Écıúõ7n”µ´·mÛ6lØ0y6333>>~ÿşı’Z$$&&N™2E‚ÈöìÙsîÜ¹rP„¹E-ÍÏ¿Öƒ·Í+U9ïÏÿ„	şğ‡?dee%$$xn—%©bß¾}²–‡±±±ÁÁÁNãç5K–,3fÌğáÃG‘öØ±c/^œ––VşCÌ-ji~şµ¼µh^©Êyyş§M›Ö§OŸ-Zœ9sæ…^ˆˆˆp?%)$55uéÒ¥£F\n“±|ùòãÇ›)ÄÔ®]»Ö¯_ß¾}ûòà¹E-ÍÏ¿Öƒ·Í+U¹ÉÍš5“HQPP )D¶deeÕ¯__’„ÙÁL!ƒÎÌÌ”‡.\\:thÉò®‡I“&uìØÑgc\\˜[ÔÒüük=xkÑ¼R•+ıü§¥¥=òÈ#k×®5š)Dœ;w®nİºÎ¢TJ\n0`À„	Ü)düøñ’Z|5$ÀÀÜ¢–æç_ëÁ[‹æ•ªÜ\rÏ~~¾»íN!ââÅ‹fÃL!óæÍ7nœ™0æÏŸï™BÒÓÓW­Z\Z\Zš››Û³gOy(åÙ¤¤¤rà¹E-ÍÏ¿Öƒ·Í+U¹2ÿ×_½äFÉ)))Å6JÂ1b„ÙîĞ¡Crr²ù#˜³gÏ†‡‡Ï;7\"\"âÕW_=yòäÍ8pÌ-ji~şµ¼µh^©Ê•éü?÷Üs%72¤ØoÍHş¨W¯ŞæÍ›¥‘‘ñÉ\'ŸHãƒ>èÓ§ÏÈ‘#‡\rÖ¹sçË—/Ÿ:uÊf³İÒÑ×ÇÜ¢–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©JØl¶E‹eee9‹Îÿ={vìØ¡ú¸€òÄÜ¢–æç_ëÁ[‹æ•ªÄøñãå´W¬X±V­ZÒ¨\\¹rƒù¿à¹E-ÍÏ¿Öƒ·Í+U‰‰\'V(á™g	W}h@¹anQKóó¯õà­EóJUâìÙ³wŞy§giØ°á=÷Ü“™™©úĞ€rÃÜ¢–æç_ëÁ[‹æ•ªÊ!C*V¬hFJ•*I\n™0a‚êƒÊs‹ZšŸ­o-šWª*yyyUªT1SHûöí~øáÜÜ\\Õ”\'æµ4?ÿZŞZ4¯T…Ö¬Ycş\\¦F\Z|\"‡¹E-ÍÏ¿Öƒ·Í+U­gŸ}VÎóæÍUPş˜[ÔÒüük=xkÑ¼RÕJKK“ó/kÕ”?æµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-zVjttôèÑ£k×®}ß}÷İqÇ%ÿz‡&dìrä<ÈÙs¢ú²  TĞrnñšŸ­o-ºUjRRR‹-~øááÃ‡ïÜu<-=/ß–o“Ån,îÆ5–Üníşyùùrä<\n’sÒ¼yóÄÄDÕ—B·¹Åßh~şµ¼µhU©»wï®T©ÒäÉ“/çäHö0^Œ]k›Í\"×Xlvw;ÀûË9™2eJµjÕÖ­[§úB!h5·ø!ÍÏ¿Öƒ·}*U^\\e°‘‘‘Æ+q¾ñˆëå¸¨m¬í¶ü«·x.:ôß°qƒœ%‰kª/,OŸ¹Å?i~şµ¼µhR©III¿ÿıï7n\\ŸoË³Ùòòm¹²˜b]ìyf7wC«ş‘‘[~ıë_ó£Ü\"Mæ¿¥ùù×zğÖ¢I¥¶hÑbòäIÆK¯¼îæ¸\ZöÜ¢ãÂvÑ–s{a7-ûO™2¹ÙëMU_4X›&s‹ßÒüük=xkÑ¡Rcbbzè¡œÜ‹òúj“Åõê+ëœü¢¶¹ØÌµİİÈÕ¶ÿåœìš5â·fp+t˜[ü™æç_ëÁ[‹•\Zl³]6^‰/ËRïï½ü]V³¿ëµ¹èË¯4ìÆF³ƒ=ÇsÿĞ?(hÈèÑ£U_:X˜s‹?Óüük=xkÑ¡Rk×®½cGd¾í’ñŠ{éÅ—şètw8Ûœóœ{óœ±Ùö+Øq!&ßãŒÉqn»äÜ˜ëüp[B÷=—çËî/÷l›¯´m…O@ÿ;·>ùäª/,L‡¹ÅŸi~şµ¼µèP©Õ«W?~üˆÍ~É\\dÈÙNçÅç»óç|ç%§sÈ¨°\nólÃæ6gz3=×y,ÇyÄî\\¶s¯t¶¹^¡/š_ëjØŒıØ.™|÷Ã¢ıFÿ´ô”{ï½Wõ¥ƒ…é0·ø3ÍÏ¿Öƒ·*õ;îÈËÏ¶¹^€/Êë«ù’Ã™çp=e/p­¿ùnıı5=qºİéüÅî¼`sşlsw:7îÚçJ!vã%ÜõB~Ñx9/ÜOáCÏFÑö\0èŸŸŸ]±bEµ–¦ÃÜâÏ4?ÿZŞZt¨TãıŒ_lv	\"Ù²–‡íÎ³—ùÂçÏŸÿàãYŞû8ıä)yh+pæédGÜŞÂ¯5¾°p\'%®Wö0ıu¨\røõ£–æç_ëÁ[‹•j¼Ÿ!¯¬YæÚ•BÎŸ.9Og;mNg~^ŞŸkÕªPá\n*½ùV\'Ï/Œß}åk_ªİûñhØ=·gLj¾ó«_ıJõ!hMóûWëÁ[‹•j$‰,ã•U^b³ÌŸÈœ½ì<ù‹óL®3ö@ê½÷Ş{Çwÿ¿{ª¶mwU\nÙ/í®é,»=Ës\'v{aCÖf§¤¿µ9wî\\åÊ•U…Ö4¿µ¼µèP©ÆOU.¸^híÌ×ËÎŸs\\ï…ü”ëŒØ•øØOU­öû{*W™µpY®Ó™ç¼”çúÂmQ»\n¿Öõå…kãåüÊãåü‚çş¦¿µIMM­Q£†ê£Ğšæ÷¯Öƒ·*ÕHçí®İó²˜C– rÁæ<—ï<ù‹mGÂ±\'êÔ}é•×Îä9Oç8Ïä8Ïæ9%‡l‹1Rˆİ|ñv-Æ+·±+{áÚæ¹ÑØÀô×¡6à#qqquêÔQ}ZÓüşÕzğÖ¢C¥\ZIâ¼ñº+¯²ç^¨÷Â¾C‡c£ö$nOÜ¾;yÇ¾”M1w&ŒOŞ\ZŸ´}wRÔŞä„ÃiŸÎşüÍV­Ì¯²™kÛyÏ‡F»èaÑş¦¿µY´hQëÖ­U…Ö4¿µ¼µèP©Æg;äÅõœñ+¯¯çúöíéÍN}ã–f{ÑbóØg£Øş£¿µéÕ«×Ì™3U…Ö4¿µ¼µèP©F\nùÙf?kw-?›m›ÍÕ6ÖæÆÂ-®†±…ş:Ô|ä±Ç‹U}ZÓüşÕzğÖ¢C¥\Z?‘É4^bå7Óf+l»·x>4^3é/‹µ_Ø¿ÿı÷ßo³ÙTˆÖ4¿µ¼µèP©Æ{!™×\\lî†íÚtî¯CmÀ:tè0uêTÕG¡;Íï_­o-:Tª‘B~²Ù~’µ«a7™öÂ†»yU7íûëP(wÇûİï~wúôiÕ¢;Íï_­o-:Tª‘BÎ¯¬gŠ^†Ï/·îg®ÙAóş:ÔÊWVVÖİwßıÕW_©>h1·—BëÁ[‹•Z”BÌå´±x><Sb9MY®Yñññıúõ[»víí¿ğsAxâ‰·ß~[õÀE‡¹½ZŞZt¨T#…œ*z}u7J.®§bİôí_¬6:TËõîÚ¼y³¢ë	tìØ±š5köíÛ·  @õ±ÀE‡¹½ZŞZt¨T#…ü(¯¯Ç)‡ëUöGs‘‡ÅÆ³E}tïï®œœœöíÛÿêW¿2óÇ£>úïÿşïò_µ—~bÿşıR¿ûİïøAŒ_Ñan/…Öƒ·*ÕH!\'WVYŸt¸^†toqxl77ºš÷7kãóÏ?ÿ·û7Ï?æÖ AƒvíÚ©¾ªPãÜ¹s©©©qqq’9z÷îıøãßÿıÓ¦Mãã¨şF‡¹½ZŞZt¨T3…8æKìÉÂ×ÚW¶gĞ_Êy;v¬7dÖä~³J.ño~ó›Ê•+×©S§U«V3fÌØµkÄ?UĞ`n/…Öƒ·*UÆèpÈmFáÚõ¢[¸Ûâ(ZÓ_³6ÒÒÒš5kV¥J•»îºË|)zàx/ÄB²³³›6mÚ¥K—^½zõéÓçõ×_oÓ¦MïŞ½»uëÖºuë5kÖHŸáÃ‡Ïš5kõÕæÌ™Ó¯_?s\'[¶l9r¤ìä½÷Ş“Æ¤I“\Z5j­tp¸.æöRh=xkÑ¡R])Ä~Ân,Ò×Z÷ºp£Ã|–FÑC¯ûÏœ9nãÆ¥òTZÚ®øø\r	û\"Ø,ë¸¸õ?Ÿ=àîß³g‡ÜÜcæş;v|ózûúé\'óóÓŠÏÇO:œ¼Íİ?<ü«?_^Ç_JÏÚğÁï½÷^3ˆÈ?ˆù\\ˆ<ÿüóçÏŸ/¶]‚ÅÖ­[%y¬_¿~ãÆ²–ö¶mÛ†\r&ÏfffÆÇÇïß¿_R‹Ä‘ÄÄÄ)S¦H9pàÀ={Î;§b(¸æöRh=xkÑ¡R+¸~\"“.¯¸Â×İt×ÃÂõ	c{a»¨[º÷ıóòu}§íÖ­«ÂÂOœ8üóÏß6¬×‚3:vh¹aÃâè¨µƒuT·îãcÆ	î3nÜ°úõÿ:aBĞØ±C%[ÈŞÙ±cÍîøõ{÷~/Oíİ»1>.|çÎo‹1ã§3ûşş÷zgÎì\r2°S§VM›¾\Z2pÀ€®·~ü¥ô/Vyyy\'Nüíoûè£ÊS111ª.(nÚ„	şğ‡?H‚LHHğÜ.)D.hTT”¤Š}ûöÉZÆÆÆË³)))K–,3fÌğáÃG‘öØ±c/^œ––¦h4(s{)´¼µèP©Æ{!iGš]ÖF£píğh[—¥¿İv\\\Zaaƒ¾ûîËõá‹^xá™o×.øè£ñ›7/“gß}wÄ¸qCŸ~ú‰ñã‡õîØñÌŸö}³æ‹åËgåæ¦ÊÎ;mğ nsæL•¥NÇÌF¿¾?ûl²û»¤§Åäçİ´iYĞ°^²‡&M\ZŒİÙ²ÏÊåø¯×ÿšµqöìYù‡2¿¦kEÓ¦MëÓ§O‹-Îœ9óÂ/DDD¸Ÿ’’ššºtéÒQ£F………IÈX¾|ùñãÇÍbj×®İFRíÛ·W1xE‡¹½ZŞZt¨T#…w-sVø°h£ıJÛõ”ÇÃôß¶meÇotíÚVÚa¡¿ûnÁºï6jT_Ö’B¶H\n±ïÔ©å?,mÚôåM?,mİºÉ\'cƒ‚zId9õcœ¹ÿ/¾xÃúEæ[¶|ÍÜÿšÕŸñÅtùÖq±ßÎ=eÙ¿>;÷sÂš5Ÿ¯ÿçÔ©£ôï\"µß|‘xhÓ­éıu¨\rMHhÖ¬™DŠ‚‚I!Nã/ŒÕ¯__’„ÙÁL!ƒÎÌÌ”‡.\\:thÉò®‡I“&uìØQÉpà\rÍï_­o-:TªñéTó%ö˜ÃqÌXw5\n·m÷l”¥¿di‡…\rœ4)xèĞîo¼ñê€]îºe‹¤cqqß6iÒà¥—“«VÎ–ş!!ı_{í¥œœÃæ—ñÅ{­Z5\nê)ËŸşTÃÕÖ³E‹¿»RˆıXròæİ»×É>³²JìXµjö:É:ë®Y3OBÉ±£Ûoıø¯×_‡ÚĞAZZÚ#<âşs·f\nq\Z¿s[·nİŒŒgQ\n	\n\n*%…0`Â„	î2~üxI-·}4ğ–æ÷¯Öƒ·*ÕH!òâzTÖc…mã¡GãX‰-ŞöoÛ¦©4‚†õˆ];bDoÉ\"ï¾üÑGc·lùW|Ü·-[¾vèPÄë¯¿rætÜÂ…ôîÕaxp¯¯¿óüóOKÿ#…lXÿ¥¹7×{!FcÍêy²İıÛ¶m*ëE‹>|çÖ<şãÇ…†ô5ªo¹ÿõúëPšÈÏÏw·İ)D\\¼xÑl˜)dŞ¼yãÆ3Æüùó=SHzzúªU«BCCsss{öì)e£<›””tÇ2ĞüşÕzğÖ¢C¥\Z?‘Iu8¾âšmÇÑcm¼ú\Zm»{Kj™úK\nÉÍIêÖ­Í¡ƒC‡t“ş’$…DnY*Ï®Y=·OŸıúu\nĞ¥K«áÃ{ÕwĞÀ.3gÉË=,;ùâ‹iC†t›3gòÜ9“ëÔyT\Z²ôïÿ¶¤÷ñAçè²}úæ›ÆŒ8fÌ ×Ã”Ëñ_¯¿µ¡¡×_½äFÉ)))Å6JÂ1b„ÙîĞ¡Crr²ù#˜³gÏ†‡‡Ï;7\"\"âÕW_=yò¤¯7AóûWëÁ[‹•j¼\"¯¬©ÆÚµ¾îz¬=º»yÓ?//ùÉ\'ÿ§wïö/¿ü×Ó§bš4©?ztß·Ú63ŞYjvKJŒX¾ìSi´nÕxÍš¹_¯šµzõ÷ş?ùdüìÙïîÛ»nß¾uõëÿŸ¬¥ıé§ãgÍšä>¶m›~ùå²I\'ÿüçY¦NáJ!·|ü¥ô×¡64ôÜsÏ•Ü8dÈb¿5#ù£^½zæÇ322>ùäi|ğÁ}úô9rä°aÃ:wî|ùòåS§NñWËü“æ÷¯Öƒ·*ÕH!){Š¬]/´î†#Å\\Ìvá{áF/ûÇÅ®iĞàÿ¢¢V¶z³‘gÿ>³eË³¿¤ŠéÓGÉSmÚ4Z%e¹æş7~©äñ¤¦n¹çß~öÙÄeË>ùpfXrRDrrÄúğ¡¡ınıøKé¯Cm\0JóûWëÁ[‹•j¤Ã#»kín®FñeéŸ›s°wïvûö~ëîß¥sË‡şÏcG·,_öqÇÍ{toÛ¹óÁÁ=Ú¶iÔ}ğà.Ò_ÉšÕ³‹íÿ™g,¹ÿ„}ß-[ö±4æÏŸú¯¥IãÂùİ/½ôìâÅ3Êåø¯×_‡Ú\0•æ÷¯Öƒ·*UÆXàz•u-‡ù\\´¶_Ù^rãM÷wØ“onÿI‰KéŸ›s /ï¹ÑfKòİñ›\rjTšß¿ZŞZt¨TãÓ©’ÉÒ(0%×…}{´µî¯Cm\0JóûWëÁ[‹•j¼’d,æKl’Ã^øĞİpwp\\ıPçş:Ô¨4¿µ¼µèP©ÆçBWÙÄ¢F’Ù(¶½Ø³š÷×¡6€@¥ùı«õà­E‡J5ŞIô~q8Ñ¿€X™æ÷¯Öƒ·*õ;îpØ¸^k9…\r÷âŞRò)ûË«X±¢êKà&é0·—BëÁ[‹•Z½zõé›\nÌÅYpĞh4–W·u8¨yÿŒ›ï½·ªêKà&é0·—BëÁ[‹•Z»ví˜è%îWÙÇ~E^tİ]kç•Z÷—3öä“V}é\0Ü$æöRh=xkÑ¡RCBB‚‚º8äÅ5Áızì”¥Àóå¹ØÃÍû~gô¨îª/€›¤ÃÜ^\n­o-:TjLLL\Zäçívº^eåå6Áx¹-\\<J×şr®jÖücÔÎEª/€›¤ÃÜ^\n­o-šTj‹-¦M\\àØçtìs­\\\rã5¸h‹±± ğÙcÙ§m9W-š×W}Ñ\0Ü<MæöëÑzğÖ¢I¥&%%ıú×wïØ¶Àõzìz¹İ+‹ÓX»\Zî-WÚgvĞ°ÿsªU«’xhµê‹àæi2·_Öƒ·}*u÷îİ2Øˆïg8ö8ÌW\\×âzè(jm1ÛfC«şÛ·Í—³´î»OT_.\0·DŸ¹ıš´¼µhU©ëÖ­û}µ*Ó¦´åí*pìvì6×NÇî«\Z[®jëˆımù»äÌTúõİ»ã«¾P\0n•Vs{IZŞZt«Ô¤¤¤æÍ_z¨Æ‚ƒŞŞıeFzx#Îx7×Òpµ¯n>ëôl[¿=îDzxLÔÂà N5jü¡Eó—’Wª¾D\0Êns{1ZŞZô¬Ô˜˜˜Ñ]Ÿ|²VõûªŞQ±b]ÉØåÔ~²–œ˜è…ª/€rSAË¹İMëÁ[‹æ•ªÜØ±cU€\0¤ùÜ®õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µÜ°RSSS£££ãããe½iÓ¦+VLŸ>½gÏÙÙÙî>ãÇ—íî‡™™™ÿüç?»uëVroÿû¿ÿëp8ŠmüôÓOSRRÜ7lØğñÇßÌ`,Âf³-Z´(++ËYtş÷ìÙ³cÇÕÇ pB`\r7¬Ô£GÎ={áÂ…Ë—/ÿÛßş&YD¶üüóÏv»]=xğ`¿~ıBCC»té2xğàÖ­[K(‘×T³ƒ8qâ„|ÕŞ½{÷ïßß Aƒ„„yÑ‰‰IOO7;œ={öÕW_•ì&»êÜ¹s³fÍ¤=hĞ Ÿ]9?rÚ+V¬X«V-iT®\\¹‚aóæÍª\r@€ …À\ZJ¯ÔØØØ·ß~;88X2Á¸qã}ôQYKP\n\n’íqqqIIIÒyàÀçÏŸ—8’››ë¹“Ï?ÿ|È!óO=õ”Ùèß¿¿„wŸŒŒI-‘‘‘ò½:uêÔ´iSÉ4ï¯’‰\'V(á™g	W}h\0,Œ÷YİH!–áM^~ã7$yŒ3FRÈØ±c%‘´oßşâÅ‹òÔåË—%yŒ=:>>ş½÷Ş“êïİ»÷Î;%¾˜ïšHŸ|ÿı÷æ®Ş|óM³±víZÙ.İ»wÏ;WÇ…dãÆe?h¤ñİwß%\'\'ûjäêœ={öÎ;ïôŒ \r6¼ç{233U\Z\0ã}V7Rˆex“Bä5r§¡AƒfCrÉ¥K—ä))îI“&M›6íé§Ÿ2eŠ$•=z|ıõ×/¿üòªU«öîİë4RHëÖ­ƒ\r<òˆÙ=˜)äÈ‘#Ò­eË–ÙÙÙ;V¯^½Ş°Ö––æë3 Ä!Cd¦0\'ˆJ•*É0a‚êƒ`m¼ÏêF\n±/SÈ6CıúõÍFóæÍÍO§feeIVØ´iÓk¯½öı÷ßKŒèŞ½»lïÒ¥‹ûS¨¥¿bzë­·d½xñâ®]»~j=zt¹ÕäååU©RÅœ#Ú·oÿğÃû1\0”ï³º‘B,Ã›Ò­[7ÉcÇıË_şbşD¦GçÏŸw\Z)döìÙ«W¯nÔ¨‘¬×­[\'ùÃY\"…:´ØçBP2…¬X±¢U«Vãıû÷3fŒ/†ì\'Ö¬YcÎ5jÔĞğ_*\0|÷YM¤Ë¸a\n9xğ $É“\'O:õñÇŸ2eÊ»ï¾+[8`vèÕ«×±cÇŞyçáÃ‡GEEµnİÚyu\nùÇ?ş1wîÜı†\r\Z˜Ï>ûlÎœ9îï\")dÑ¢E’B$|exï½÷;…ˆgŸ}VÎóæÍU€\0Áû¬&Rˆe”B$IüòË/™™™YYY/^lÙ²¥¬¥-[²³³åÙíÛ·›aBRHNNdˆyóæ9âşM]OMš4)¹QBLåÊ•gÏ-)ä£>:bØ°aCXXX9ÒO¥¥¥ÉùÔÏ¾\0P‚÷Y¤)=…$$$ôíÛ7((hÔ¨Q!!!#FŒõÈ‘#‡j¾â4~M¦uëÖ&LHIIiØ°a~~¾ltÿM1ò¯ÿ’÷ïßoşRîÂ…—-[&\r‰>õë×_ºtiyÑ¯iş;ı\0|÷Y™X-£|_óòòÌ†Äˆ‚‚‚’>\\ú—Ûl6³]òO¬ÈÈÈÿøÿØ²e‹êPxŸ•bü[\\	¿ûİïV¬\\)ADÃßæàSšÏíZŞZ4¯TUÌñC¾ÍşÃ›\"\0nÑŞ½{ÇÛ´iÓ§zªzõêwß}·¬¥-[d»ù×›ôÁ›eT¬Xñš?:ïxFs!ˆ\0¸9YYY¡¡¡ÿùŸÿYòï•#}¤§ù÷İ)Ä2*W®|îÜ9ÕG¡‘’ÄDd;Ÿà¥¼¼¼™3gV­Zõ†ùÃ“ô—¯r†/P‘B,£F\Z©©©ªB×‹ æ\"Ûù°*\0oddd<õÔSñBfN:}µxIttLZú‰‹—.ËZÚ²¥C‡ò¬gçºuëÊTÂ‡H!–Q§N¸¸8ÕG¡…Ò#A€—¢££«W¯î?üğâ%KsróJ™[äYéS³fM÷WÉd?ª‡â+¤Ëhİºõ¢E‹TEàó&‚D\0ÜD‡J•*™Iâî»ï1cÆ¥Ë97œXÌEzNŸş¾|•ùå²Ÿ@\r\"¤Ë˜9sf¯^½TE€ó>‚D\0”\"##Ãı.HµjÕ6oŞâå¬â¹ÈW¹?M\"{ÈÍB,#66ö±ÇS}¬¬„ àšòòòÜŸ‘’”|ø&\"ˆ¹È×ºƒHİºuïÃª¤Ë°Ùl÷ßÿşıûUH`*ANŸù©”©ÁóY‚\0O3gÎtÿ ææŞ)öÈ]wİeîPö¬zpåŒb%Ó¦Mkß¾½ê£@%#HHh¨d¾C‰I×œd»<+}\"\0ŠÉÊÊrÿËŒ3n1‚˜Ëôéï»}7Àş)ÄJNŸ>-/–æM‡òrÍbŞğ×\"f1;D\0bÎúÓŸ¼ÿ8jé‹ìÇı[3¡¡¡ª‡XH!óÕW_I-XV¨”rÍ âA\"\0JrÿuÔÅK––K1Ù›¹[Ù¿ê!–\'RˆõôíÛ÷‰\' ˆÜºk~¤XÈğ\"%#ˆù,Ÿ`Ú³g93È<Púß)ë\"{“ùÊÜy ı_3¤ë)((èÔ©ÓİwßÍfnÅõ~#æzQ#|ı†RŠçB˜Íf›:uê‚233K>;vìXsrYº#ˆ¹tèĞÁÜ¹|—Û?p!…XÕW_}%/¢íÛ·ç·fnBé¿”{Í R±bEo\"Al+W®4g€;ï¼sğàÁÅ~u¶iÓ¦æ³_-^Rî)Döiî\\¾‹ªá—;Rˆ…>}zÚ´iòZøØcõêÕkÑ¢Eqqq©©©çÎãß-…7äšAÄËBXVV–ûß$Ò¨R¥Êš5kÜÏºÿLHttL¹§Ù§¹sù.\nÏ@ù\"…XÍf‹9sfëÖ­ëÔ©S£FÊ•+—ü‡;LŞÿi²R‚È\r#A`µjÕòœî¼óÎgŸ}6--Mrÿ½Ô´ôåBdŸæÎå»¨>å†½”é¯£†¯ßP2ÏÉÙîå~øa“÷Š6÷ÿürñÒårO!²O÷wQ=•–Rô)AäûˆŞZÇëÚµ«4ö¢¢¢Ş|óÍÄÄÄİ»wgddœ;wî­·Şê×¯ßğáÃCBBäß£G8p`ÇÍÏE~ÿı÷7şğÃ¥[ß¾}k×®-}‚‚‚ºuëvòäÉ‹/¶oßşÑG7oŞÑ£G›5k¶ºÈ«¯¾ªzôÖV¹res*¨T©’œä‡z¨E‹¼rsH!Ğ7A„Ï…À×z÷î}êÔ©¯¿şZ²Å\'Ÿ|2sæÌçŸ~Îœ9’*víÚå4ş/’äää\'Nüøã¯½öšt–öáÃ‡srrÜ;ùå—_G~~~=l6[zzº´=¿ËàÁƒ%ĞH£sçÎîü	æ[áş]Ü†\r¾òÊ+5kÖw?ËçBÊŠ•DøøÚ†\rüñ‘#G6kÖÌL’Ì·FÜNŸ>ıÜsÏıÃğÄO˜_|ñÈ‘#òlBBÂ°aÃ²³³¥=zôèÄÄDiÄÄÄÈNÌ§ÇÇÇ÷éÓ§víÚ}ûöıøã›7o.İBCCeÍ{!·\"\"\"¢‚ñËİsÏ=\'Näwdn)š’ R¥Jş^”¸xñâ?ş8|øğäääÙ³gwëÖmĞ Aİ»w0`@›6mN:%}233»téböoÑ¢…Ùèß¿ÿñãÇÍvttt¿~ı6mÚôÌ3ÏHcèĞ¡k$yŒ3Æışüç?GEEÉ·;|øğ‰\'N<)ë”””.ÜÖ–uëÖÍš5ëìÙ³%Ÿr¬C‡åBø{!@@áo§B¡­[·~öÙgÒ¸|ùr||üşıû8””dv8sæL“&M‚ƒƒ_ıõGyD‚HPPP£FRSSİ;9vì˜ÃáX±bÅÑ£G?øàù’/¾øBÚæ³kÖ¬‘²wíÚuéÒ¥3fÌNy8gÎœ>úèĞ¡C·È:Ø»w¯93ğ·S½D\nÖød Ä‰\'|ğÁ¾}ûöêÕKb‡d‹iÕª•gÏÈÈÈ‰\'J‘èğõ×_Ûl¿téÒĞ¡Ce‡]ºt9}útXX˜ùTvvv›6m\r\Z”‘‘qüøñ¸¸¸ƒ¾öÚk’ubbbnÓ8µäëÿGæ¿şë¿T±<‘B ;şO](a·ÛÇşıû%6Ì½½C‡îöÊ•+»wï.İÌŸÈ„„„L<Y¾Ğ|6<<üÿø‡Óø´i~~ş;ï¼#)Äıã˜E‹mß¾İıéÔyóæ}õÕWÏ=÷Ü’%KæÎ{»F©£Ğ¢	¤fÍšüŸº7D\n®DJùğ©Dˆ ¸i‡ªW¯iÓ¦íØ±ãoûÛ»EZ·n-Ûµk7aÂó£¦îO#.\\¸ğ¯ıkTTTnnnƒ\ròòòRSSÛ´iã4~æÌ™3ò%édİºufÿ={VÒÉÉ“\'333›7o.ki›=/deeU­ZÕLÓ§¿_.)DöcîPö`ÿ•))p¹ægDJ™ø,n…Ãáp¿¥!cøğáç‹ôîİ[6şôÓOp÷şùçİmÉÒ-66vÎœ9			õë×ÏÈÈíÃ†\rËÏÏoÙ²¥äs‹èŞ½û‰\'–,Y\"ùæı÷ßŸ1c†¬¥½hÑ¢Û7ZıÌœ9Ó\rwß}÷æÍ[n1‚Èîºë.s‡²gÕƒ+g¤ ÷Üİs!‚à6pà´$wš¹¦Ó§Oû\"¸\ròòòÜ8¤jÕªIÉ‡o:‚È×ºßY©[·n±_\0¤àŠ²\"€kÊÈÈpÿU‰7÷ˆ|•;‚ÈŞÜoqRpïƒ@)¢££+Uªdfˆ»îºkúô÷½ÿ°ªô”şîÄÈ~doªä¤ 8o‚À\rItp¿#\"~øáÅK––şwDäYéãşó]@ NRpM¥\"\0/eddÔ­[×óÉÜÒ¡C‡¯/‰IK?qñÒeYK[¶Èv÷Ÿ&s$ ãF\n®ízA„ LòòòfÎœéş„‡—¤¿|Uà}µRp]%ƒÀÍÉÊÊ\n\r\ruÿeÕRHé`äzH!@i<ƒÀ­Û³gÏØ±c›6múÔSOU¯^ıî»ï–µ´e‹l—gUàmE\nnÀ\"+V®$‚\0@ù\"…\07)DÖª\0\n)\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )äÿ·[Ç\0\0\0\0ƒü­‡±§(\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xX\0ğx8UBÀ§N¨\0\0\0\0IEND®B`‚',0),('6',1,'leave-jpa.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/activiti/leave-jpa\">\n  <process id=\"leave-jpa\" name=\"è¯·å‡æµç¨‹-JPA\" isExecutable=\"true\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º-JPAï¼ŒæŠŠå˜é‡ä¿å­˜åœ¨ç‹¬ç«‹çš„è¡¨ä¸­</documentation>\n    <extensionElements>\n      <activiti:executionListener event=\"start\" expression=\"${execution.setVariable(\'leave\', leaveEntityManager.newLeave(execution))}\"></activiti:executionListener>\n      <activiti:executionListener event=\"end\" delegateExpression=\"${leaveProcessEndListener}\"></activiti:executionListener>\n    </extensionElements>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\">\n      <extensionElements>\n        <activiti:formProperty id=\"leaveType\" name=\"è¯·å‡ç±»å‹\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"å…¬ä¼‘\" name=\"å…¬ä¼‘\"></activiti:value>\n          <activiti:value id=\"ç—…å‡\" name=\"ç—…å‡\"></activiti:value>\n          <activiti:value id=\"è°ƒä¼‘\" name=\"è°ƒä¼‘\"></activiti:value>\n          <activiti:value id=\"äº‹å‡\" name=\"äº‹å‡\"></activiti:value>\n          <activiti:value id=\"å©šå‡\" name=\"å©šå‡\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"startTime\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"endTime\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\">\n      <extensionElements>\n        <activiti:formProperty id=\"leaveType\" name=\"è¯·å‡ç±»å‹\" type=\"string\" expression=\"${leave.leaveType}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"startTime\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" expression=\"${leave.startTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endTime\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" expression=\"${leave.endTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" expression=\"${leave.reason}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"deptLeaderApproved\" name=\"å®¡æ‰¹æ„è§\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"åŒæ„\"></activiti:value>\n          <activiti:value id=\"false\" name=\"æ‹’ç»\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${leave.userId}\">\n      <extensionElements>\n        <activiti:formProperty id=\"leaveType\" name=\"è¯·å‡ç±»å‹\" type=\"string\" expression=\"${leave.leaveType}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"startTime\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" expression=\"${leave.startTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endTime\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" expression=\"${leave.endTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" expression=\"${leave.reason}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reApply\" name=\"é‡æ–°ç”³è¯·\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"é‡æ–°ç”³è¯·\"></activiti:value>\n          <activiti:value id=\"false\" name=\"å–æ¶ˆç”³è¯·\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\">\n      <extensionElements>\n        <activiti:formProperty id=\"leaveType\" name=\"è¯·å‡ç±»å‹\" type=\"string\" expression=\"${leave.leaveType}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"startTime\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" expression=\"${leave.startTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endTime\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" expression=\"${leave.endTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" expression=\"${leave.reason}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"hrApproved\" name=\"å®¡æ‰¹æ„è§\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"åŒæ„\"></activiti:value>\n          <activiti:value id=\"false\" name=\"æ‹’ç»\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${leave.userId}\">\n      <extensionElements>\n        <activiti:formProperty id=\"leaveType\" name=\"è¯·å‡ç±»å‹\" type=\"string\" expression=\"${leave.leaveType}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"startTime\" name=\"è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" expression=\"${leave.startTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"endTime\" name=\"è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" expression=\"${leave.endTime}\" datePattern=\"yyyy-MM-dd\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"reason\" name=\"è¯·å‡åŸå› \" type=\"string\" expression=\"${leave.reason}\" writable=\"false\"></activiti:formProperty>\n        <activiti:formProperty id=\"realityStartTime\" name=\"ï¼ˆå®é™…ï¼‰è¯·å‡å¼€å§‹æ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"realityEndTime\" name=\"ï¼ˆå®é™…ï¼‰è¯·å‡ç»“æŸæ—¥æœŸ\" type=\"date\" datePattern=\"yyyy-MM-dd\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reportBackDate\" name=\"é”€å‡æ—¥æœŸ\" type=\"date\" default=\"${leave.endTime}\" datePattern=\"yyyy-MM-dd\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"æ‹’ç»\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"é”€å‡\" sourceRef=\"reportBack\" targetRef=\"endevent1\">\n      <extensionElements>\n        <activiti:executionListener event=\"take\" expression=\"${leave.setReportBackDate(reportBackDate)}\"></activiti:executionListener>\n        <activiti:executionListener event=\"take\" expression=\"${leave.setRealityStartTime(realityStartTime)}\"></activiti:executionListener>\n        <activiti:executionListener event=\"take\" expression=\"${leave.setRealityEndTime(realityEndTime)}\"></activiti:executionListener>\n      </extensionElements>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"æ‹’ç»\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <extensionElements>\n        <activiti:executionListener event=\"take\" expression=\"${execution.setVariable(\'result\', \'canceled\')}\"></activiti:executionListener>\n      </extensionElements>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <textAnnotation id=\"textannotation1\" textFormat=\"text/plain\">\n      <text>è¯·æ±‚è¢«é©³å›åå‘˜å·¥å¯ä»¥é€‰æ‹©ç»§ç»­ç”³è¯·ï¼Œæˆ–è€…å–æ¶ˆæœ¬æ¬¡ç”³è¯·</text>\n    </textAnnotation>\n    <association id=\"association1\" sourceRef=\"modifyApply\" targetRef=\"textannotation1\"></association>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave-jpa\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave-jpa\" id=\"BPMNPlane_leave-jpa\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"30.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"27.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"108.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"27.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"223.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"textannotation1\" id=\"BPMNShape_textannotation1\">\n        <omgdc:Bounds height=\"57.0\" width=\"120.0\" x=\"361.0\" y=\"174.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"47.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"47.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"47.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"47.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"108.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"22.0\" x=\"280.0\" y=\"67.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"47.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"47.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"22.0\" x=\"300.0\" y=\"30.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"47.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"47.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"47.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"47.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"22.0\" x=\"534.0\" y=\"30.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"75.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"223.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"22.0\" x=\"652.0\" y=\"75.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"22.0\" x=\"525.0\" y=\"67.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"240.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"239.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"75.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"44.0\" x=\"186.0\" y=\"221.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"163.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"220.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"240.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"240.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"11.0\" width=\"44.0\" x=\"300.0\" y=\"223.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"association1\" id=\"BPMNEdge_association1\">\n        <omgdi:waypoint x=\"323.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"421.0\" y=\"174.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7',1,'countersign.form','1','<table border=\"1\">\n	<tr>\n		<td width=\"100\">æŠ•ç¥¨æ¯”ä¾‹ï¼š</td>\n		<td>${rate}</td>\n	</tr>\n	<tr>\n		<td>å‘é€è‡³ï¼š</td>\n		<td>${incept}</td>\n	</tr>\n	<tr>\n		<td>å‘æ–‡å†…å®¹ï¼š</td>\n		<td>${content}</td>\n	</tr>\n	<tr>\n		<td>ä¼šç­¾å‚ä¸äººï¼š</td>\n		<td>${countersignUsers}</td>\n	</tr>\n</table>',0),('8',1,'dept-leader-audit.form','1','<table class=\'view-info\'>\n	<tr>\n		<td width=\"100\" class=\"label\">ç”³è¯·äººï¼š</td>\n		<td name=\"userId\">${applyUserId}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">å‡ç§ï¼š</td>\n		<td name=\"leaveType\">${leaveType}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">å¼€å§‹</font>æ—¶é—´ï¼š</td>\n		<td name=\"startTime\">${startTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡<font color=\"red\">ç»“æŸ</font>æ—¶é—´ï¼š</td>\n		<td name=\"endTime\">${endTime}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">è¯·å‡äº‹ç”±ï¼š</td>\n		<td name=\"reason\">${reason}</td>\n	</tr>\n	<tr>\n		<td class=\"label\">æ˜¯å¦åŒæ„ç”³è¯·ï¼š</td>\n		<td>\n			<select id=\"deptLeaderPass\" name=\"fp_deptLeaderPass\">\n				<option value=\"true\">åŒæ„</option>\n				<option value=\"false\">é©³å›</option>\n			</select>\n		</td>\n	</tr>\n	<tr id=\"leaderBackReasonTr\">\n		<td class=\"label\">é©³å›ç†ç”±ï¼š</td>\n		<td>\n			<textarea id=\"leaderBackReason\" name=\"fp_leaderBackReason\"></textarea>\n		</td>\n	</tr>\n</table>',0),('9',1,'leave-dynamic-from.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0×\0\0E\0\0\0™BLB\0\0T_IDATxœìİ	xUºÿq—áŸ™+Ì…QÇ{GæŞqñªwQPFÙ‘E6Aö}MØ’°Ë\"\nn#›Ã&ˆÀ„-	IXÂ’ !b€,İş¿]•4M¡iNWŸïç©§ÓÕ\'•:UoşÑé„\nN\0\0\0*¨>\0\0\0 )R\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …\0\0\05H!\0\0@\rR\0\0Pƒ\0\0Ô …Ü@ttôèÑ£k×®}ß}÷İqÇt%c—3 çAÎ†œÕ—~„{ÄÄ=b-Ô­Iyİ’B®+))©E‹?üğğáÃwîŒ:–—oË·Éb7wãšKn·vÿ¼ü|9r†É9iŞ¼ybb¢êKÅ¸G¸G¬ˆºõ«º%…\\Ûîİ»+Uª4yòäË99RŸÆs­m6³X¯±Øìîv€÷—s2eÊ”jÕª­[·Nõ…‚2Ü#Ü#VDİú[İ’B®A.@…\n\"##«•o¤d×%+jk»-ÿê-‹ı7lÜ gIniÕ—\nppXuë‡uK\n).))é÷¿ÿıÆëómy6[^¾-W³Qì¡«ƒ=ÏìænhÕ?2rË¯ıkŞvÖ\r÷÷ˆQ·şY·¤âZ´h1yò$ãòÈµÉq5ì¹E¬°]´%ÇÜ^ØMËşS¦LnözSÕ\r·÷÷ˆQ·şY·¤«ÄÄÄ<ôĞC9¹å\ZØdq]!YçäµÍÅf®íîF®¶ı/çd×¬ù¿ îî+¢nı¶nI!W				¶Ù.Wë²,õşŞØËßw2û»®_Ñ—_iØf{çş PĞÑ£G«¾t¸M¸G¸G¬ˆºõÛº%…\\¥víÚ;vDæÛ.WåÒ‹/7üÑé<îp¶9æ9÷æ9c³í3Vş°!ãBL¾3:Ç“ãÜvÉ¹1×ùá¶„î=z\Z—ğ²ûË=ÛæÃ+m[áSĞçÎ­O>ù„êKç[‘‘‘ÿñÿ±eËÕ¢÷Hàİ#:”7uë·uK\n¹JõêÕ?b³_2IÁÙNçÅç»óç|ç%§sÈ¨°\nólÃæ6gz3=×y,ÇyÄî\\¶s¯t¶¹®âEók]\r›±Û%³‘ï~X´ÿÀèŸ–rï½÷ª¾t>$³óï~÷»+WÊL½yófÕ‡£÷H€İ#š”7uë·u[)dÏ=cÆŒiÒ¤I:uî»ï¾»îºKÖÒnÜ¸±l—goı[Ü6wÜqG^~¶Íu‘.Ê5â»äpæ9\\OÙ\\ëo¾[ÍGGOœnw:±;/Øœ?ÛœçÎ»ö¹*Õn\\f×Å¾h\\òÂı>ôlm€şùùÙ+VT{á|Çœ£#\"~È·Ùøa“fê”””;vìÚµ+...Ş•œœ\\¬§<Vîà=î‘@ºGÊ«¼ı¿€©[¿­Û›O!.\\1bÄƒ>X³fÍ¡C‡®]»6**úxZznë±I{õš5²]ıãÿ(=¥9·™÷›]Š5[Öòğ¢İyö²3ßQØáüùó|<kÂ{§Ÿ<%mÎ|£‚wÄí-üZãwR²áêpeÿÓ_Æ®î¢ùçm.>\n\"Ã‡Ÿ5kÖê«Í™3§_¿~î#9rd—.]Ş{ï=iLš4©Q£FÁÁÁ·ÿ3Ü#s”cyûS·~[·7ó\rrrrfÌ˜Q­Zµ={îÙ»ï:öÊ²w_B·îİ¥ÿ| _[îc(GFæ•³Ÿe®]•êpştÉy:Ûis:óóòş\\«V…\nwT¨PéÍ·:y~alüî+_[x9İûñhØ=·gL?œao]É9Ú=SËöòı!ºÌË[·n•‰{ıúõ7n”µ´·mÛ6lØ0y633Sş¹ÿşÖ­[Ë÷MLLœ2eŠÌãØ³gÏ¹sçÊñHnˆ{$0î‘ò-oÿ/`êÖoë¶Ìß ##£nİºMš4‘lqÃüQ,‹4nÜäé§Ÿ–=øb$åÂ¨¶,ãìËeÈ2ßµ“¼|òç™\\gìÔ{ï½÷;ïş÷TmÛîªJİ/í®™e·gyîÄn/lÈÚìàñT€ô÷·öÖ]o6Ù^¾Ÿæ“I<&&&**J&å}ûöÉZÆÆÆÊ?ÆÛİK–,3fŒü‹sti;vñâÅiiiåuŞà	€{¤ÜËÛÿ˜ºõÛº-Û7HOO¯V­Ú{ï½W¦üá¹L<¥zõê~û«óÆ;o\\Ã~Á¼\0—œ?ç¸òòO¹Îˆ]‰=ñTÕj¿¿§r•Y—å:ÙyÎKy®/Üµ«ğk]_^¸6.ù•-Æ%¿à¹ÿ€éïW3ì­+}öE‘I<55uéÒ¥£F\n“9zùòåÇ7\'qS»ví6zn¶oß¾\\¾{™pXıñEyûS·~[·eøä€¤¶n:‚˜ËŠ•+e?h|7ª›fTÛy»ëÂœ—Å¼\0R¬lÎsù’šm;=Q§îK¯¼v&Ïy:Çy&Çy6Ï)µº-Æ¨T»y]‹qu]Ù×6ÏÆş¦¿ÿÌ°·Î›9ºÜƒˆ9‰<833Ói|èjèĞ¡%\'ñw=Lš4©cÇ·ş­ËŠ{ÄÒ÷ˆÊÛÿ˜ºõÛºõödddT¯^}õêÕ·AÌeÉÒ¥ÕªUóÃÍÕvŞ¸6r%Î½Pï…}‡Ç&$FíIÜŸ¸}wò})›bîL8\ZŸ¼5>iûî¤¨½É	‡Ó>ıù›­Z™_e3×¶óvÑÃ¢ıL?™ao÷stùs\n\n*e0`À„	Ü“øøñãeÒ¿Åï{¸G¬{ø®¼ı¿€©[¿­[¯¾ANNNİºuoå1%—É“§<ıôÓşöaUãçrÎ—A®Á¹¾}{zóÇõŞx£¥Ùß^´Ø<öãÙ(¶ÿÀèï3ì­+ë]AÄœÄçÍ›7nÜ8s‚?¾ç$¾jÕªĞĞĞÜÜÜ={šo%Ê³IIIå0ò²à±è=âÓòöÿ¦nı¶n½ú3fÌhÒ¤I9FsiÜ¸É|àë–‰Q©?Ûìgí®åg³m³¹ÚÆÚÜX¸ÅÕ0¶Ğ_ù{ëJÎÑ§ÏüTJõz>{ëAD¦ã”””be‚1b„ÙîĞ¡Crr²ùöÙ³gÃÃÃçÎñê«¯<yò¦¿ïMà±â=âëòöÿ¦nı¶noü\r²²²ªV­ZÖßˆñf‘}ÊıêïˆïÚe\Z—A®J¦ÍVØvoñ|h\\ÂLúËbõRr	\r½ÿşû%&]³te»<+}Ê+ˆ2$!!Ás‹LßõêÕ3ÿrCFFÆ\'Ÿ|\"\rIí}úô‘w6¬sçÎ—/_>uê”Íf»åPÜ#–»GnCyûS·~[·7şR1={ö,÷b.İºww‡e`äåÌk.6wÃví:÷·t\n¹æm¾{Í™Úœ£ÍåD¬‚{ÄZ÷åm¢nı¶noü\rşøÇ?úâ÷Û!<ğ€¯é=£R²Ù~’µ«a7™öÂ†»yU7íû[7…”2G_s¦öœ£o¦ö÷ˆ…îÊÛºõÛº½Á7Ø³gOÍš5}AÌå¡‡òŸÿkÆ¨Ô3ÆÙ?St©Î—Ä½ñÌ5;hŞß¢)äš?,/6{ÎÔ%çhóÙòıŒˆŸã±Ê=By{¢nı¶noğ\rÆŒ3tèPŸ¦AƒËwñõ8İl6ÛÔ©S,X`şFY1E•j.§Åóá™ËiúËâW)¤ôKìv½_¸Ş\\¾~C)3¸çbİ™ÚÄ=âÏ÷å}=Ô­?×m)nğ\rš4i²víZŸ¦ÕkÖ4nÜØ×ãt[iüÍ4qçw<8//ÏóY£RO]w£äâzÊá(ÖMßş~•BJ¿Ä¦Òkñš3uÅŠ½™£ı|¦ö÷ˆ?ß#”÷õP·ş\\·¥¸Á7xê©§vîŒòi\n‰ŠŠ®]»¶¯Çé–••å¾ß¤Q¥J•5kÖ¸Ÿ5*õG¹Ç)‡ëJüh.ò°xÃx¶¨îıı*…”~‰Şıá„kÎÔ^ÎÑş<S{ƒ{ÄŸïÊûz¨[®ÛRÜàT¯^ıØñ4Ÿ¦ãié÷Ş{¯¯Çé©–ëÿN¼B‚ó³Ï>kşJF¥4Î¾¬O:\\—êG÷‡Çvs£»¡y¿J!ÎR/±÷»©”™ú†s´ßÎÔ^âñç{„ò¾êÖŸëöznğ\rîºë®Ü¼|Ÿ¦Ù¿ÔÊØ±cK	æ·“ë8ÌËp²ğz”xè¸²=ƒşòPÎ›ÿ\\ÁÒ•éÏG†¯ßPòjÙ\"Û½ÜÃ?l’™Ú*\'ÇK–¨Ië_á¶Ü#”w),Q\'şÖ¿‚òï…T®\\Ù,ÊJ•*µoßş¡‡jÑ¢…;/;r12\n×®S¸Ûâ(ZÓ_–ÛP©eRÊ%ŒŒ”™úûˆˆVf@şcÑKÜ#ş|PŞ×Cİúsİ^vŸÙ³gY¦\r6|å•WjÖ¬î~ÖU©övc‘†\\÷ºp£Ã¼HÒ(zèÑÿÂ…¤Áƒº›33÷\'%m=z4:1qkvöaéúô¾Ö­›?wÈfKÏÈˆÏü)áçŸÊúìÙîÈööíßÆÎßlÜ¸tóæ›7-—F|üésğà–Q#û‡…\r3fˆ,Ò\r4ujHÉãùöÛ/§M)yügÎ$tìø¦4¾ùfÁ¡C‘ò”ìGïæÆëîïW)¤ôKìôn¦Èœ{É§÷ˆ÷ı{ôè›s´”ş/¾ø\\)ûÿÎ¸Jîßuth)5k$İ/)÷ã÷Ñ=By_ŸÔíõú÷îİI^.]JIIÙ!ÿş÷s.§9²Ãõê`ôìÕ³cDÄ¿vîøF&Ù.sşŞ½ß8°ÙGÇã?sûGæërút¯·Èş5º}¿#!§µnİº÷ÜsÏÄ‰¯õ9êt¹*Âk“îzX¸>al/luK7v[zíGìÿÊ+/HPèÙ³ã?ş1¹}ûÓ§‡>öØŸ/º^æÓssÆD¯•¹5\'\'µ¿.ÁÁ½GŒè×¯_)>÷ş‡\ríÙ®]‹cG£¥W®œÛ°áK—şcÅŠ9;¶¯‘g7lXüñÇóóååËÏ;Ÿ\\Úo¾ÙØ<“\'ãë×ÿë€]‡\rëÔ»yóWƒ‚zK{Èàîõê={2#^ö`Ë?.û—ş£GHMİ)Çß¦M³›o±ş~•BJ¿Ä¦Ògê@ı%/ùè)kÿ^x¶Xÿƒ6·lÙHî—!CzŒŞ·V­šÃ‡÷‘ò–ÛM¶\'\'m½rídÜr—\rë5Ø¸22â®Ü!£Ê-`7o¿îÊûzü¤n¯Ù?33á/ydáÂ™?D,kÒäåŸ>ğÆ¯É+‚”èı›\\eiKkÚô•õá‹¤¶—/›3rd¿•+æ~õÕ\'oµmî‹ãñ«¹ıß`ìØ±\ròi\n4xpHh¨¯Çéiİºu³fÍ:{ölÉ§Œ¼œæp¤Ùem4\n×v±uQÿô´˜9s¦ÊÃ¹s§}ûí‚µkç/ZôÑùóztogöìß¿ËîøğbûÏ8±K¶›ûø~ÉÄ‰ÁYÉ”º+æÛ½{74múrÂ¾ïwï¿|Yş­–¶qãW\r\Z<?dH÷Âep÷AƒºJ\nÉÏ?*Ï¦§ÇôëÛÙ½ÿ.[»³k×¶òì7k¾ôÄÿ3ztÿ°ĞA©©ÛåÙ¶®\"_»«¬ãõÜîW)ÄYê%v“™ºJ•*ZıAïùè)SÿÆ”ìŸœ9pà;Ó¦1cŒT²¤üÉ“GÒÃ}öë×Ùİ¿K—Öî=¸n´˜o¾ùB*ß¼BåHÙ.Ïš·À‰»Ê÷ø}wPŞ×ãu{Íş…—/ŸµsMJÊ¶Ø]ßîØñµLò’9¶n]aö—¹]^)6mú×‚œ;·ô¨şæzôhç‹ãñ«¹¿z£R»‡¹N+|X´Ñ~¥ízÊã¡k\Z:ğ—¬CowzÓ–tí7_,Zôá‡Û²y™Ù_BƒñÂÕş])Ä5oß¾meÛ¶Í¤W­œ“ùÓŞ+f¿öÚK_~9S–F^JK‹’>ß¿xæÌ±%§SÇ–‡o•†—®ï´Ü{äÈ¾şóÃ²–vç·[%ìÛ(‡”•u0;;Iïç³û$,YòÉöí«Z·j\"z«VOfì*ëxİıı-…x‰?.ynññ²ÿÅì¤Çÿï’ıãâ¾íÖí­È-Ëe©WïYYoÙ²¼aÃÜûß·ocá-0¢ğvß¶cY<orÈëAá-ğ¦y”ÏñûÃ=By{º=u{ÍşñqßıÏÿüI^ÆŒ,ó|óæİ¿uë¦a¡_yåo¿ürHúHæv¥–6n\\ØĞòÚ  ^RÃİ»½UîÇãou«øÿ‘Ù³wŸìß×ƒô«Ræe8æp3ÖÇ]Â-EÛ=Æ²5ryÏí‚†õ>¼w¿~o÷êÕ¡oŸN’BŞjÛ,)i“ÙÈnGn/¶ÿŒŒ]ıûw–-)G¶:\'[fÍz×f;šv|çĞ¡İ#\"ıõÜaÃz¤K\nq“Y²S§–Ò_¾E¿¾oËZ&ÜZÈjî06öÛqã†šûoÛ¶©yÌÒíøñîãûí–+WÎÜköìÉ6,’¢ß±cUYÇ[¬¿ESˆ“ÿh£ìnú)S©ü?ı©Fdä²bıcb¾™7ošğ7ß|ñÿ÷ÔªU³¿úê£O?˜XxìZkÜ®şmÛ45¿Êãpmûí7¯ÜëÿYx”ëñûÉ=By»İº½^ÿ3gv¿İ©å¡CçÎ%4múrNNrNÎaYš5{Ån;ºxñGcÆêÑ£İ¦MKä¢Òÿ§ŸöNŞ’šº-)i³-?µÜÇ¯êÖ«ÿS·[÷î>J!²ç à`_Ò{F¥Ê8*ëÇ±Â¶ñĞ£q¬Ä×zïu3f„}òÉxYïÜ¹jí7Ÿ/Z4óüù„-ş›“,†îv4u[±ıgœˆîßïmsãÀ]$põzğÁû×¯ÿrènë¾[°|ùgÃ†vOO:‘µ}ûÊø¸oåíİîZïY7}zˆìvçUÒAö»ë›_|64¤hè€¿üåYK»nİÇÍgeÓ¦ªYó??ÿ|Ú¨Q}SS¶ÊF#¬ÜÌx=û[7…8ùOGËèVîïûwéÜjÿşmÚ4±ÙR=û‡¯[(±cù²ÏV­œıÜsuV=G–Ö­›9¼ÅÜlìÚ«n£áºÒvJãé¾ÌûÑVÊûøıç¡¼M·§n¯Ùÿò¥ÄI“‚şú×º\'}»ö‹^xfÂ„¡Æ2ì¿ÿûaé`·¥Ê+EîomúaIÃ†/ôéİqÎœÉ\r\Züuşüé/¼ğ¿å~<şV·7şYYYU«VõÅÛ!²OÙó…|=HïïÚIğ<ZxUÌ¶ãh±6®Ñ¶»·¤ºûË¼¶`Áôôô6|9ı½Qk×ºRˆ<õÉÇãÖ‡/”ş®÷BR·ÛFFtÿşo{îİwó?ıtÂ\'c†í6wî”ÛWÖ=íø„}ëgÍš4yòğñã‡,˜?}¾±È×víÚföìw÷\'¬—¯İµfÜ¸Áæ®Œ¹Õõ½úõët\"]¦à£[#—…‡/ìÒ¥•<6 Õ8ãß‹73^Ïş–N!ÎëÌÔ¥|:Ïœ©iöŞ­Ü#^öß¾mù AïÈ–5«ç3Ğİÿ›oæ…Œî7uêÈ÷¦”0ñØcf4^~ù¯t–ùİâr1û%l×- )D¶lİº,|İ‚.ß”a¡Œ êêV®Çïo÷åí¼-u{½ş6[Ê¡ƒ;¶Ø»ç;ÉÁ¯¼òü·ß~ñíÚÏe‘$möÏşå@omÚ´dá‚÷ÍÈÃÄCR¥å~<şV·^}ƒ3f4jÔ¸ÜSˆìsúô÷}=Â21ò²œıÔcíZ\n¯ÇÚã¡»›4¾øbÚ·ß~.Û÷ìşnúôÑk¿™·hÑ™ßjÛl×®Õ²}È®Çn-¶ÿŒQÆ{!®®XñÏ>›Ø±C»=åÌéX‰ÃòoÁ¸¸oæÏïÌé]fÿÔ”È×^{qãÆ/ÍXµr–<ë>¨+ëÕ{&4Tşı×ßx/¤¿ñ^ÈcGlv¶1§º¦àÔÈŸÏî6¦àÔœË‡~ùe™Æëy~¬Bœ×ù!z)Õ?,¿	·rxÓÏîo›6m}Àì?jT	Ùî~8fäˆŞò/K	?şç÷ßıÁû£eZ?vl›Ù§y„\\÷n]º·€+ˆG•[ÀÈë—åÈºÆ-PÖã÷Ï{„òöuİŞ°ŸŞÎı¼÷èÑ­¯¾Z/&æë]1_ËZjÕì/o¼²X¦÷aC»Ë«ÉıjÕzHêÓGÇã?uëÕ7ÈÉÉ©óÔSS¦L-Ç\"{“}ş’}Ñ×#,£RSöY».†»áH1³]¸Å^¸Ñl|>oÊ[m›††ö“;uêğ5kæH\n6`İº/Ìşƒ½sôhd±ıŸ8±£ÿ·İûŸëJÉJÈÉ94p@çğğùÓ¦éÒf;ì>Ë—õîİ>//IÚË—}:ş4÷ñœ>sèĞF³Û›o¾f6RS¶dgïwçÎ-e=xğ;w‚ƒ{H7»íÈ¦M_M?¤Lãõ<?Bœeùë×K`ÌÑŞ»•{¤ôşvû‘Ù³\'5jôâ¹s{Üİ¤8ß~û~rGëß¼ù+f·mÛş•ùSœ¹ñô)×-`öqİÆÆ””Í³¸Cni¸n-‚ƒz˜wŠÜãÇ¾•ã÷ó{Dóòö]İzÙ¿C‡æ¯¿şÊ?¿ü@Öîş®¶ÑíÜÏ{zôhûCÄ¢ä_•)¿ü’Ğ©Ó½zµ4¨Knn¢/ÇêÖÛo‘‘QµjÕ%K—–KY±rå}÷İwìxšOÇvŒJ•×û#»kín®FñE¿];7v××ÒøñäÎˆï¿\\ôÏ÷-úÀ³÷îmİâùåk¿™óâ‹Ï,˜?ÍsÿQQË—.ùğÕW_ˆZaîù²çÌ™TìxNıõÌ3O>ùäïŞ½æšÇS¿şsÅÿ—_öııïûè£0iÔeÂ:iüóŸïwíÚªWÏ·ä°Ë4^ÏãQ>Ã–—²ÎÔ3G{ïVî‘Òûo\\Ô=/÷P±şv[ò˜°şÛ·ıËİÿ“OÆÖ«÷¿aaıKß¿ÜÅ\'ûF·À­¿ÿß#:—·ïêÖ›şvûá.[?)í-\ZÊ:?/±cÇæO?ı¸Ù!íøÖİÛ®şzÖüùS7ı°èµ×êíÙıìğ‹Ï§,û×Çå~<~U·eøéé®?`\"â#ˆDÙÏöí;|7ª›&Vàº®Åá0/RÑÚ~e{É%ûçæÌÏ;äÙÿÒÅ™O=ûçæ´å\'^sÿ99Jß¿1¥î-åx‰¸•ã/S˜aË‹÷3u ÍÑŞ+Ç{ä¦û_¼˜ wÓ\rû9q{ÇB÷ˆ¶åíu[JÿüüÄ¬»Í§lùI{²>u[¶o}ß}÷İÊfäk«V­šzô˜OFsËŒO0%;RÉF’ëÂ>‡=ÚZ÷÷“¶¼x3SØí=î«ß#z–7uë·u[æo‘‘Qç©§\Z5j\\Ößš‘şòUòµ~øƒ7#/\'‹y$“>t7ÜW?Ô¹¿ÿÌ°å¥ô™:ğæhïqÀ=¢ayS·~[·7ó\rrrr¦O_Ê´[÷îŞdé#=¥¿|•¿}µãg‡‰Æ•H,j$™bÛ‹=«y¿šaËËõfê€œ£½Ç=÷ˆnåMİúmİŞü7ÈÊÊ\Z9rä<ğĞC\r4èëÕ«wîŒ:v<-7/_ÖÒ–-ƒ–g¥OğğáÒ¿ÛGŒ¼œèıâp¢ÿÍ°å¥äL¨s´÷¸GæÑª¼©[¿­Ûrø{öì;v¬ë§-uêÜwß}wŞy§¬¥-[BBCıçÿˆñÆwÜá°,p]CGaÃ½¸·”|JçşrÆ*V¬¨úÒùŠçLÀs´÷¸GéÑ§¼©[¿­[¿‹çjU¯^ıDú¦Çsq4\ZåÀÕíƒEjŞ?ãÄæ{ï­ªúÒù9S¯X¹2€çhïqØ=¢IyS·~[·¤«Ô®];&z‰ûJ8ö{,raÜ]kç•Z÷—3öä“V}é|+22RæhY«>õ¸GïéÜ¹sÀ—7uë·uK\n¹JHHHPPg\\€÷5sÊRày	‹=LĞ¼ÿğàwFê®úÒùÜØ±cU‚_à	¼{Ä?³Rî¨[¿­ÛÀ/¾2‰‰‰©Qãü¼İN×•K’`\\’ÂÅóañ§tí/çªfÍ?Fí\\¤úÒùœ3µ7¸GïÑ¡¶©[¿­ÛÀ/¾²jÑ¢Å´©ƒûœ}®u«a\\§¢-ÆÆ‚ÂgŒeŸ¶ıå\\µh^_õE»t˜©½Ä=`÷ˆ&µMİúgİjQ|e’””ôë_ß½cÛ×5s]’½²8µ«áŞrå©}f\rûÿ1§Zµ*‡~­ú¢İšÌÔŞà)ë=’xhµê‹V\ZMj›ºõÏ¹]‹â+«İ»wËmñıìÇgyU\\‹ë¡£¨Q´Ål›\r­úoß6_ÎÒºï>Q}¹nMfj/qÒ=¢OmS·~X·º_Y­[·î÷ÕªL›:Ğ–·«À±ÛY°Û\\;»¯zhl¹ªQ¬C ö·åï’3Sé×wï_¬úBİ>úÌÔ^â	˜{D«Ú¦nı­n5*¾²JJJjŞü¥‡jü!8èí]Ñ_f¤‡8âŒKo®¤áj_İ((|ÖéÙ¶~ÿ{Ü‰ôğ˜¨…ÁAjÔøC‹æ/%%®T}‰n+­fj/qÆ=¢[mS·~U·zßMˆ‰‰	İõÉ\'kU¿¯ê+VĞ•Œ]Î@í\'kÉÙˆ‰^¨ú²(PA³™Ú{Ü#&ëŞ#´¬mêÖ¤¼nu,>‹âïU¨UAË™\Z: ¶ÕÒ|n§ø¬áóÏ?—™\"--Mõè‹™\ZŠÚVKóó¯õà­\"\'\'çßşíß¤R›6mªúXô¥ùL\0Fm«¥ùù×zğVÑ¾}{óxUªT	W}8šÒ|¦@\0£¶ÕÒüük=xKHLLüÕ¯~e¦»îºëÁÌËËS}P:Ò|¦@\0£¶ÕÒüük=xK¨U«–çç™ï»ï¾	&¨>(i>S €QÛji~şµ¼ÿ3ÿÒ_1¿ıío333Ušv4Ÿ)À¨mµ4?ÿZŞÿMœ8Q\nô±ÇkĞ 4xàY?úè£Ÿ}ö™êCÓæ3µ­–æç_ëÁû¿ˆˆ)Ğÿ÷7? *ëßüæ7ÒX·nêCÓæ3µ­–æç_ëÁ[BLLLVV–³¨R¥½yófÅÇ¤%Íg\n0j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µüêW¿R}ZÓ|¦@\0£¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*wëç?%%eÇ»víŠ‹‹‹7ÄÆÆFEE%\'\'ë)O………İâ·¼ÄÜ¢–æç_ëÁ[‹æ•ª\\éç?;;»iÓ¦]ºtéÕ«WŸ>}^ıõ6mÚôîİ»[·n­[·^³fô>|ø¬Y³V_mÎœ9ıúõ3w²eË–‘#GÊNŞ{ï=iLš4©Q£FÁÁÁÑÑÑ·c„Ğs‹ZšŸ­o-šWªrŞŸÿ‚‚‚çŸşüùóÅ¶K°Øºu«$õë×oÜ¸QÖÒŞ¶mÛ°aÃäÙÌÌÌøøøıû÷Kj‘8’˜˜8eÊ	\"Ø³gÏ¹sçÊy<@æµ4?ÿZŞZ4¯Tå¼?ÿ&LøÃş•••à¹]RHLLLTT”¤Š}ûöÉZÆÆÆ;Ÿ×,Y²dÌ˜1Ã‡]DÚcÇ]¼xqZZZù	00·¨¥ùù×zğÖ¢y¥*çåùŸ6mZŸ>}Z´hqæÌ™^x!\"\"Âı”¤ÔÔÔ¥K—\Z5*,,LBÆòåË?n¦S»ví6zX¿~}ûöíË0€æµ4?ÿZŞZ4¯Tånxş%O4kÖL\"EAA¤Ù’••U¿~}If3…<833S^¸paèĞ¡%SÈ»&MšÔ±cGŸ	panQKóó¯õà­EóJU®ôóŸ––öÈ#¬]»Ö|h¦qîÜ¹ºuëfdd8‹RHPPP))dÀ€&Lp§ñãÇKjñÕ\0s‹ZšŸ­o-šWªr7<ÿùùùî¶;…ˆ‹/š\r3…Ì›7oÜ¸qfÂ˜?¾g\nIOO_µjUhhhnnnÏ=å¡l”g“’’Êy0€æµ4?ÿZŞZ4¯TåÊtş_ıõ’%O¤¤¤Û(	cÄˆf»C‡ÉÉÉæ`Î=>wîÜˆˆˆW_}õäÉ“7{àÀ\r0·¨¥ùù×zğÖ¢y¥*W¦óÿÜsÏ•Ü8dÈb¿5#ù£^½z›7o–vFFÆ\'Ÿ|\">ø OŸ>#G6lXçÎ/_¾|êÔ)›ÍvKG\\s‹ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*ÇùG ¢¶ÕÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µh^©Êqş¨¨mµ4?ÿZŞZ4¯Tå8ÿTÔ¶ZšŸ­o-šWªrœ*j[-ÍÏ¿Öƒ·Í+U9Î?µ­–æç_ëÁ[‹æ•ªçŠÚVKóó¯õà­EóJUó@Em«¥ùù×zğÖ¢y¥*a³Ù-Z”••å,:ÿ{öìÙ±c‡êãÊs‹ZšŸ­o-šWªãÇ—Ó^±bÅZµjI£råÊæÿ‚æµ4?ÿZŞZ4¯T%&NœX¡„gy&<<\\õ¡å†¹E-ÍÏ¿Öƒ·Í+U‰³gÏŞyç¤aÃ†÷ÜsOff¦êCÊ\rs‹ZšŸ­o-šWª*C†©X±¢A*Uª$)dÂ„	ª\n(OÌ-ji~şµ¼µh^©ªäååU©RÅL!íÛ·øá‡sssUP˜[ÔÒüük=xkÑ¼RZ³fùs™\Z5jğ‰æµ4?ÿZŞZ4¯Tµ}öY9ÿÍ›7W} @ùcnQKóó¯õà­EóJU+--MÎ¿¬UPş˜[ÔÒüük=xkÑ¼R•ãü#PQÛji~şµ¼µèY©ÑÑÑ£G®]»ö}÷İwÇw”üëš±Ëó gCÎ‰êË‚€RAË¹Åh~şµ¼µèV©III-Z´xøá‡‡¾sgÔñ´ô¼|[¾M»±¸×|Xr»µûçåçËó0,(HÎIóæÍU_\"İæ£ùù×zğÖ¢U¥îŞ½»R¥J“\'O¾œ“#ÙÃx1v­m63ˆ\\c±Ùİí\0ï/çdÊ”)ÕªU[·nê…@ ÕÜâ‡4?ÿZŞZô©Tyq•ÁFFF\Z¯ÄùÆ; ®—ã¢¶±¶Ûò¯Şâ¹èĞÃÆ\rr–$®©¾\\°<}æÿ¤ùù×zğÖ¢I¥&%%ış÷¿ß¸q}¾-ÏfËË·åÊb6Š=tu°ç™İÜ\r­úGFnùõ¯Ífp‹4™[ü–æç_ëÁ[‹&•Ú¢E‹É“\'/½òº›ãjØs‹^ŒÛE[rÌí…İ´ì?eÊäf¯7U}Ñ`mšÌ-~Kóó¯õà­E‡J‰‰yè¡‡rr/Êë«M×«¯¬sò‹Úæb3×vw#WÛş—s²kÖ|ˆßšÁ­ĞanñgšŸ­o-:TjHHHpp°ÍvÙx%¾,K½¿7öòwYÍş®×æ¢/¿Ò°ÍöÏı@ÿ  !£GV}é`a:Ì-şLóó¯õà­E‡J­]»ö‘ù¶KÆ+î¥_nø£ÓyÜá<lsÌsîÍsÆfÛg¬üaCÆ…˜|gt3&Ç¹í’sc®óÃm	İ{ô4^/»¿Ü³m>¼Ò¶>\0ıwîÜúä“O¨¾t°0æ¦ùù×zğÖ¢C¥V¯^ıøñ#6û%s‘!g;œìÎŸó—œÎ!£Â*TüÍ³\r›gØœéyÎô\\ç±ç»sÙÎ½ÒÙæz…¾h~­«a3öc»d6òİ‹öıÓÒSî½÷^Õ—¦ÃÜâÏ4?ÿZŞZt¨Ô;î¸#/?Ûæz¾(¯¯2äKgÃõ”½Àµşæ»õ÷×|tôÄév§ó»ó‚Íù³ÍyŞéÜ¸kŸ+…Ø—p×ùEãå¼p?…=EÛ ~~vÅŠÕ^8Xšs‹?Óüük=xkÑ¡R÷3~±Ù%ˆdËZ^´;Ï^væ;\n;œ?şƒgMxïãô“§ä¡­À™o¤“q{¿ÖøÂÂ”l¸:\\ÙÀô×¡6à;ÔZšŸ­o-:Tªñ~†¼²f™kW\nq8ºä<í´9ùyy®U«B…;*T¨ôæ[<¿06~÷•¯-|©vïÇ£a÷Ü0ıu¨\røÎ¯~õ+Õ‡ 5Íï_­o-:Tª‘$²ŒWVy‰Í2\"sö²óä/Î3¹ÎØ©÷Ş{ïwŞıÿî©Ú¶İU)dW\\¼t¶»^¤³ìö,ÏØí…\rY›<\nş:Ô|äÜ¹s•+WV}ZÓüşÕzğÖ¢C¥\Z?U¹àz¡µ_0_\\/8Îq½òS®3bWâcO<UµÚïï©\\eÖÂe¹NgvóRë·Eí*üZ×—®—ó+[Œ—óû˜ş:Ô|$55µF\ZªBkšß¿ZŞZt¨T#Iœ·»^tÏËbY‚È›ó\\¾óä/¶	Ç¨S÷¥W^;“ç<ã<“ã<›ç”²-ÆH!vóÅÛµ¯ÜÆ®ì…k›çFcÿÓ_‡Ú€ÄÅÅÕ©SGõQhMóûWëÁ[‹•j$‰óÆë®¼Ê{¡ŞûMHŒÚ“¸=>qûîäûR6ÅÜ™p42>yk|ÒöİIQ{“§}:ûó7[µ2¿Êf®mç=\Zí¢‡Eû˜ş:Ô|dÑ¢E­[·V}ZÓüşÕzğÖ¢C¥\ZŸí×sÆK¬¼¾ëÛ·§78õ7ZšıíE‹Íc?bûŒş:Ô|¤W¯^3gÎT}ZÓüşÕzğÖ¢C¥\Z)äg›ı¬İµül¶m6WÛX›·¸\ZÆúëPğ‘Ç{,66VõQhMóûWëÁ[‹•jüD&Óx‰•WÜL›­°íŞâùĞxyÎ¤¿,:Ô|aÿşı÷ß¿ÍfS} ZÓüşÕzğÖ¢C¥\Zï…d^s±¹¶kwĞ¹¿µ_èĞ¡ÃÔ©SU…î4¿µ¼µèP©F\nùÉfûIÖ®†İldÚîvæUİ´ï¯Cm Ü;vìw¿ûİéÓ§Uˆî4¿µ¼µèP©F\n9c¼²)z>c¼Üº7¹fÍûëP(_YYYwß}÷W_}¥ú@ ÅÜ^\n­o-:TjQ\n1—ÓÆâùğL‰å4ıe¹fmÄÇÇ÷ë×oíÚµ·ÿ:ÂÏIyâ‰\'Ş~ûmÕæöRh=xkÑ¡RrªèõÕİ(¹¸r8ŠuÓ·±Ú8tèP-×¸ShóæÍŠ®\'üÑ±cÇjÖ¬Ù·oß‚‚ÕÇæöRh=xkÑ¡Rò£¼¾:§®WÙÍEoÏõÑ½¿»6rrrÚ·oÿ«_ıÊÌ>úè¿ÿû¿Ë?|Õ^Vø‰ıû÷Kyüîw¿ã1~E‡¹½ZŞZt¨T#…œ4^Ye}ÒázşÑ½Åá±İÜènhŞß¬Ï?ÿüßşíß<ÿ˜[ƒ\rÚµk§úªBsçÎ¥¦¦ÆÅÅIæèİ»÷ã?~ÿı÷O›6£úæöRh=xkÑ¡RÍâp˜/±\'_kK<t\\ÙAy(çmìØ±Şü‘Y“ûÍ*¹Ä¿ùÍo*W®\\§NV­ZÍ˜1c×®]ü]ÿTAƒ¹½ZŞZt¨T£Ã!/´…k×‹náRl‹£hMYÌÚHKKkÖ¬Y•*Uîºë.ó¥èà½ÉÎÎnÚ´i—.]zõêÕ§OŸ×_½M›6½{÷îÖ­[ëÖ­×¬Y#}†>kÖ¬ÕW›3gN¿~ıÌlÙ²eäÈ‘²“÷Ş{O\Z“&MjÔ¨Qppptt´ÒÁáºt˜ÛK¡õà­E‡Ju¥û	»±HC^kİëÂóX\ZE½î?sæ¸—ÊSii»âã7$ì‹8p`³¬ãâÖÿ|ö€»Ïrs™ûïØñÍëíÿé§ŸÌÏO+v<<épò6wÿğğ¯>üp|y)ı=k#<<üÁ¼÷Ş{Í \"ÿ æs!VTPPğüóÏŸ?¾Øv	[·n•ä±~ıú7ÊZÚÛ¶m6l˜<›™™¿ÿ~I-G§L™\"AäÀ{öì9wîœŠ¡àt˜ÛK¡õà­E‡J­àú‰Lº¼â:\n_wÓ]×\'Œí…í¢néŞ÷ÏË;Öõ¶[·®\n<qâğÏ?Ø°^ÌèØ¡å†\r‹££Ö\ZÔ-,tPİº3$8¸Ï¸qÃê×ÿë„	AcÇ•l!{;~<fÇ5»ã×ïİû½<µwïÆø¸ğ;¿9~,Æ<ŒŸÎìûûßë9³/4dPHÈÀNZ5múJhÈÀºŞúñ—Ò¿XmäååMœ8ñ·¿ıí£>*OÅÄÄ¨º ¸i&LøÃş 	2!!Ás»¤¹ QQQ’*öíÛ\'ky,Ï¦¤¤,Y²dÌ˜1Ã‡]DÚcÇ]¼xqZZš¢Ñ 4:Ìí¥ĞzğÖ¢C¥\Zï…¤9ivYÂµÃ£]l]–şvÛqi„…\rúî»/×‡/zá…g¾]»à£ÆoŞ¼L}÷İãÆ\r}úé\'ÆÔ»cÇ72Ú÷Íš/–/Ÿ•››*_8wî´ÁƒºÍ™3U–:u3ıúvşì³Éîï’“ŸtÓ¦eAÃzÉš4i0ztÿeË>+—ã¿^ÿkÖÆÙ³gåÊüš®M›6­OŸ>-Z´8sæÌ/¼á~JRHjjêÒ¥KG\Z&!cùòåÇ7Sˆ©]»v=H´oß^Å8àæöRh=xkÑ¡RrÜµ8ÌuZáÃ¢ö+m×SoĞÛ¶•;¼Ñµk[i‡…üî»ë¾[Ø¨Q}YK\nÙ\")Ä~¼S§–?ü°´iÓ—7ı°´uë&?Œ\r\nê%‘åÔqæş¿øâı\rë™;lÙò5sÿkVşÅÓå[ÇÅ~;{ö”eÿúìÜÏ	kÖ|¾>üŸS§\ZĞ¿‹4Ö~óEâ¡M·rü¥÷×¡64!y¢Y³f)\n\n\n$…8¿0V¿~}If3…<833S^¸paèĞ¡%SÈ»&MšÔ±cG%Ã74¿µ¼µèP©Æ§SÍ—ØcÇ1c}ÜÕ(ÜR´İ³Q–ş’-¤6pÒ¤à¡C»¿ñÆ«t<¸ë–-’BÅÅ}Û¤Iƒ—^zN6®Z9[ú‡„ôíµ—rr›_şÅïµjÕ8(¨§,úS\rWcXÏ-şîJ!öcÉÉ›wï^\'ûÌÊ:(±cÕªÙë$ë¬[¸fÍ<	%Çn¿õã¿^jCiii<òˆûÏİš)ÄiüÎmİºu322œE)$((¨”2`À€	&¸SÈøñã%µÜöÑÀ[šß¿ZŞZt¨T#…È‹ëQY8¶‡c%¶xÛ¿m›¦Ò\ZÖ#6víˆ½%‹¼ûnğGİ²å_ñqß¶lùÚ¡C¯¿şÊ™Óq~Ğ»W‡áÁ½¾şzÎóÏ?-ıŒ²aı—æŞ\\ï…5«çÉv÷wlÛ¶©¬-úğwZüñø?\ZÒÔ¨¾årü×ë¯Cmh\"??ßİv§qñâE³a¦yóæ7ÎLóçÏ÷L!ééé«V­\n\r\rÍÍÍíÙ³§<”òlRRÒmÊ@óûWëÁ[‹•jüD&Õá8ZøŠk¶GŒµñêk´íî-©eê/)$7\'©[·6‡FÒMúKV¹e©<»fõÜ>}:öë×),t@—.­†ï5zTßA»Ìœ9&/÷°ìä‹/¦\rÒmÎœÉsçL®SçQiÈÒ¿ÿÛ’BÜÇc£Ëşõé›o6\Z3fà˜1ƒ\\;P.Ç½ş:Ô††^ıõ’%O¤¤¤Û(	cÄˆf»C‡ÉÉÉæ`Î=>wîÜˆˆˆW_}õäÉ“¾>fÜÍï_­o-:Tªñ^ˆ¼²¦k×Røºë±öxèîæMÿ¼¼ä\'ŸüŸŞ½Û¿üò_OŸŠiÒ¤şèÑ}ßjÛÌx/d©Ù-)1bù²O¥ÑºUã5kæ~½jÖêÕsÜûÿä“ñ³g¿»oïº}ûÖÕ¯ÿ²–ö§ŸŸ5k’ûxÚ¶múå—ÈN$üóŸ3d™:u„+…Üòñ—Ò_‡ÚĞĞsÏ=Wrã!CŠıÖŒäzõê™CÎÈÈøä“O¤ñÁôéÓgäÈ‘Ã†\rëÜ¹óåË—O:Å_-óOšß¿ZŞZt¨T#…¤8ì)²v½Ğºs1Û…[ì…½ì»¦Aƒÿ‹ŠZÙêÍFı?úpÌ–-KÌş’*¦O%OµiÓ8:j•t–åšûoÜø¥’Ç“šºå{~ûÙg—-ûäÃ™aÉIÉÉëÃ„†ö»õã/¥¿µ*Íï_­o-:Tª‘B88ì®µ»Q¸6\ZÅ;”¥nÎÁŞ½ÛíÛû­»—Î-~ø?İ²|ÙÇ;6ïÑ½mçÎo÷hÛ¦IPP÷Áƒ»HI$kVÏ.¶ÿgy²äşö}·lÙÇÒ˜?ê¿–~$çw¿ôÒ³‹Ï(—ã¿^jTšß¿ZŞZt¨TcëUÖµ8æpÑÚ~e{É7İßaO¾¹ı\'%n,¥nÎ¼¼CæF›-ÉwÇo6t¨\r Pi~ÿj=xkÑ¡RO§J,H.p$K£Àl”\\ö9ìÑÖº¿µ*Íï_­o-:Tªñ^H’±˜/±I{áCwÃİÁqõCûëP@ ÒüşÕzğÖ¢C¥\ZŸI4^e‹\ZIf£ØöbÏjŞ_‡Ú\0•æ÷¯Öƒ·*Õx/$ÑûÅá8DÿR`ešß¿ZŞZt¨Ô;î¸Ãa?Xàz­=äp6Ü‹{KÉ§tî/g¬bÅŠª/€›¤ÃÜ^\n­o-:TjõêÕO¤o*p0gÁA£qĞX\\İ>XÔá æı3Nl¾÷Şªª/€›¤ÃÜ^\n­o-:TjíÚµc¢—¸_eû=yÑuot­W:hİ_ÎØ“OşYõ¥p“t˜ÛK¡õà­E‡J\r			\nêâ,×÷ë±S–Ï—çb4ï?<øÑ£º«¾t\0n’s{)´¼µèP©1115j<Ÿ·Ûéz••—Ûãå¶pñ|Xü)]ûË¹ªYóQ;©¾t\0n’s{)´¼µhR©-Z´˜6upcŸÓ±Ïµ.p5Œ×à¢-ÆÆ‚ÂgŒeŸ¶ıå\\µh^_õEpó4™Û¯GëÁ[‹&•š””ôë_ß½cÛ×ë±ëåv¯,Ncíj¸·\\yjŸÙAÃş?DÌ©V­Jâ¡Õª/\Z€›§ÉÜ~=ZŞZô©Ôİ»wË`#¾Ÿ]àØã,0_q]‹ë¡£¨Q´Ål›\r­úoß6_ÎÒºï>Q}¹\0Ü}æökÒzğÖ¢U¥®[·î÷ÕªL›:Ğ–·«À±ÛY°Û\\;»¯zhl¹ªQ¬C ö·åï’3Sé×wï_¬úB¸UZÍí%i=xkÑ­R“’’š7é¡\Zz{Wô—éá8ãe8Ş\\HÃÕ¾ºQPø¬Ó³mışö¸éá1Qƒƒ:Õ¨ñ‡Í_JJ\\©ú(ºÍíÅh=xkÑ³RcbbBFw}òÉZÕï«zGÅŠt%c—3PûÉZr6b¢ª¾,\0ÊM-çv7­o-šWªrcÇU}\0æs»Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖ¢y¥*ÇùàšÏ-ZŞZ4¯Tå8ÿ\0|Aó¹EëÁ[‹æ•ªç€/h>·h=xkÑ¼R•ãüğÍç­o-šWªrœ\0¾ ùÜ¢õà­EóJUóÀ4Ÿ[´¼µh^©Êqşø‚æs‹Öƒ·Í+U9Î?\0_Ğ|nÑzğÖrÃJMMM—õ¦M›V¬X1}úô={fgg»ûŒ?^¶»fffşóŸÿìÖ­[É½ıïÿş¯Ãá(¶ñÓO?MIIq?Ü°aÃÇ|3ƒ±›Í¶hÑ¢¬¬,gÑùß³gÏ;T€ÀA\n5Ü°R=:{öì…._¾üoû›dÙòóÏ?ÛívyöàÁƒıúõ\r\ríÒ¥KHHÈàÁƒ[·n-¡D^SÍâÄ‰òU{÷îİ¿ƒ\räE7&&&==İìpöìÙW_}U²KXX˜ìªsçÎÍš5“ö Aƒ|:vUäüÈi¯X±b­Zµ¤Q¹rå\n†Í›7«>4\0‚k(½Rcccß~ûíàà`ÉãÆ{ôÑGe-A!((H¶ÇÅÅDDD$%%Iç?^âHnn®çN>ÿüó!C†Ì3<õÔSf£ÿşnÜ}222$µDFFÊ÷êÔ©SÓ¦M%Óx¾¿H&NœX¡„gy&<<\\õ¡°0Şgu#…X†7yù7Şä1fÌI!cÇ•DÒ¾}û‹/ÊS—/_–ä1zôèøøø÷Ş{Oª¿wïŞ;wî”øb¾k\"},Xğı÷ß›»zóÍ7ÍÆÚµke»4vïŞ=wî\\	.\\7n”ıH ‘Æwß}—œœì«‘«söìÙ;ï¼Ó3‚4lØğ{îÉÌÌT}h\0,Œ÷YİH!–áM\n‘×È†\r\Z˜\rÉ%—.]’§¤¸\'Mš4mÚ´§Ÿ~zÊ”)’Tzôèñõ×_¿üòË«V­Ú»w¯ÓH!­[·6<òÈ#fCö`¦#GH·–-[fggKìX½zõzÃZCZZš¯Ï€C†‘™Âœ *Uª$gxÂ„	ª\n€µñ>«)Ä2¼L!Ûõë×7Í›77?š••%YaÓ¦M¯½öÚ÷ß/1¢{÷î²½K—.îO¡–ş^ˆé­·Ş’õâÅ‹»víú©!,,lôèÑå:V?’——W¥Jshß¾ıÃ?\\ìÇX\0PV¼ÏêF\n±oRH·nİ$Œ;ö/ù‹ù™=zœ?Şi¤Ù³g¯^½ºQ£F²^·näg‰2tèĞbŸ0`@É²bÅŠV­Z3ôïßÌ˜1¾²ŸX³f9_Ô¨QCÃ©\0ğŞg5‘B,ã†)äàÁƒ’<&O<uêÔÇ|Ê”)ï¾û®l9pà€Ù¡W¯^Ç{çw†ÕºukçÕ)äÿøÇÜ¹s÷\Z4h`6>ûì³9sæ¸¿‹¤E‹I\n‘tò•á½÷Şì\"}öY9ÿÍ›7W} \0ï³šH!–Qz\n‘$ñË/¿dfffee]¼x±eË–²–¶lÉÎÎ–g·oßn†	I!999’!æÍ›ç4Rˆû7u=5iÒ¤äF	1•+W={¶¤>úèˆaÃ†\raaaå4J?•––&ç?P?û@	Şgu’B,¤ô’Ğ·oß   Q£F…„„Œ1BÖ#G:t¨ùˆÓø5™Ö­[O˜0!%%¥aÃ†ùùù²ÑıK4ÅÈ¿şKnÜ¿¿ùK¹.\\¶l™4$úÔ¯_éÒ¥å1D¿¦ùïôğŞgebµŒò}ÌËË3#\n\n\nJv8|øpé_n³ÙÌvÉ?±\Zx\"##ÿã?şcË–-ª@@á}VRˆeğoqU$|üîw¿[±r¥\r›€Oi>·k=xkÑ¼RU1#HDÄù6û?l\"ˆ\0¸E{÷î;vlÓ¦MŸzê©êÕ«ß}÷İ²–¶l‘íæ_oÒ/l–Q±bÅkşè¾ãAÌ… àædee…††şçşgÉ¿WVŒô‘æßwx¤Ë¨\\¹ò¹sçT…FJFw‘í|F€—òòòfÎœYµjÕæOÒ_¾Êı¾@E\n±Œ\Z5j¤¦¦ª>\n]\\/‚˜‹lçÃª\0¼‘‘‘ñÔSOyÆ™=:uêôÕâ%ÑÑ1ié\'.^º,kiË–:È³ëÖ­+{P=\"…XF:uâââT…J \0^Š®^½º;R<üğÃ‹—,ÍÉÍ+en‘g¥OÍš5İ_%{ı¨Š¯B,£uëÖ‹-R}Ï›BpC*Uªd&‰»ï¾{ÆŒ—.çÜpb1é9}úûòUæ—Ë~5ˆB,cæÌ™½zõR}ÎûBPŠŒŒ÷» ÕªUÛ¼y‹—³Šç\"_åş4‰ì- 4C\n±ŒØØØÇ{LõQ²²F‚€kÊËËsD\"HRòá›ˆ æ\"_ë\"uëÖ\r¼«’B,Ãf³İÿıû÷ïW} ©d9}æ§R¦Ïg	\"\0<Íœ9Óıƒ˜›{¤Ø;\"wİu—¹CÙ³êÁ•3Rˆ•L›6­}ûöª\"\0•Œ !¡¡’ù%&]sRíò¬ô!ˆ\0(&++Ëı{.3fÌ¸Åb.Ó§¿ïşõİ\0û;\"¤+9}ú´¼Xšÿ5ÊË5#ˆyÃ_3ˆ˜Äì@PLHHˆ9?üéOòşã¨¥/²÷oÍ„††ªby\"…XÌW_}%µ`YX¡R\"È5ƒˆg!ˆ\0(Éı×Q/YZ.Ä\\doæneÿª‡XH!ÖÓ·oß\'x‚ rë®ùYb!Ã3ˆ”Œ æ³|F€iÏ=æÌ ó@é¤¬‹ìMæ+sçôÍB¬§   S§Nwß}7?š¹×û˜ëEğõJ	(A`6›mêÔ©,ÈÌÌ,ùìØ±cÍÉAférŒ æÒ¡Csçò]nÿÀ}„bU_}õ•¼ˆ¶oßßš¹	¥ÿRî5ƒHÅŠ½‰  °­\\¹Òœî¼óÎÁƒûÕÙ¦M›šÏ~µxI¹§Ù§¹sù.ª†_îH!vúôéiÓ¦Ékác=Ö«W¯E‹ÅÅÅ¥¦¦;wÿ}·Şü]k/#A`YYYî“H£J•*kÖ¬q?ëş3!ÑÑ1åBdŸæÎå»(<å‹by6›-66væÌ™­[·®S§N\Z5*W®\\òî0yÿ§ÉJ	\"7Œ  €ÕªUËsB¸óÎ;Ÿ}öÙ´´4yÊı÷RÓÒO”{\n‘}š;—ï¢ú”RôR¦¿\Z¾~CÉ<\'[d»—{øá‡MDÜ?*ØÜÿóËÅK—Ë=…È>İßEõTZnH!ĞKdd¤‘ï#\"x/j;v¬k×®ÒØgˆŠŠzóÍ7wïŞ‘‘qîÜ¹·Şz«_¿~Ã‡		‘|=:88xàÀ;v4?ùı÷ß7nÜøÃ?”n}ûö­]»¶ô	\n\nêÖ­ÛÉ“\'/^¼Ø¾}ûG}tŞ¼yGmÖ¬Ùê\"¯¾úªêÑ[[åÊ•Í© R¥Jr’zè¡-Zğ^ÈÍ!…@;Ş>_ëİ»÷©S§¾şúkÉŸ|òÉÌ™3Ÿşù9sæHªØµk—Óø¿H’““Oœ8ñã?¾öÚkÒYÚ‡ÎÉÉqïä—_~q8ùùù=zô°ÙléééÒöü.ƒ–@#Î;»7ò\'˜o…ûwq6løÊ+¯Ô¬Y3<<Üı,Ÿ)+RtTzáwdàk6lxüñÇGÙ¬Y33UHV0ß\Zq;}úôsÏ=÷ÃO<a6^|ñÅ#GÈ³			Ã†\rËÎÎ–öèÑ£¥#;1?œß§OŸÚµk÷íÛ÷ã?nŞ¼¹t\r\r•5ï…ÜŠˆˆˆ\nÆ,wÏ=÷Lœ8‘ß‘¹E¤hJ‚H•*Uø{!PââÅ‹?şøãğáÃ“““gÏİ­[·AƒuïŞ}À€mÚ´9uê”ôÉÌÌìÒ¥‹Ù¿E‹f£ÿşÇ7ÛÑÑÑıúõÛ´iÓ3Ï<#¡C‡J¬‘ä1fÌ÷7úóŸÿ%ßîğáÃ\'Nœ8yò¤¬SRR.\\¸p[XÖ­[7kÖ¬³gÏ–|Êı!°:”{\náï…\0…¿\n…¶nİúÙgŸIãòåËñññû÷ï?pà@BBBRR’ÙáÌ™3Mš4	~ıõ×yä	\"AAA\Z5JMMuïäØ±c‡cÅŠGıàƒäK¾øâi›Ï®Y³FşÉŞµk×¥K—Î˜1C^8åáœ9s>úè£C‡İş!ë`ïŞ½æÌÀßNõ)Zãÿ‘\'NœxğÁûöíÛ«W/‰’-şY¤U«V=###\'Nœ(D¢Ã×_]l?²ıÒ¥KC‡•véÒåôéÓaaaæSÙÙÙmÚ´4hPFFÆñãÇãââ<øÚk¯IÖ‰‰‰¹MãÔ’¯ÿ™ÿú¯ÿR=ÄòD\nîø?u¡„İnw8û÷ï—L0lØ0÷ö:¸Û+W®ìŞ½»t3\"2yòdùBóÙğğğüãNãÓ¦ùùùï¼ó¤÷c-Z´}ûv÷§SçÍ›÷ÕW_=÷ÜsK–,™;wîí\Z¥B‹&š5kòêŞ)¸v)åÃ§f!‚à¦:t¨^½z8¦M›¶cÇ¿ıíoïiİºµtHLLl×®İ„	Ìšº?¸páÂ¿şõ¯QQQ¹¹¹\r\Z4ÈËËKMMmÓ¦Óø-˜3gÎÈK”¤“uëÖ™ıxöìYI\'\'OÌÌÌlŞ¼¹¬¥m~ô¾••UµjU31LŸş~¹¤Ù¹CÙs€ıW¦¤ÀåšŸ)eRà³ ¸‡Ãı–†áÃ‡Ÿ/Ò»woÙøÓO?8pÀİÿùçŸw·%CH·ØØØ9sæ$$$Ô¯_?##C¶6,??¿eË–’cÌ-¢{÷î\'NœX²d‰ä›÷ßÆŒ²–ö¢E‹nßhõ3sæL34Ü}÷İ›7o¹Å\"{¸ë®»ÌÊU®œ‘B€BŞÿqwÏ…‚ÛÀıÓ’ÜiæšNŸ>]ì/ˆà6ÈËËsÿáªU«&%¾é\"_ë~g¥nİºÅ~18\0B€+Ê\ZDˆ \0®)##ÃıwT%FÜÜ;\"òUî\"{s¿ÅHH!ÀU¼\"D\0¥ˆ®T©’™!îºë®éÓß÷şÃªÒSú»#û‘½©OB€â¼	\"D\07$ÑÁıˆxøá‡/YZúß‘g¥û7bÌwA5‚8I!À5•Dˆ \0¼”‘‘Q·n]Ï?2$sK‡¾Z¼$::&-ıÄÅK—e-mÙ\"ÛİšÌıY€üAŒ)¸¶ë\"€2ÉËË›9s¦û^’şòU÷qÔbH!Àu•\"D\07\'+++44Ôı—UK!}¤g€ı]ë!…\0¥ñ\"D\0·nÏ=cÇmÚ´éSO=U½zõ»ï¾[ÖÒ–-²]U}€·)¸3ˆ¬X¹’\0å‹ÜXdd¤DY«>\0(¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤\0\0 )\0\0¨A\n\0\0jB\0\0€\Z¤ÿßn\0\0\0\0ò·Æ¢\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xX\0ğ°\0àa!\0ÀÃB\0€‡…\0\0\0\0<,\0xÿ\0öw\07Ä>\0\0\0\0IEND®B`‚',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','2501',2),('schema.history','create(5.18.0.1)',1),('schema.version','5.18.0.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `user_id_` varchar(255) NOT NULL,
  `group_id_` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1','SpringAutoDeployment',NULL,'','2017-01-15 10:34:47.434');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('dispatch:1:27',1,'http://www.activiti.org/test','å‘æ–‡ä¼šç­¾','dispatch',1,'1','dispatch.bpmn20.xml','dispatch.png','ä¼šç­¾',0,1,1,''),('leave-dynamic-from:1:25',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹-åŠ¨æ€è¡¨å•','leave-dynamic-from',1,'1','leave-dynamic-from.bpmn20.xml','leave-dynamic-from.png','è¯·å‡æµç¨‹æ¼”ç¤º-åŠ¨æ€è¡¨å•',0,1,1,''),('leave-formkey:1:23',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹-å¤–éƒ¨è¡¨å•','leave-formkey',1,'1','leave-formkey.bpmn20.xml','leave-formkey.png','è¯·å‡æµç¨‹æ¼”ç¤º',1,1,1,''),('leave-jpa:1:24',1,'http://www.kafeitu.me/activiti/leave-jpa','è¯·å‡æµç¨‹-JPA','leave-jpa',1,'1','leave-jpa.bpmn','leave-jpa.png','è¯·å‡æµç¨‹æ¼”ç¤º-JPAï¼ŒæŠŠå˜é‡ä¿å­˜åœ¨ç‹¬ç«‹çš„è¡¨ä¸­',0,1,1,''),('leave:1:22',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹','leave',1,'1','leave.bpmn20.xml','leave.png','è¯·å‡æµç¨‹æ¼”ç¤º',0,1,1,''),('timerExample:1:26',1,'http://www.activiti.org/test','å¯åŠ¨æµç¨‹30ç§’åä¼šè®¾ç½®æµç¨‹å˜é‡TIMER_OK','timerExample',1,'1','timerExample.bpmn','timerExample.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `adver` */

DROP TABLE IF EXISTS `adver`;

CREATE TABLE `adver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `IMG` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adver` */

/*Table structure for table `api_interface` */

DROP TABLE IF EXISTS `api_interface`;

CREATE TABLE `api_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'apié¡¹ç›®æ¥å£',
  `url` varchar(100) DEFAULT NULL COMMENT 'æ¥å£åœ°å€',
  `title` varchar(100) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `request` varchar(5000) DEFAULT NULL COMMENT 'è¯·æ±‚ç¤ºä¾‹',
  `response` varchar(5000) DEFAULT NULL COMMENT 'å“åº”ç¤ºä¾‹',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `api_menu_id` int(11) DEFAULT NULL COMMENT 'èœå•id',
  `project_id` int(11) DEFAULT NULL COMMENT 'é¡¹ç›®id',
  `sort` int(11) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL COMMENT 'æäº¤æ–¹å¼',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `api_menu_id` (`api_menu_id`),
  CONSTRAINT `api_interface_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `api_project` (`id`),
  CONSTRAINT `api_interface_ibfk_2` FOREIGN KEY (`api_menu_id`) REFERENCES `api_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `api_interface` */

insert  into `api_interface`(`id`,`url`,`title`,`remark`,`request`,`response`,`create_time`,`update_time`,`api_menu_id`,`project_id`,`sort`,`method`) values (1,'11333311','æ–°å¢å‡ºåº“å•','Layuiæ­£æ˜¯ä½ è‹¦è‹¦å¯»æ‰¾çš„å‰ç«¯UIæ¡†æ¶Layuiæ­£æ˜¯ä½ è‹¦è‹¦å¯»æ‰¾çš„å‰ç«¯UIæ¡†æ¶Layuiæ­£æ˜¯ä½ è‹¦è‹¦å¯»æ‰¾çš„å‰ç«¯UIæ¡†æ¶Layuiæ­£æ˜¯ä½ è‹¦è‹¦å¯»æ‰¾çš„å‰ç«¯UIæ¡†æ¶Layuiæ­£æ˜¯ä½ è‹¦è‹¦å¯»æ‰¾çš„å‰ç«¯UIæ¡†æ¶','{\r\n    &quot;outCode&quot;: &quot;002&quot;,\r\n    &quot;outDate&quot;: 1476751474000,\r\n    &quot;outType&quot;: 2,\r\n    &quot;createUser&quot;: &quot;liu&quot;,\r\n    &quot;contractNo&quot;: &quot;h00442&quot;,\r\n    &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n    &quot;deviceType&quot;: &quot;kt40&quot;,\r\n    &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n    &quot;remark&quot;: &quot;dsfdf&quot;,\r\n    &quot;status&quot;: 1,\r\n    &quot;operationCode&quot;: 5,\r\n    &quot;outWarehorseDetails&quot;: [\r\n        {\r\n            &quot;sn&quot;: &quot;0010101&quot;\r\n        }\r\n    ]\r\n}','{\r\n    &quot;success&quot;:true,\r\n    &quot;data&quot;:{\r\n        &quot;SNArray&quot;:[\r\n            &quot;0010101&quot;,\r\n            &quot;e2323&quot;,\r\n            &quot;XMD8263751&quot;\r\n        ]\r\n    },\r\n    &quot;dataModel&quot;:null,\r\n    &quot;message&quot;:null,\r\n    &quot;timeStamp&quot;:1476955288844,\r\n    &quot;total&quot;:3,\r\n    &quot;count&quot;:3\r\n}','2017-02-03 14:38:26','2017-02-06 21:55:10',5,1,6,NULL),(2,'/outware/search','å‡ºåº“å•æŸ¥è¯¢',NULL,'{\r\n &quot;sn&quot;:&quot;dfdf&quot;\r\n}','{\r\n    &quot;success&quot;: true,\r\n    &quot;data&quot;: {\r\n        &quot;outWarehorse&quot;: {\r\n            &quot;outWareId&quot;: 2,\r\n            &quot;outCode&quot;: &quot;R20161018084430&quot;,\r\n            &quot;outDate&quot;: 1476751470000,\r\n            &quot;outType&quot;: null,\r\n            &quot;createUser&quot;: &quot;è®¸ç™¾èŒ¹&quot;,\r\n            &quot;contractNo&quot;: &quot;h00442&quot;,\r\n            &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n            &quot;deviceType&quot;: &quot;3&quot;,\r\n            &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n            &quot;remark&quot;: &quot;dsfdf&quot;,\r\n            &quot;status&quot;: null,\r\n            &quot;operationCode&quot;: 6,\r\n            &quot;outWarehorseDetails&quot;: [\r\n                {\r\n                    &quot;outWareDetailId&quot;: 3,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                },\r\n                {\r\n                    &quot;outWareDetailId&quot;: 2,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    &quot;dataModel&quot;: null,\r\n    &quot;message&quot;: null,\r\n    &quot;timeStamp&quot;: 1477474504889,\r\n    &quot;total&quot;: null,\r\n    &quot;count&quot;: 1\r\n}','2017-01-30 12:48:14','2017-02-06 22:02:35',4,1,2,NULL),(3,'3123213','111111',NULL,'123213','123123','2017-02-06 19:40:09',NULL,NULL,1,3,NULL),(12,'45345','234324',NULL,'234234','5435435','2017-02-06 21:09:43','2017-02-06 21:14:06',5,1,4,NULL),(13,'23423432','23r234324','234234324','åƒä¸‡äººç¾¤è‹¥','ç»•å¼¯å„¿æ— è‹¥','2017-02-09 22:32:28','2017-02-09 22:39:27',4,1,NULL,''),(14,'23432432432','å‘ç»™å¤§å“¥å¤§æ³•å®˜','32432','{\r\n    &quot;success&quot;: true,\r\n    &quot;data&quot;: {\r\n        &quot;outWarehorse&quot;: {\r\n            &quot;outWareId&quot;: 2,\r\n            &quot;outCode&quot;: &quot;R20161018084430&quot;,\r\n            &quot;outDate&quot;: 1476751470000,\r\n            &quot;outType&quot;: null,\r\n            &quot;createUser&quot;: &quot;è®¸ç™¾èŒ¹&quot;,\r\n            &quot;contractNo&quot;: &quot;h00442&quot;,\r\n            &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n            &quot;deviceType&quot;: &quot;3&quot;,\r\n            &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n            &quot;remark&quot;: &quot;dsfdf&quot;,\r\n            &quot;status&quot;: null,\r\n            &quot;operationCode&quot;: 6,\r\n            &quot;outWarehorseDetails&quot;: [\r\n                {\r\n                    &quot;outWareDetailId&quot;: 3,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                },\r\n                {\r\n                    &quot;outWareDetailId&quot;: 2,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    &quot;dataModel&quot;: null,\r\n    &quot;message&quot;: null,\r\n    &quot;timeStamp&quot;: 1477474504889,\r\n    &quot;total&quot;: null,\r\n    &quot;count&quot;: 1\r\n}','{\r\n    &quot;success&quot;: true,\r\n    &quot;data&quot;: {\r\n        &quot;outWarehorse&quot;: {\r\n            &quot;outWareId&quot;: 2,\r\n            &quot;outCode&quot;: &quot;R20161018084430&quot;,\r\n            &quot;outDate&quot;: 1476751470000,\r\n            &quot;outType&quot;: null,\r\n            &quot;createUser&quot;: &quot;è®¸ç™¾èŒ¹&quot;,\r\n            &quot;contractNo&quot;: &quot;h00442&quot;,\r\n            &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n            &quot;deviceType&quot;: &quot;3&quot;,\r\n            &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n            &quot;remark&quot;: &quot;dsfdf&quot;,\r\n            &quot;status&quot;: null,\r\n            &quot;operationCode&quot;: 6,\r\n            &quot;outWarehorseDetails&quot;: [\r\n                {\r\n                    &quot;outWareDetailId&quot;: 3,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                },\r\n                {\r\n                    &quot;outWareDetailId&quot;: 2,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    &quot;dataModel&quot;: null,\r\n    &quot;message&quot;: null,\r\n    &quot;timeStamp&quot;: 1477474504889,\r\n    &quot;total&quot;: null,\r\n    &quot;count&quot;: 1\r\n}','2017-02-09 22:37:12',NULL,5,1,1,'GET'),(15,'test','test','1212414','','','2017-02-09 22:40:03',NULL,3,1,1,'GET'),(16,'æ‰€å‘ç”Ÿçš„','testdddd','2345435','{\r\n    &quot;success&quot;: true,\r\n    &quot;data&quot;: {\r\n        &quot;outWarehorse&quot;: {\r\n            &quot;outWareId&quot;: 2,\r\n            &quot;outCode&quot;: &quot;R20161018084430&quot;,\r\n            &quot;outDate&quot;: 1476751470000,\r\n            &quot;outType&quot;: null,\r\n            &quot;createUser&quot;: &quot;è®¸ç™¾èŒ¹&quot;,\r\n            &quot;contractNo&quot;: &quot;h00442&quot;,\r\n            &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n            &quot;deviceType&quot;: &quot;3&quot;,\r\n            &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n            &quot;remark&quot;: &quot;dsfdf&quot;,\r\n            &quot;status&quot;: null,\r\n            &quot;operationCode&quot;: 6,\r\n            &quot;outWarehorseDetails&quot;: [\r\n                {\r\n                    &quot;outWareDetailId&quot;: 3,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                },\r\n                {\r\n                    &quot;outWareDetailId&quot;: 2,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    &quot;dataModel&quot;: null,\r\n    &quot;message&quot;: null,\r\n    &quot;timeStamp&quot;: 1477474504889,\r\n    &quot;total&quot;: null,\r\n    &quot;count&quot;: 1\r\n}','{\r\n    &quot;success&quot;: true,\r\n    &quot;data&quot;: {\r\n        &quot;outWarehorse&quot;: {\r\n            &quot;outWareId&quot;: 2,\r\n            &quot;outCode&quot;: &quot;R20161018084430&quot;,\r\n            &quot;outDate&quot;: 1476751470000,\r\n            &quot;outType&quot;: null,\r\n            &quot;createUser&quot;: &quot;è®¸ç™¾èŒ¹&quot;,\r\n            &quot;contractNo&quot;: &quot;h00442&quot;,\r\n            &quot;contractTitle&quot;: &quot;shebeidd&quot;,\r\n            &quot;deviceType&quot;: &quot;3&quot;,\r\n            &quot;salePerson&quot;: &quot;hejiong&quot;,\r\n            &quot;remark&quot;: &quot;dsfdf&quot;,\r\n            &quot;status&quot;: null,\r\n            &quot;operationCode&quot;: 6,\r\n            &quot;outWarehorseDetails&quot;: [\r\n                {\r\n                    &quot;outWareDetailId&quot;: 3,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                },\r\n                {\r\n                    &quot;outWareDetailId&quot;: 2,\r\n                    &quot;sn&quot;: &quot;0010101&quot;\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    &quot;dataModel&quot;: null,\r\n    &quot;message&quot;: null,\r\n    &quot;timeStamp&quot;: 1477474504889,\r\n    &quot;total&quot;: null,\r\n    &quot;count&quot;: 1\r\n}','2017-02-09 22:40:58','2017-02-19 18:15:22',12,1,1,'GET'),(17,'234234','today','2343243','','','2017-02-19 16:10:28',NULL,5,1,5,'GET');

/*Table structure for table `api_menu` */

DROP TABLE IF EXISTS `api_menu`;

CREATE TABLE `api_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'apièœå•',
  `parent_id` int(11) DEFAULT NULL COMMENT 'çˆ¶çº§id',
  `menu_name` varchar(50) DEFAULT NULL COMMENT 'èœå•åç§°',
  `href` varchar(50) DEFAULT NULL COMMENT 'é“¾æ¥',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL COMMENT 'æ‰€å±é¡¹ç›®',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `api_menu_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `api_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `api_menu` */

insert  into `api_menu`(`id`,`parent_id`,`menu_name`,`href`,`remark`,`create_time`,`update_time`,`sort`,`project_id`) values (1,NULL,'å‡ºåº“å•','',NULL,'2017-02-10 08:48:42','2017-02-22 08:48:45',1,1),(2,NULL,'å…¥åº“å•','',NULL,NULL,NULL,2,1),(3,NULL,'ç›˜ç‚¹å•',NULL,NULL,NULL,NULL,3,1),(4,1,'å‡ºåº“å•æŸ¥è¯¢','outsearch',NULL,NULL,NULL,4,NULL),(5,1,'æ–°å¢å‡ºåº“å•','add_outware',NULL,NULL,NULL,5,NULL),(6,2,'å…¥åº“å•æŸ¥è¯¢','/inWare/list',NULL,NULL,NULL,6,NULL),(9,3,'ç›˜ç‚¹å•æŸ¥è¯¢','/g/b','34234','2017-02-19 16:03:36',NULL,8,1),(10,2,'gggg','tyy','7898','2017-02-19 16:24:26',NULL,90,1),(11,1,'ttttt','uuuu','456546','2017-02-19 16:54:14',NULL,7,1),(12,1,'666','888','888','2017-02-19 16:56:57',NULL,7,1),(13,1,'ttttt','uuuu','456546',NULL,NULL,7,1),(14,4,'rrrrrr','66','454','2017-02-19 18:38:40',NULL,45,1),(15,4,'rrrrrr','66','454',NULL,NULL,45,1),(16,1,'new_test','44','45435','2017-02-19 18:40:00',NULL,45,1);

/*Table structure for table `api_param` */

DROP TABLE IF EXISTS `api_param`;

CREATE TABLE `api_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'æ¥å£è¯·æ±‚å‚æ•°',
  `param_zh_name` varchar(50) DEFAULT NULL COMMENT 'å‚æ•°å­—æ®µå',
  `is_null` tinyint(1) DEFAULT NULL COMMENT 'trueï¼šä¸ä¸ºç©ºï¼Œfalseï¼šå¯ç©º',
  `param_cn_name` varchar(50) DEFAULT NULL COMMENT 'å‚æ•°ä¸­æ–‡å',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `param_type` tinyint(1) DEFAULT NULL COMMENT 'å‚æ•°ç±»å‹ï¼ˆ1.è¯·æ±‚å‚æ•°ã€2ï¼šå“åº”å‚æ•°',
  `sort` int(11) DEFAULT NULL COMMENT 'æ’åº',
  `interface_id` int(11) DEFAULT NULL COMMENT 'æ¥å£id',
  PRIMARY KEY (`id`),
  KEY `fk_interface` (`interface_id`),
  CONSTRAINT `fk_interface` FOREIGN KEY (`interface_id`) REFERENCES `api_interface` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `api_param` */

insert  into `api_param`(`id`,`param_zh_name`,`is_null`,`param_cn_name`,`remark`,`create_time`,`update_time`,`param_type`,`sort`,`interface_id`) values (1,'userName',1,'ç”¨æˆ·å',NULL,NULL,NULL,1,1,1),(2,'password',2,'å¯†ç ',NULL,NULL,NULL,1,2,1),(3,'salt',1,'éšæœºæ•°',NULL,NULL,NULL,2,5,1),(4,'company',1,'å…¬å¸åç§°',NULL,NULL,NULL,2,4,1),(5,'address',2,'åœ°å€',NULL,NULL,NULL,2,2,1),(6,'name',1,'å§“å',NULL,NULL,NULL,2,6,2),(7,'duty',1,'èŒåŠ¡',NULL,NULL,NULL,2,7,2),(10,'eee',1,'rrr',NULL,'2017-01-29 14:35:44',NULL,1,4,2),(11,'custom',2,'è‡ªå®šä¹‰',NULL,'2017-01-29 17:20:46',NULL,1,1,2),(12,'eee',1,'rrt',NULL,'2017-01-29 17:26:13',NULL,1,1,2);

/*Table structure for table `api_project` */

DROP TABLE IF EXISTS `api_project`;

CREATE TABLE `api_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) DEFAULT NULL COMMENT 'é¡¹ç›®åç§°',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `create_time` timestamp NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `api_project` */

insert  into `api_project`(`id`,`project_name`,`remark`,`create_time`,`update_time`) values (1,'è®¾å¤‡è¿½æº¯é¡¹ç›®','äºŒäººè‹¥','2017-01-27 17:39:11','2017-02-19 17:38:32');

/*Table structure for table `area_info` */

DROP TABLE IF EXISTS `area_info`;

CREATE TABLE `area_info` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `AREA_CODE` varchar(12) DEFAULT NULL,
  `AREA_NAME` varchar(50) DEFAULT NULL,
  `PID` int(9) DEFAULT NULL,
  `SORT` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `area_info` */

insert  into `area_info`(`ID`,`AREA_CODE`,`AREA_NAME`,`PID`,`SORT`) values (1,'100000','ä¸­å›½',NULL,1);

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `delflag` tinyint(1) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`id`,`company_name`,`remark`,`delflag`,`create_time`,`update_time`) values (1,'åŒ—äº¬é€Ÿè…¾ç§‘æŠ€æœ‰é™å…¬å¸',NULL,0,'2017-01-19 15:53:28','2017-01-23 13:21:49'),(2,'tttttt9999','addf',NULL,'2017-01-22 14:00:08',NULL),(3,'','åŒ—äº¬æ€å¿…æ‹“ç§‘æŠ€æœ‰é™å…¬å¸',NULL,NULL,NULL),(4,'1111','addf',NULL,NULL,NULL),(5,'sdfffdsf111111','addfä¸œæ–¹',NULL,NULL,NULL),(6,'uuuu','addf',NULL,NULL,NULL),(7,'eeeeer44444','erere',NULL,'2017-01-22 18:07:53',NULL);

/*Table structure for table `dict` */

DROP TABLE IF EXISTS `dict`;

CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `dict` */

insert  into `dict`(`ID`,`LABEL`,`VALUE`,`TYPE`,`DESCRIPTION`,`SORT`,`REMARK`,`DEL_FLAG`) values (1,'æ­£å¸¸','0','user','ç”¨æˆ·çŠ¶æ€',1,NULL,NULL),(2,'ç¦ç”¨','1','user','ç”¨æˆ·çŠ¶æ€',2,NULL,NULL),(4,'æ™®é€šç”¨æˆ·','0','user','ç”¨æˆ·ç±»å‹',NULL,NULL,NULL),(5,'ä¼šå‘˜ç”¨æˆ·','1','user','ç”¨æˆ·ç±»å‹',NULL,NULL,NULL);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `COVER` varchar(255) NOT NULL,
  `IMG` varchar(255) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `PRICE` double NOT NULL COMMENT 'æ ‡ä»·',
  `MARKET_PRICE` double DEFAULT NULL COMMENT 'å¸‚åœºä»·',
  `INTRODUCE` varchar(255) DEFAULT NULL COMMENT 'ä»‹ç»',
  `BRIEF` varchar(255) DEFAULT NULL COMMENT 'æ‘˜è¦',
  `IS_SOLD` char(255) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸Šæ¶',
  `SALES` int(11) DEFAULT NULL COMMENT 'é”€é‡',
  `POSTAGE` double DEFAULT NULL COMMENT 'é‚®è´¹',
  `PV` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GOODS_TYPE_ID` (`TYPE_ID`),
  CONSTRAINT `FK_GOODS_TYPE_ID` FOREIGN KEY (`TYPE_ID`) REFERENCES `goods_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`ID`,`NAME`,`COVER`,`IMG`,`TYPE_ID`,`PRICE`,`MARKET_PRICE`,`INTRODUCE`,`BRIEF`,`IS_SOLD`,`SALES`,`POSTAGE`,`PV`) values (1,'aaa','aaa','aaa',1,11,11,'11','1','1',1,1,11);

/*Table structure for table `goods_type` */

DROP TABLE IF EXISTS `goods_type`;

CREATE TABLE `goods_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `goods_type` */

insert  into `goods_type`(`ID`,`PID`,`NAME`,`IMG`) values (1,NULL,'ç”·è£…Â·å¥³è£…',NULL),(2,NULL,'é‹é´Â·ç®±åŒ…',NULL),(3,NULL,'æ‰‹æœºÂ·æ•°ç ',NULL),(4,NULL,'å®¶ç”µÂ·åŠå…¬',NULL),(5,1,'ç”·ä¸Šè¡£','aaa'),(6,1,'ç”·è£¤',NULL),(7,1,'ç”·å†…è¡£',NULL),(8,1,'å¥³è£¤',NULL),(9,3,'ç¬”è®°æœ¬',NULL),(10,3,'å°å¼æœº',NULL),(11,4,'ç”µè§†',NULL);

/*Table structure for table `leave_jpa` */

DROP TABLE IF EXISTS `leave_jpa`;

CREATE TABLE `leave_jpa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `dept_leader_approved` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `hr_approved` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reality_end_time` datetime DEFAULT NULL,
  `reality_start_time` datetime DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report_back_date` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `leave_jpa` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATION_CODE` varchar(50) NOT NULL COMMENT 'æ“ä½œç¼–ç ',
  `CREATER` varchar(20) DEFAULT NULL COMMENT 'æ“ä½œç”¨æˆ·åç§°',
  `CREATE_DATE` datetime NOT NULL COMMENT 'æ—¥å¿—ç”Ÿæˆæ—¶é—´',
  `TYPE` int(11) DEFAULT NULL COMMENT 'æ—¥å¿—ç±»å‹: 1ï¼šå®‰å…¨æ—¥å¿— 2ï¼šè¡¨ç¤ºæ“ä½œæ—¥å¿—',
  `OS` varchar(20) DEFAULT NULL,
  `BROWSER` varchar(20) DEFAULT NULL COMMENT 'æµè§ˆå™¨ç±»å‹',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IPåœ°å€',
  `MAC` varchar(20) DEFAULT NULL COMMENT 'ç‰©ç†åœ°å€',
  `EXECUTE_TIME` int(11) DEFAULT NULL COMMENT 'æ‰§è¡Œæ—¶é—´',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'è¯¦ç»†æè¿°',
  `REQUEST_PARAM` varchar(500) DEFAULT NULL COMMENT 'è¯·æ±‚å‚æ•°',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2391 DEFAULT CHARSET=utf8 COMMENT='æ—¥å½•èµ„æ–™è¡¨';

/*Data for the table `log` */

insert  into `log`(`ID`,`OPERATION_CODE`,`CREATER`,`CREATE_DATE`,`TYPE`,`OS`,`BROWSER`,`IP`,`MAC`,`EXECUTE_TIME`,`DESCRIPTION`,`REQUEST_PARAM`) values (2259,'/system/user/update','admin','2014-12-04 10:25:40',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,22,NULL,'{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb1234\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'),(2260,'/system/user/update','admin','2014-12-04 10:26:14',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,9,NULL,'{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb12346\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'),(2261,'/system/user/update','admin','2014-12-04 10:37:01',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,7,NULL,'{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb123466\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'),(2262,'/system/role/update','admin','2014-12-04 10:48:43',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,215,NULL,'{\"id\":[\"12\"],\"roleCode\":[\"guest212\"],\"sort\":[\"4\"],\"description\":[\"s\"],\"name\":[\"guest22\"]}'),(2263,'/system/user/create','admin','2014-12-05 11:55:03',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,305,NULL,'{\"id\":[\"\"],\"birthday\":[\"2014-12-05\"],\"confirmPassword\":[\"123456\"],\"phone\":[\"\"],\"email\":[\"\"],\"name\":[\"tyty\"],\"plainPassword\":[\"123456\"],\"gender\":[\"1\"],\"loginName\":[\"test\"]}'),(2264,'/system/permission/create','admin','2014-12-13 11:19:15',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,215,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†ï¼Œæ”¯æŒé›†ç¾¤\"],\"name\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†\"],\"permCode\":[\"\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}'),(2265,'/system/permission/update','admin','2014-12-13 11:19:40',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,66,NULL,'{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†ï¼Œæ”¯æŒé›†ç¾¤\"],\"name\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}'),(2266,'/system/permission/update','admin','2014-12-13 11:22:17',NULL,'Windows 7','Firefox 3','127.0.0.1',NULL,186,NULL,'{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†ï¼Œæ”¯æŒé›†ç¾¤\"],\"name\":[\"å®šæ—¶ä»»åŠ¡ç®¡ç†\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheduleJob\"]}'),(2267,'/system/permission/create','admin','2016-04-10 10:57:13',NULL,'Mac OS X','Safari','127.0.0.1',NULL,44,NULL,'{\"id\":[\"\"],\"description\":[\"æµç¨‹ç®¡ç†\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"permCode\":[\"flowmanager\"],\"pid\":[\"\"],\"type\":[\"O\"],\"url\":[\"/flow\"]}'),(2268,'/system/permission/create','admin','2016-04-10 10:57:13',NULL,'Mac OS X','Safari','127.0.0.1',NULL,91,NULL,'{\"id\":[\"\"],\"description\":[\"æµç¨‹ç®¡ç†\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"permCode\":[\"flowmanager\"],\"pid\":[\"\"],\"type\":[\"O\"],\"url\":[\"/flow\"]}'),(2269,'/system/permission/create','admin','2016-04-10 11:04:09',NULL,'Mac OS X','Safari','127.0.0.1',NULL,54,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"/flower\"]}'),(2270,'/system/permission/create','admin','2016-04-10 11:04:09',NULL,'Mac OS X','Safari','127.0.0.1',NULL,67,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"/flower\"]}'),(2271,'/system/permission/update','admin','2016-04-10 11:04:23',NULL,'Mac OS X','Safari','127.0.0.1',NULL,14,NULL,'{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"flower\"]}'),(2272,'/system/permission/update','admin','2016-04-10 11:04:23',NULL,'Mac OS X','Safari','127.0.0.1',NULL,25,NULL,'{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"flower\"]}'),(2273,'/system/permission/update','admin','2016-04-10 11:04:32',NULL,'Mac OS X','Safari','127.0.0.1',NULL,10,NULL,'{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'),(2274,'/system/permission/update','admin','2016-04-10 11:04:32',NULL,'Mac OS X','Safari','127.0.0.1',NULL,16,NULL,'{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'),(2275,'/system/permission/update','admin','2016-04-10 11:04:53',NULL,'Mac OS X','Safari','127.0.0.1',NULL,8,NULL,'{\"id\":[\"72\"],\"icon\":[\"icon-hamburg-product\"],\"sort\":[\"1\"],\"description\":[\"å•†å“ç®¡ç†\"],\"name\":[\"å•†å“ç®¡ç†\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goods\"]}'),(2276,'/system/permission/update','admin','2016-04-10 11:04:53',NULL,'Mac OS X','Safari','127.0.0.1',NULL,14,NULL,'{\"id\":[\"72\"],\"icon\":[\"icon-hamburg-product\"],\"sort\":[\"1\"],\"description\":[\"å•†å“ç®¡ç†\"],\"name\":[\"å•†å“ç®¡ç†\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goods\"]}'),(2277,'/system/permission/update','admin','2016-04-10 11:04:57',NULL,'Mac OS X','Safari','127.0.0.1',NULL,10,NULL,'{\"id\":[\"73\"],\"icon\":[\"icon-hamburg-milestone\"],\"sort\":[\"2\"],\"description\":[\"å•†å“ç±»å‹\"],\"name\":[\"å•†å“ç±»å‹ç®¡ç†\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goodsType\"]}'),(2278,'/system/permission/update','admin','2016-04-10 11:04:57',NULL,'Mac OS X','Safari','127.0.0.1',NULL,16,NULL,'{\"id\":[\"73\"],\"icon\":[\"icon-hamburg-milestone\"],\"sort\":[\"2\"],\"description\":[\"å•†å“ç±»å‹\"],\"name\":[\"å•†å“ç±»å‹ç®¡ç†\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goodsType\"]}'),(2279,'/system/permission/create','admin','2016-04-10 11:08:15',NULL,'Mac OS X','Safari','127.0.0.1',NULL,38,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-standard-book-next\"],\"sort\":[\"1\"],\"description\":[\"\"],\"name\":[\"æ¨¡å‹å·¥ä½œåŒº\"],\"pid\":[\"79\"],\"type\":[\"F\"],\"url\":[\"workflow/model/list\"]}'),(2280,'/system/permission/create','admin','2016-04-10 11:08:15',NULL,'Mac OS X','Safari','127.0.0.1',NULL,50,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-standard-book-next\"],\"sort\":[\"1\"],\"description\":[\"\"],\"name\":[\"æ¨¡å‹å·¥ä½œåŒº\"],\"pid\":[\"79\"],\"type\":[\"F\"],\"url\":[\"workflow/model/list\"]}'),(2281,'/workflow/model/create','admin','2016-04-17 23:13:29',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,35691,NULL,'{\"name\":[\"æµ‹è¯•\"],\"key\":[\"test\"],\"description\":[\"ces\"]}'),(2282,'/workflow/model/delete/2501','admin','2016-04-18 17:10:23',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,46,NULL,'{}'),(2283,'/system/permission/create','admin','2016-04-23 11:02:57',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,74,NULL,'{\"id\":[\"\"],\"type\":[\"F\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"url\":[\"/workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'),(2284,'/system/permission/update','admin','2016-04-23 11:15:11',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,41,NULL,'{\"id\":[\"81\"],\"type\":[\"F\"],\"name\":[\"æµç¨‹ç®¡ç†\"],\"url\":[\"workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'),(2285,'/system/permission/update','admin','2016-04-23 11:16:13',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,18,NULL,'{\"id\":[\"81\"],\"type\":[\"F\"],\"name\":[\"æ´»åŠ¨æµç¨‹\"],\"url\":[\"workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'),(2286,'/system/permission/create','admin','2016-04-25 14:45:22',NULL,'Mac OS X','Chrome','127.0.0.1',NULL,75,NULL,'{\"id\":[\"\"],\"type\":[\"F\"],\"name\":[\"éƒ¨ç½²æµç¨‹ç®¡ç†\"],\"url\":[\"workflow/process-list\"],\"icon\":[\"icon-hamburg-graphic\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'),(2287,'/system/user/create','admin','2017-01-15 19:01:03',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,851,NULL,'{\"id\":[\"\"],\"birthday\":[\"2017-01-19\"],\"confirmPassword\":[\"123456\"],\"phone\":[\"12312\"],\"email\":[\"123@qq.com\"],\"description\":[\"123\"],\"name\":[\"123\"],\"plainPassword\":[\"123456\"],\"gender\":[\"1\"],\"loginName\":[\"13027511182\"]}'),(2288,'/system/user/create','admin','2017-01-18 20:23:12',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,462,NULL,'{\"id\":[\"\"],\"birthday\":[\"2017-01-19\"],\"confirmPassword\":[\"111456\"],\"phone\":[\"123\"],\"email\":[\"123@qq.com\"],\"description\":[\"324324\"],\"name\":[\"1232\"],\"plainPassword\":[\"111456\"],\"gender\":[\"1\"],\"loginName\":[\"2333\"]}'),(2289,'/system/permission/create','admin','2017-01-19 15:57:18',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,941,NULL,'{\"id\":[\"\"],\"icon\":[\"icon-hamburg-basket\"],\"sort\":[\"1\"],\"description\":[\"ç®¡ç†å…¬å¸åŸºæœ¬ä¿¡æ¯\"],\"name\":[\"å…¬å¸ç®¡ç†\"],\"pid\":[\"1\"],\"type\":[\"F\"],\"url\":[\"system/computer/list\"]}'),(2290,'/system/permission/update','admin','2017-01-22 12:04:46',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,390,NULL,'{\"id\":[\"83\"],\"icon\":[\"icon-hamburg-basket\"],\"sort\":[\"1\"],\"description\":[\"ç®¡ç†å…¬å¸åŸºæœ¬ä¿¡æ¯\"],\"name\":[\"å…¬å¸ç®¡ç†\"],\"pid\":[\"1\"],\"type\":[\"F\"],\"url\":[\"system/company/list\"]}'),(2291,'/system/permission/create','admin','2017-01-22 12:52:33',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,388,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æ–°å¢\"],\"permCode\":[\"sys:company:add\"],\"pid\":[\"83\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2292,'/system/permission/create','admin','2017-01-22 12:52:58',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,156,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ä¿®æ”¹\"],\"permCode\":[\"sys:company:update\"],\"pid\":[\"83\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2293,'/system/permission/create','admin','2017-01-22 12:53:19',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,265,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:company:view\"],\"pid\":[\"83\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2294,'/system/company/create','admin','2017-01-22 14:00:09',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,416,NULL,'{\"id\":[\"\"],\"remark\":[\"addf\"],\"companyName\":[\"sdfffdsf\"]}'),(2295,'/system/company/update','admin','2017-01-22 14:09:32',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,382,NULL,'{\"id\":[\"2\"],\"remark\":[\"åŒ—äº¬æ€å¿…æ‹“ç§‘æŠ€æœ‰é™å…¬å¸\"],\"companyName\":[\"åŒ—äº¬æ€å¿…æ‹“ç§‘æŠ€æœ‰é™å…¬å¸\"]}'),(2296,'/system/company/update','admin','2017-01-22 14:13:37',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,22194,NULL,'{\"id\":[\"2\"],\"remark\":[\"addf\"],\"companyName\":[\"1111\"]}'),(2297,'/system/user/update','admin','2017-01-22 14:16:46',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,28622,NULL,'{\"id\":[\"3\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"300\"],\"email\":[\"\"],\"description\":[\"1111\"],\"name\":[\"tiany\"],\"gender\":[\"0\"],\"loginName\":[\"tianyu\"]}'),(2298,'/system/user/update','admin','2017-01-22 14:18:51',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,103652,NULL,'{\"id\":[\"3\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"300\"],\"email\":[\"\"],\"description\":[\"1111\"],\"name\":[\"tiany2\"],\"gender\":[\"0\"],\"loginName\":[\"tianyu\"]}'),(2299,'/system/company/update','admin','2017-01-22 14:22:34',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,103484,NULL,'{\"id\":[\"2\"],\"remark\":[\"addfä¸œæ–¹\"],\"companyName\":[\"sdfffdsf111111\"]}'),(2300,'/system/company/update','admin','2017-01-22 15:38:52',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,120440,NULL,'{\"id\":[\"2\"],\"remark\":[\"addf\"],\"companyName\":[\"uuuu\"]}'),(2301,'/system/company/update','admin','2017-01-22 15:41:29',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,22210,NULL,'{\"id\":[\"2\"],\"remark\":[\"addf\"],\"companyName\":[\"tttttt\"]}'),(2302,'/system/company/update','admin','2017-01-22 15:43:41',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,80519,NULL,'{\"id\":[\"2\"],\"remark\":[\"addf\"],\"companyName\":[\"tttttt9999\"]}'),(2303,'/system/company/create','admin','2017-01-22 18:07:54',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,139,NULL,'{\"id\":[\"\"],\"remark\":[\"erere\"],\"companyName\":[\"eeeeer\"]}'),(2304,'/system/company/update','admin','2017-01-22 18:08:24',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,5933,NULL,'{\"id\":[\"7\"],\"remark\":[\"erere\"],\"companyName\":[\"eeeeer44444\"]}'),(2305,'/system/company/update','admin','2017-01-23 17:56:47',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,509,NULL,'{\"id\":[\"3\"],\"remark\":[\"åŒ—äº¬æ€å¿…æ‹“ç§‘æŠ€æœ‰é™å…¬å¸\"],\"companyName\":[\"\"]}'),(2306,'/system/permission/create','admin','2017-01-27 16:49:01',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,285,NULL,'{\"id\":[\"\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"æ¥å£ç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'),(2307,'/system/permission/create','admin','2017-01-27 16:50:56',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,605,NULL,'{\"id\":[\"\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"é¡¹ç›®ç®¡ç†\"],\"pid\":[\"87\"],\"type\":[\"F\"],\"url\":[\"/system/apiProject/list\"]}'),(2308,'/system/permission/create','admin','2017-01-27 16:52:49',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,167,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æ–°å¢\"],\"permCode\":[\"sys:apiProject:add\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2309,'/system/permission/create','admin','2017-01-27 16:53:12',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,287,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ä¿®æ”¹\"],\"permCode\":[\"sys:apiProject:update\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2310,'/system/permission/create','admin','2017-01-27 16:53:31',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,165,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:apiProject:list\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2311,'/system/permission/create','admin','2017-01-27 16:53:51',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,123,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"åˆ é™¤\"],\"permCode\":[\"sys:apiProject:del\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2312,'/system/permission/update','admin','2017-01-27 17:04:43',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,339,NULL,'{\"id\":[\"88\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"é¡¹ç›®ç®¡ç†\"],\"pid\":[\"87\"],\"type\":[\"F\"],\"url\":[\"system/apiProject/list\"]}'),(2313,'/system/permission/update','admin','2017-01-27 17:07:55',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,200,NULL,'{\"id\":[\"88\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"é¡¹ç›®ç®¡ç†\"],\"pid\":[\"87\"],\"type\":[\"F\"],\"url\":[\"system/api_project/list\"]}'),(2314,'/system/permission/update','admin','2017-01-27 17:27:35',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,440,NULL,'{\"id\":[\"91\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:apiProject:view\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2315,'/system/api_project/create','admin','2017-01-27 17:39:11',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,263,NULL,'{\"id\":[\"\"],\"remark\":[\"\"],\"projectName\":[\"è®¾å¤‡è¿½æº¯é¡¹ç›®\"]}'),(2316,'/system/api_project/update','admin','2017-01-27 17:43:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,390,NULL,'{\"id\":[\"1\"],\"remark\":[\"äºŒäººè‹¥\"],\"projectName\":[\"è®¾å¤‡è¿½æº¯é¡¹ç›®\"]}'),(2317,'/system/permission/create','admin','2017-01-28 09:20:02',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,355,NULL,'{\"id\":[\"\"],\"icon\":[\"\"],\"sort\":[\"2\"],\"description\":[\"\"],\"name\":[\"æ¥å£ç®¡ç†\"],\"pid\":[\"87\"],\"type\":[\"F\"],\"url\":[\"system/api_interface/list\"]}'),(2318,'/system/permission/create','admin','2017-01-28 09:21:17',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,349,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æ–°å¢\"],\"permCode\":[\"sys:apiInterface:add\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2319,'/system/permission/create','admin','2017-01-28 09:21:40',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,74,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ä¿®æ”¹\"],\"permCode\":[\"sys:apiInterface:update\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2320,'/system/permission/create','admin','2017-01-28 09:22:00',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,189,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:apiInterface:view\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2321,'/system/permission/create','admin','2017-01-28 09:22:22',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,151,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"åˆ é™¤\"],\"permCode\":[\"sys:apiInterface:delete\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2322,'/system/permission/update','admin','2017-01-28 09:22:53',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,141,NULL,'{\"id\":[\"92\"],\"description\":[\"\"],\"name\":[\"åˆ é™¤\"],\"permCode\":[\"sys:apiProject:delete\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2323,'/system/permission/update','admin','2017-01-28 09:25:05',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,383,NULL,'{\"id\":[\"87\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"APIç®¡ç†\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'),(2324,'/system/api_interface/create','admin','2017-01-28 11:56:08',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,640,NULL,'{\"id\":[\"\"],\"response\":[\"sdfsdfdsfdsf\"],\"title\":[\"11111\",\"eeeee\"],\"request\":[\"fdfds\"],\"projectId\":[\"\"],\"url\":[\"hdfdsfd\"]}'),(2325,'/system/api_interface/update','admin','2017-01-28 12:02:01',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,170,NULL,'{\"id\":[\"1\"],\"response\":[\"sdfsdfsd\"],\"title\":[\"555\"],\"request\":[\"ffsdfds\"],\"apiMenuId\":[\"4444\"],\"projectId\":[\"1\"],\"url\":[\"hdfdsfd\"]}'),(2326,'/system/api_interface/update','admin','2017-01-28 12:03:27',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,107,NULL,'{\"id\":[\"1\"],\"response\":[\"grhttht\"],\"title\":[\"555\"],\"request\":[\"dddg\"],\"apiMenuId\":[\"555\"],\"projectId\":[\"\"],\"url\":[\"hdfdsfd\"]}'),(2327,'/system/permission/create','admin','2017-01-28 14:09:16',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,407,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æ–°å¢\"],\"permCode\":[\"sys:apiParam:add\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2328,'/system/permission/create','admin','2017-01-28 14:09:32',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,152,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ä¿®æ”¹\"],\"permCode\":[\"sys:apiParam:update\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2329,'/system/permission/create','admin','2017-01-28 14:09:46',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,70,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"åˆ é™¤\"],\"permCode\":[\"sys:apiParam:delete\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2330,'/system/permission/create','admin','2017-01-28 14:11:48',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,200,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:apiParam:view\"],\"pid\":[\"93\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2331,'/system/api_param/create','admin','2017-01-29 14:31:02',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,391,NULL,'{\"id\":[\"\"],\"sort\":[\"1\"],\"paramCnName\":[\"ddd\",\"ddd\"],\"paramType\":[\"1\"]}'),(2332,'/system/api_param/create','admin','2017-01-29 14:34:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,93,NULL,'{\"id\":[\"\"],\"paramzhName\":[\"ddd\"],\"sort\":[\"3\"],\"paramCnName\":[\"ddd\"],\"paramType\":[\"1\"]}'),(2333,'/system/api_param/create','admin','2017-01-29 14:35:44',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,137,NULL,'{\"id\":[\"\"],\"sort\":[\"4\"],\"paramCnName\":[\"rrr\"],\"paramZhName\":[\"eee\"],\"paramType\":[\"1\"]}'),(2334,'/system/api_param/create','admin','2017-01-29 17:20:46',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,121,NULL,'{\"id\":[\"\"],\"sort\":[\"1\"],\"paramCnName\":[\"è‡ªå®šä¹‰\"],\"paramZhName\":[\"custom\"],\"paramType\":[\"1\"]}'),(2335,'/system/api_param/create','admin','2017-01-29 17:26:14',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,974,NULL,'{\"id\":[\"\"],\"sort\":[\"1\"],\"paramCnName\":[\"rrt\"],\"paramZhName\":[\"eee\"],\"paramType\":[\"1\"]}'),(2336,'/system/api_interface/create','admin','2017-01-30 12:48:14',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,399,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfsdf\"],\"title\":[\"22222222\"],\"request\":[\"rrrr\\r\\ndfdsfdsf\"],\"apiMenuId\":[\"122\"],\"projectId\":[\"\"],\"url\":[\"1232132323\"]}'),(2337,'/system/permission/create','admin','2017-02-03 21:06:57',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,714,NULL,'{\"id\":[\"\"],\"icon\":[\"\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"èœå•ç®¡ç†\"],\"pid\":[\"87\"],\"type\":[\"F\"],\"url\":[\"system/api_menu/list\"]}'),(2338,'/system/permission/create','admin','2017-02-03 21:08:04',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,153,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æ–°å¢\"],\"permCode\":[\"sys:apiMenu:add\"],\"pid\":[\"102\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2339,'/system/permission/create','admin','2017-02-03 21:08:21',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,109,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ä¿®æ”¹\"],\"permCode\":[\"sys:apiMenu:update\"],\"pid\":[\"102\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2340,'/system/permission/create','admin','2017-02-03 21:08:38',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,176,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"åˆ é™¤\"],\"permCode\":[\"sys:apiMenu:delete\"],\"pid\":[\"102\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2341,'/system/permission/create','admin','2017-02-03 21:09:00',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,201,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"æŸ¥çœ‹\"],\"permCode\":[\"sys:apiMenu:view\"],\"pid\":[\"102\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2342,'/system/permission/create','admin','2017-02-05 12:03:38',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,400,NULL,'{\"id\":[\"\"],\"description\":[\"\"],\"name\":[\"ç”ŸæˆApiæ–‡æ¡£\"],\"permCode\":[\"sys:apiProject:genApi\"],\"pid\":[\"88\"],\"type\":[\"O\"],\"url\":[\"\"]}'),(2343,'/system/api_interface/create','admin','2017-02-06 19:40:10',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,320,NULL,'{\"id\":[\"\"],\"response\":[\"123123\"],\"title\":[\"111111\"],\"request\":[\"123213\"],\"apiMenuId\":[\"5\"],\"projectId\":[\"1\"],\"url\":[\"3123213\"]}'),(2344,'/system/api_interface/create','admin','2017-02-06 19:57:09',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,442,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfdsf\"],\"title\":[\"test\"],\"request\":[\"sfdsfdsf\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"/ddd/\"]}'),(2345,'/system/api_interface/create','admin','2017-02-06 19:57:16',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,204,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfdsf\"],\"title\":[\"test\"],\"request\":[\"sfdsfdsf\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"/ddd/\"]}'),(2346,'/system/api_interface/create','admin','2017-02-06 19:57:24',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,143,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfdsf\"],\"title\":[\"test\"],\"request\":[\"sfdsfdsf\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"/ddd/\"]}'),(2347,'/system/api_interface/create','admin','2017-02-06 19:57:38',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,134,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfdsf\"],\"title\":[\"test\"],\"request\":[\"sfdsfdsf\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"/ddd/\"]}'),(2348,'/system/api_interface/create','admin','2017-02-06 19:59:14',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,492,NULL,'{\"id\":[\"\"],\"response\":[\"dfsdfdsf\"],\"title\":[\"test\"],\"request\":[\"sfdsfdsf\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"/ddd/\"]}'),(2349,'/system/api_interface/create','admin','2017-02-06 20:16:52',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,78459,NULL,'{\"id\":[\"\"],\"response\":[\"2343242\"],\"title\":[\"wwwwww\"],\"request\":[\"234234\"],\"project.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"444\"]}'),(2350,'/system/api_interface/create','admin','2017-02-06 20:31:04',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,437855,NULL,'{\"id\":[\"\"],\"response\":[\"234234\"],\"title\":[\"yyyy\"],\"request\":[\"34234\"],\"apiProject.projectId\":[\"1\"],\"apiMenu.apiMenuId\":[\"4\"],\"url\":[\"21321321\"]}'),(2351,'/system/api_interface/create','admin','2017-02-06 21:04:47',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,373,NULL,'{\"id\":[\"\"],\"response\":[\"3342r\"],\"title\":[\"rrrrrr\"],\"request\":[\"ewrwerew\"],\"apiMenuId\":[\"5\"],\"projectId\":[\"1\"],\"url\":[\"12433\"]}'),(2352,'/system/api_interface/create','admin','2017-02-06 21:09:43',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,318,NULL,'{\"id\":[\"\"],\"response\":[\"5435435\"],\"title\":[\"234324\"],\"request\":[\"234234\"],\"apiMenuId\":[\"5\"],\"projectId\":[\"1\"],\"url\":[\"45345\"]}'),(2353,'/system/api_interface/update','admin','2017-02-06 21:14:06',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,282,NULL,'{\"id\":[\"12\"],\"response\":[\"5435435\"],\"title\":[\"234324\"],\"request\":[\"234234\"],\"apiMenuId\":[\"5\"],\"projectId\":[\"1\"],\"url\":[\"45345\"]}'),(2354,'/system/api_interface/update','admin','2017-02-06 21:50:02',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,109,NULL,'{\"id\":[\"1\"],\"response\":[\"grhttht\"],\"title\":[\"555\"],\"request\":[\"dddg\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"11333311\"]}'),(2355,'/system/api_interface/update','admin','2017-02-06 21:51:30',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,113,NULL,'{\"id\":[\"1\"],\"response\":[\"grhttht\"],\"title\":[\"555\"],\"request\":[\"dddg\\r\\nä¸œæ–¹\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"11333311\"]}'),(2356,'/system/api_interface/update','admin','2017-02-06 21:51:43',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,68,NULL,'{\"id\":[\"1\"],\"response\":[\"{\\r\\n    \\\"success\\\":true,\\r\\n    \\\"data\\\":{\\r\\n        \\\"SNArray\\\":[\\r\\n            \\\"0010101\\\",\\r\\n            \\\"e2323\\\",\\r\\n            \\\"XMD8263751\\\"\\r\\n        ]\\r\\n    },\\r\\n    \\\"dataModel\\\":null,\\r\\n    \\\"message\\\":null,\\r\\n    \\\"timeStamp\\\":1476955288844,\\r\\n    \\\"total\\\":3,\\r\\n    \\\"count\\\":3\\r\\n}\\r\\n\"],\"title\":[\"555\"],\"request\":[\"dddg\\r\\nä¸œæ–¹\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"11333311\"]}'),(2357,'/system/api_interface/update','admin','2017-02-06 21:51:50',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,110,NULL,'{\"id\":[\"1\"],\"response\":[\"{\\r\\n    \\\"success\\\":true,\\r\\n    \\\"data\\\":{\\r\\n        \\\"SNArray\\\":[\\r\\n            \\\"0010101\\\",\\r\\n            \\\"e2323\\\",\\r\\n            \\\"XMD8263751\\\"\\r\\n        ]\\r\\n    },\\r\\n}\\r\\n\"],\"title\":[\"555\"],\"request\":[\"dddg\\r\\nä¸œæ–¹\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"11333311\"]}'),(2358,'/system/api_interface/update','admin','2017-02-06 21:53:27',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,369,NULL,'{\"id\":[\"1\"],\"response\":[\"{\\r\\n    \\\"success\\\":true,\\r\\n    \\\"data\\\":{\\r\\n        \\\"SNArray\\\":[\\r\\n            \\\"0010101\\\",\\r\\n            \\\"e2323\\\",\\r\\n            \\\"XMD8263751\\\"\\r\\n        ]\\r\\n    },\\r\\n    \\\"dataModel\\\":null,\\r\\n    \\\"message\\\":null,\\r\\n    \\\"timeStamp\\\":1476955288844,\\r\\n    \\\"total\\\":3,\\r\\n    \\\"count\\\":3\\r\\n}\\r\\n\"],\"title\":[\"555\"],\"request\":[\"dddg\\r\\nä¸œæ–¹\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"11333311\"]}'),(2359,'/system/permission/update','admin','2017-02-06 22:12:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,389,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"4\"],\"remark\":[\"\"],\"name\":[\"å‡ºåº“å•æŸ¥è¯¢\"],\"type\":[\"O\"],\"href\":[\"owl\"]}'),(2360,'/system/permission/update','admin','2017-02-06 22:14:36',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,183,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"4\"],\"remark\":[\"\"],\"name\":[\"å‡ºåº“å•æŸ¥è¯¢\"],\"type\":[\"O\"],\"href\":[\"ww\"]}'),(2361,'/system/api_interface/create','admin','2017-02-09 22:05:22',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,793,NULL,'{\"id\":[\"\"],\"title\":[\"è°ƒæ‹¨è®¢å•\"],\"remark\":[\"rwerwerewr\"],\"request\":[\"\",\"\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"/d/find\"]}'),(2362,'/system/api_interface/create','admin','2017-02-09 22:06:07',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,207,NULL,'{\"id\":[\"\"],\"title\":[\"è°ƒæ‹¨è®¢å•\"],\"remark\":[\"rwerwerewrffsff\"],\"request\":[\"werewrew\",\"ewrwerewrew\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"/d/find\"]}'),(2363,'/system/api_interface/create','admin','2017-02-09 22:07:42',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,25,NULL,'{\"id\":[\"\"],\"title\":[\"è°ƒæ‹¨è®¢å•\"],\"remark\":[\"rwerwerewrffsff\"],\"request\":[\"werewrew\",\"ewrwerewrew\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"/d/find\"]}'),(2364,'/system/api_interface/create','admin','2017-02-09 22:09:01',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,209,NULL,'{\"id\":[\"\"],\"title\":[\"è°ƒæ‹¨è®¢å•\"],\"remark\":[\"rwerwerewrffsff\"],\"request\":[\"werewrew\",\"ewrwerewrew\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"/d/find\"]}'),(2365,'/system/api_interface/create','admin','2017-02-09 22:09:59',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,22,NULL,'{\"id\":[\"\"],\"title\":[\"è°ƒæ‹¨è®¢å•\"],\"remark\":[\"rwerwerewrffsff\"],\"request\":[\"werewrew\",\"ewrwerewrew\"],\"method\":[\"POST\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"/d/find\"]}'),(2366,'/system/api_interface/create','admin','2017-02-09 22:11:36',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,25,NULL,'{\"id\":[\"\"],\"title\":[\"14444\"],\"remark\":[\"34534543\"],\"request\":[\"\",\"\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"45345435\"]}'),(2367,'/system/api_interface/create','admin','2017-02-09 22:26:22',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,131,NULL,'{\"id\":[\"\"],\"title\":[\"34545\"],\"remark\":[\"345435\"],\"request\":[\"erwrwer\",\"werwerwe\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"345435\"]}'),(2368,'/system/api_interface/create','admin','2017-02-09 22:27:54',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,28,NULL,'{\"id\":[\"\"],\"title\":[\"11214\"],\"remark\":[\"345435435\"],\"request\":[\"234234\",\"345345\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"6\"],\"url\":[\"3242343\"]}'),(2369,'/system/api_interface/create','admin','2017-02-09 22:29:44',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,22,NULL,'{\"id\":[\"\"],\"response\":[\"234234324\"],\"title\":[\"5235435\"],\"remark\":[\"234234234\"],\"request\":[\"23423423\"],\"method\":[\"GET\"],\"apiProject.projectId\":[\"1\"],\"apiMenuId\":[\"5\"],\"url\":[\"2432342\"]}'),(2370,'/system/api_interface/create','admin','2017-02-09 22:32:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,382,NULL,'{\"id\":[\"\"],\"response\":[\"\"],\"title\":[\"23r234324\"],\"remark\":[\"234234324\"],\"request\":[\"\"],\"method\":[\"GET\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"23423432\"]}'),(2371,'/system/api_interface/update','admin','2017-02-09 22:39:27',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,203,NULL,'{\"id\":[\"13\"],\"response\":[\"ç»•å¼¯å„¿æ— è‹¥\"],\"title\":[\"23r234324\"],\"sort\":[\"\"],\"remark\":[\"234234324\"],\"request\":[\"åƒä¸‡äººç¾¤è‹¥ \"],\"method\":[\"\"],\"apiMenuId\":[\"4\"],\"projectId\":[\"1\"],\"url\":[\"23423432\"]}'),(2372,'/system/api_interface/create','admin','2017-02-09 22:40:03',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,141,NULL,'{\"id\":[\"\"],\"response\":[\"\"],\"title\":[\"test\"],\"sort\":[\"1\"],\"remark\":[\"1212414\"],\"request\":[\"\"],\"method\":[\"GET\"],\"apiMenuId\":[\"3\"],\"projectId\":[\"1\"],\"url\":[\"test\"]}'),(2373,'/system/permission/delete/73','admin','2017-02-09 23:08:55',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,573,NULL,'{}'),(2374,'/system/permission/delete/71','admin','2017-02-09 23:09:06',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,194,NULL,'{}'),(2375,'/system/permission/delete/72','admin','2017-02-09 23:09:16',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,139,NULL,'{}'),(2376,'/system/permission/create','admin','2017-02-19 15:36:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,574,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"4\"],\"remark\":[\"2343\"],\"name\":[\"test\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"rr/dg/g\"]}'),(2377,'/system/permission/create','admin','2017-02-19 15:40:49',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,282,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"3\"],\"remark\":[\"4545\"],\"name\":[\"test\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"/dg/dd\"]}'),(2378,'/system/permission/create','admin','2017-02-19 15:52:57',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,375,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"3\"],\"remark\":[\"444\"],\"name\":[\"test\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"/a/g\"]}'),(2379,'/system/api_menu/create','admin','2017-02-19 15:56:05',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,16030,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"4\"],\"remark\":[\"45555\"],\"name\":[\"test\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"/a/g\"]}'),(2380,'/system/api_menu/create','admin','2017-02-19 16:00:41',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,78190,NULL,'{\"id\":[\"\"],\"parentId\":[\"2\"],\"sort\":[\"6\"],\"remark\":[\"34234\"],\"name\":[\"å…¥åº“å­èœå•\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"/g/h\"]}'),(2381,'/system/api_menu/create','admin','2017-02-19 16:03:36',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,5836,NULL,'{\"id\":[\"\"],\"parentId\":[\"3\"],\"sort\":[\"8\"],\"remark\":[\"34234\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"/g/b\"],\"menuName\":[\"ç›˜ç‚¹å•æŸ¥è¯¢\"]}'),(2382,'/system/api_interface/create','admin','2017-02-19 16:10:28',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,200,NULL,'{\"id\":[\"\"],\"response\":[\"\"],\"title\":[\"today\"],\"sort\":[\"5\"],\"remark\":[\"2343243\"],\"request\":[\"\"],\"method\":[\"GET\"],\"apiMenuId\":[\"5\"],\"projectId\":[\"1\"],\"url\":[\"234234\"]}'),(2383,'/system/api_menu/create','admin','2017-02-19 16:24:27',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,5186,NULL,'{\"id\":[\"\"],\"parentId\":[\"2\"],\"sort\":[\"90\"],\"remark\":[\"7898\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"tyy\"],\"menuName\":[\"gggg\"]}'),(2384,'/system/api_menu/create','admin','2017-02-19 16:54:14',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,7633,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"7\"],\"remark\":[\"456546\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"uuuu\"],\"menuName\":[\"ttttt\"]}'),(2385,'/system/api_menu/create','admin','2017-02-19 16:56:57',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,146,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"7\"],\"remark\":[\"888\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"888\"],\"menuName\":[\"666\"]}'),(2386,'/system/api_menu/update','admin','2017-02-19 17:12:38',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,162,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"7\"],\"remark\":[\"456546\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"uuuu\"],\"menuName\":[\"ttttt\"]}'),(2387,'/system/api_project/update','admin','2017-02-19 17:38:32',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,350,NULL,'{\"id\":[\"1\"],\"remark\":[\"äºŒäººè‹¥\"],\"projectName\":[\"è®¾å¤‡è¿½æº¯é¡¹ç›®\"]}'),(2388,'/system/api_menu/create','admin','2017-02-19 18:38:40',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,384,NULL,'{\"id\":[\"\"],\"parentId\":[\"4\"],\"sort\":[\"45\"],\"remark\":[\"454\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"66\"],\"menuName\":[\"rrrrrr\"]}'),(2389,'/system/api_menu/update','admin','2017-02-19 18:38:55',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,102,NULL,'{\"id\":[\"\"],\"parentId\":[\"4\"],\"sort\":[\"45\"],\"remark\":[\"454\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"66\"],\"menuName\":[\"rrrrrr\"]}'),(2390,'/system/api_menu/create','admin','2017-02-19 18:40:00',NULL,'Windows 7','Firefox 5','127.0.0.1',NULL,224,NULL,'{\"id\":[\"\"],\"parentId\":[\"1\"],\"sort\":[\"45\"],\"remark\":[\"45435\"],\"projectId\":[\"1\"],\"type\":[\"O\"],\"href\":[\"44\"],\"menuName\":[\"new_test\"]}');

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reality_end_time` datetime DEFAULT NULL,
  `reality_start_time` datetime DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `oa_leave` */

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) NOT NULL,
  `pid` int(9) DEFAULT NULL,
  `org_type` varchar(255) DEFAULT NULL,
  `org_sort` int(3) DEFAULT '0',
  `org_level` int(3) DEFAULT NULL,
  `org_code` varchar(255) DEFAULT NULL,
  `area_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`id`,`org_name`,`pid`,`org_type`,`org_sort`,`org_level`,`org_code`,`area_id`) values (1,'æ€»éƒ¨',NULL,'æ€»éƒ¨',1,1,'000000',NULL),(2,'12313',1,'13',31,131,'131313',1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT 'çˆ¶èŠ‚ç‚¹åç§°',
  `NAME` varchar(50) NOT NULL COMMENT 'åç§°',
  `TYPE` varchar(20) DEFAULT NULL COMMENT 'ç±»å‹:èœå•oråŠŸèƒ½',
  `SORT` int(11) DEFAULT NULL COMMENT 'æ’åº',
  `URL` varchar(255) DEFAULT NULL,
  `PERM_CODE` varchar(50) DEFAULT NULL COMMENT 'èœå•ç¼–ç ',
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`ID`,`PID`,`NAME`,`TYPE`,`SORT`,`URL`,`PERM_CODE`,`ICON`,`STATE`,`DESCRIPTION`) values (1,NULL,'ç³»ç»Ÿç®¡ç†','F',1,'','','icon-standard-cog','',''),(2,1,'è§’è‰²ç®¡ç†','F',3,'system/role','','icon-hamburg-my-account','closed',''),(3,1,'ç”¨æˆ·ç®¡ç†','F',2,'system/user','','icon-hamburg-user','closed',''),(4,2,'æ·»åŠ ','O',NULL,'','sys:role:add','','','è§’è‰²æ·»åŠ '),(5,2,'åˆ é™¤','O',NULL,'','sys:role:delete','','','è§’è‰²åˆ é™¤'),(6,2,'ä¿®æ”¹','O',NULL,'','sys:role:update','','','è§’è‰²ä¿®æ”¹'),(7,3,'æ·»åŠ ','O',NULL,'','sys:user:add','','','ç”¨æˆ·æ·»åŠ '),(8,3,'åˆ é™¤','O',NULL,'','sys:user:delete','','','ç”¨æˆ·åˆ é™¤'),(12,1,'æƒé™ç®¡ç†','F',5,'system/permission','','icon-hamburg-login','closed',''),(14,15,'æ•°æ®æºç›‘æ§','F',6,'druid','','icon-hamburg-database','',''),(15,NULL,'ç³»ç»Ÿç›‘æ§','F',5,'','','icon-hamburg-graphic','',''),(16,3,'ä¿®æ”¹','O',NULL,'','sys:user:update','','','ç”¨æˆ·ä¿®æ”¹'),(20,15,'æ—¥å¿—ç®¡ç†','F',7,'system/log','','icon-hamburg-archives','',''),(25,12,'æ·»åŠ ','O',NULL,'','sys:perm:add','','','èœå•æ·»åŠ '),(26,12,'ä¿®æ”¹','O',NULL,'','sys:perm:update','','','èœå•ä¿®æ”¹'),(27,12,'åˆ é™¤','O',NULL,'','sys:perm:delete','','','èœå•åˆ é™¤'),(28,2,'æŸ¥çœ‹','O',NULL,'','sys:role:view','','','è§’è‰²æŸ¥çœ‹'),(29,3,'æŸ¥çœ‹','O',NULL,'','sys:user:view','',NULL,'ç”¨æˆ·æŸ¥çœ‹'),(30,12,'æŸ¥çœ‹','O',NULL,'','sys:perm:view','',NULL,'æƒé™æŸ¥çœ‹'),(31,20,'åˆ é™¤','O',NULL,'','sys:log:delete','',NULL,'åˆ é™¤æ—¥å¿—'),(32,20,'å¯¼å‡ºexcel','O',NULL,'','sys:log:exportExcel','',NULL,'å¯¼å‡ºæ—¥å¿—excel'),(33,3,'æŸ¥çœ‹ç”¨æˆ·è§’è‰²','O',NULL,'','sys:user:roleView','',NULL,'æŸ¥çœ‹ç”¨æˆ·è§’è‰²'),(34,2,'ä¿å­˜æˆæƒ','O',NULL,'','sys:role:permUpd','',NULL,'ä¿å­˜ä¿®æ”¹çš„è§’è‰²æƒé™'),(35,3,'ä¿®æ”¹ç”¨æˆ·è§’è‰²','O',NULL,'','sys:user:roleUpd','',NULL,'ä¿®æ”¹ç”¨æˆ·æ‹¥æœ‰çš„è§’è‰²'),(36,2,'æŸ¥çœ‹è§’è‰²æƒé™','O',NULL,'','sys:role:permView','',NULL,'æŸ¥çœ‹è§’è‰²æ‹¥æœ‰çš„æƒé™'),(37,15,'å®šæ—¶ä»»åŠ¡ç®¡ç†','F',NULL,'system/scheduleJob','','icon-hamburg-full-time',NULL,'å®šæ—¶ä»»åŠ¡ç®¡ç†ï¼Œæ”¯æŒé›†ç¾¤'),(38,15,'cronè¡¨è¾¾å¼ç”Ÿæˆ','F',NULL,'system/scheduleJob/quartzCron','','icon-hamburg-future',NULL,''),(39,1,'èœå•ç®¡ç†','F',4,'system/permission/menu','','icon-hamburg-old-versions',NULL,''),(40,1,'å­—å…¸ç®¡ç†','F',6,'system/dict',NULL,'icon-hamburg-address',NULL,'æ•°æ®å­—å…¸ç®¡ç†'),(45,39,'ä¿®æ”¹','O',NULL,'','sys:perm:update',NULL,NULL,'èœå•ç®¡ç†'),(58,39,'æ·»åŠ ','O',NULL,'','sys:perm:add',NULL,NULL,'èœå•ç®¡ç†'),(59,39,'åˆ é™¤','O',NULL,'','sys:perm:delte',NULL,NULL,'èœå•ç®¡ç†'),(61,40,'æ·»åŠ ','O',NULL,'','sys:dict:add',NULL,NULL,'å­—å…¸ç®¡ç†'),(62,40,'åˆ é™¤','O',NULL,'','sys:dict:delete',NULL,NULL,'å­—å…¸ç®¡ç†'),(63,40,'ä¿®æ”¹','O',NULL,'','sys:dict:update',NULL,NULL,'å­—å…¸ç®¡ç†'),(68,20,'æŸ¥çœ‹','O',NULL,'','sys:log:view',NULL,NULL,'æŸ¥çœ‹æ—¥å¿—'),(69,40,'æŸ¥çœ‹','O',NULL,'','sys:dict:view',NULL,NULL,'å­—å…¸ç®¡ç†'),(70,39,'æŸ¥çœ‹','O',NULL,'','sys:perm:menu:view',NULL,NULL,'èœå•ç®¡ç†'),(74,1,'åŒºåŸŸä¿¡æ¯','F',7,'system/area',NULL,'icon-hamburg-world',NULL,'ç®¡ç†è¡Œæ”¿åŒºåˆ’'),(75,1,'æœºæ„ç®¡ç†','F',8,'system/organization',NULL,'icon-cologne-home',NULL,'ç»„ç»‡æœºæ„ç®¡ç†'),(76,3,'æŸ¥çœ‹ç”¨æˆ·æœºæ„','O',NULL,'','sys:user:orgView',NULL,NULL,'æŸ¥çœ‹ç”¨æˆ·æœºæ„'),(77,3,'ä¿®æ”¹ç”¨æˆ·æœºæ„','O',NULL,'','sys:user:orgUpd',NULL,NULL,'ä¿®æ”¹ç”¨æˆ·æ‰€åœ¨çš„æœºæ„'),(79,NULL,'æµç¨‹ç®¡ç†','F',NULL,'',NULL,'icon-standard-arrow-switch',NULL,''),(80,79,'æ¨¡å‹å·¥ä½œåŒº','F',1,'workflow/model/list',NULL,'icon-standard-book-next',NULL,''),(81,79,'æ´»åŠ¨æµç¨‹','F',NULL,'workflow/processinstance/running',NULL,'icon-hamburg-equalizer',NULL,''),(82,79,'éƒ¨ç½²æµç¨‹ç®¡ç†','F',NULL,'workflow/process-list',NULL,'icon-hamburg-graphic',NULL,''),(83,1,'å…¬å¸ç®¡ç†','F',1,'system/company/list',NULL,'icon-hamburg-basket',NULL,'ç®¡ç†å…¬å¸åŸºæœ¬ä¿¡æ¯'),(84,83,'æ–°å¢','O',NULL,'','sys:company:add',NULL,NULL,''),(85,83,'ä¿®æ”¹','O',NULL,'','sys:company:update',NULL,NULL,''),(86,83,'æŸ¥çœ‹','O',NULL,'','sys:company:view',NULL,NULL,''),(87,NULL,'APIç®¡ç†','F',NULL,'',NULL,'',NULL,''),(88,87,'é¡¹ç›®ç®¡ç†','F',NULL,'system/api_project/list',NULL,'',NULL,''),(89,88,'æ–°å¢','O',NULL,'','sys:apiProject:add',NULL,NULL,''),(90,88,'ä¿®æ”¹','O',NULL,'','sys:apiProject:update',NULL,NULL,''),(91,88,'æŸ¥çœ‹','O',NULL,'','sys:apiProject:view',NULL,NULL,''),(92,88,'åˆ é™¤','O',NULL,'','sys:apiProject:delete',NULL,NULL,''),(93,87,'æ¥å£ç®¡ç†','F',2,'system/api_interface/list',NULL,'',NULL,''),(94,93,'æ–°å¢','O',NULL,'','sys:apiInterface:add',NULL,NULL,''),(95,93,'ä¿®æ”¹','O',NULL,'','sys:apiInterface:update',NULL,NULL,''),(96,93,'æŸ¥çœ‹','O',NULL,'','sys:apiInterface:view',NULL,NULL,''),(97,93,'åˆ é™¤','O',NULL,'','sys:apiInterface:delete',NULL,NULL,''),(98,93,'æ–°å¢','O',NULL,'','sys:apiParam:add',NULL,NULL,''),(99,93,'ä¿®æ”¹','O',NULL,'','sys:apiParam:update',NULL,NULL,''),(100,93,'åˆ é™¤','O',NULL,'','sys:apiParam:delete',NULL,NULL,''),(101,93,'æŸ¥çœ‹','O',NULL,'','sys:apiParam:view',NULL,NULL,''),(102,87,'èœå•ç®¡ç†','F',NULL,'system/api_menu/list',NULL,'',NULL,''),(103,102,'æ–°å¢','O',NULL,'','sys:apiMenu:add',NULL,NULL,''),(104,102,'ä¿®æ”¹','O',NULL,'','sys:apiMenu:update',NULL,NULL,''),(105,102,'åˆ é™¤','O',NULL,'','sys:apiMenu:delete',NULL,NULL,''),(106,102,'æŸ¥çœ‹','O',NULL,'','sys:apiMenu:view',NULL,NULL,''),(107,88,'ç”ŸæˆApiæ–‡æ¡£','O',NULL,'','sys:apiProject:genApi',NULL,NULL,''),(108,NULL,'å‡ºåº“å•æŸ¥è¯¢','O',4,NULL,NULL,NULL,NULL,NULL),(109,NULL,'å‡ºåº“å•æŸ¥è¯¢','O',4,NULL,NULL,NULL,NULL,NULL),(110,NULL,'test','O',4,NULL,NULL,NULL,NULL,NULL),(111,NULL,'test','O',3,NULL,NULL,NULL,NULL,NULL),(112,NULL,'test','O',3,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('scheduler','test1','testgroup','0/5 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('scheduler','test1','testgroup',NULL,'com.tianyu.jty.system.service.TaskA','0','1','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0scheduleJobsr\0(com.tianyu.jty.system.entity.ScheduleJob\0\0\0\0\0\0\0\0L\0	classNamet\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0descriptionq\0~\0	L\0groupq\0~\0	L\0nameq\0~\0	L\0statusq\0~\0	xpt\0#com.tianyu.jty.system.service.TaskAt\0\r0/5 * * * * ?pt\0	testgroupt\0test1t\01x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('scheduler','STATE_ACCESS'),('scheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('scheduler','pc-PC1487500603895',1487501654409,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('scheduler','test1','testgroup','test1','testgroup',NULL,1459838530000,1459838525000,5,'PAUSED','CRON',1421206412000,0,NULL,0,'');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`ID`,`NAME`,`ROLE_CODE`,`DESCRIPTION`,`SORT`,`DEL_FLAG`) values (1,'admin','admin','admin',2,NULL),(5,'guest','guest','guest',3,NULL),(13,'superadmin','superadmin','è¶…çº§ç®¡ç†å‘˜',1,NULL);

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`) USING BTREE,
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`ID`,`ROLE_ID`,`PERMISSION_ID`) values (28,5,1),(61,13,1),(62,13,3),(63,13,16),(64,13,7),(65,13,2),(66,13,4),(67,13,5),(68,13,6),(69,13,12),(70,13,25),(71,13,26),(72,13,27),(74,13,15),(75,13,14),(76,13,20),(77,13,8),(133,5,15),(162,5,39),(164,5,58),(176,5,40),(194,13,28),(195,13,34),(196,13,36),(197,13,29),(198,13,33),(199,13,35),(200,13,30),(201,13,39),(202,13,45),(203,13,58),(204,13,59),(205,13,40),(206,13,61),(207,13,62),(208,13,63),(209,13,31),(210,13,32),(211,13,37),(212,13,38),(215,5,69),(216,5,20),(219,5,68),(220,5,38),(222,5,70),(223,5,3),(227,5,29),(228,5,33),(229,5,35),(231,5,2),(234,5,28),(235,5,45),(236,5,59),(239,5,36),(256,1,87),(257,1,88),(258,1,89),(259,1,90),(260,1,91),(261,1,92),(262,1,1),(263,1,2),(264,1,4),(265,1,5),(266,1,6),(267,1,28),(268,1,34),(269,1,36),(270,1,3),(271,1,7),(272,1,8),(273,1,16),(274,1,29),(275,1,33),(276,1,35),(277,1,76),(278,1,77),(279,1,12),(280,1,25),(281,1,26),(282,1,27),(283,1,30),(284,1,39),(285,1,45),(286,1,58),(287,1,59),(288,1,70),(289,1,40),(290,1,61),(291,1,62),(292,1,63),(293,1,69),(294,1,74),(295,1,75),(296,1,83),(297,1,84),(298,1,85),(299,1,86),(300,1,79),(301,1,80),(302,1,81),(303,1,82),(304,1,15),(305,1,14),(306,1,20),(307,1,31),(308,1,32),(309,1,68),(310,1,37),(311,1,38),(315,13,70),(316,13,69),(317,13,74),(318,13,83),(319,13,84),(320,13,85),(321,13,86),(322,13,75),(323,13,68),(324,13,87),(325,13,88),(326,13,89),(327,13,90),(328,13,91),(329,13,92),(330,13,79),(331,13,80),(332,13,81),(333,13,82),(337,1,93),(338,1,94),(339,1,95),(340,1,96),(341,1,97),(342,13,93),(343,13,94),(344,13,95),(345,13,96),(346,13,97),(347,1,98),(348,1,99),(349,1,100),(350,1,101),(351,1,102),(352,1,103),(353,1,104),(354,1,105),(355,1,106),(356,1,107);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `description` text,
  `login_count` int(11) DEFAULT NULL,
  `previous_visit` datetime DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `del_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`Id`,`login_name`,`name`,`password`,`salt`,`birthday`,`gender`,`email`,`phone`,`icon`,`create_date`,`status`,`description`,`login_count`,`previous_visit`,`last_visit`,`del_flag`) values (1,'admin','admin','159ae5f48f14e89f3f9f54dc995f1f276d472b54','3d06a5c14d010804','2014-03-16 22:44:39',1,'779205344@qq.com','123456789','aaa','2014-03-20 14:38:57','0',NULL,146,'2017-02-09 23:08:54','2017-02-19 16:24:22',NULL),(3,'tianyu','tiany2','1e8df4b59b3a3ab452ed1707ad3cb1a8e63a0630','bb2aa40007ad1238','2014-04-02 00:00:00',0,'','300','','2014-04-02 11:49:13','0','1111',NULL,NULL,NULL,NULL),(5,'test','tyty11','dc6d230074477c8d736bfe0205260e9320565aa6','94886d7223c80850','2014-12-05 00:00:00',1,'','',NULL,'2014-12-05 11:55:03','1','ss',1,NULL,'2014-12-14 00:09:27',NULL),(6,'superadmin','è¶…çº§ç®¡ç†å‘˜','df894ac0dd60772f22b5d67fe5d8b04fb4c9188d','97efb48ee6adff63','2015-01-15 00:00:00',1,'779205344@qq.com','13721035120',NULL,'2015-01-15 15:55:37',NULL,'è¶…çº§ç®¡ç†å‘˜',NULL,NULL,NULL,NULL),(7,'13027511182','123','9b45ece917f42ce976b853e363e3ac3e9011fa81','995673d53057153c','2017-01-19 00:00:00',1,'123@qq.com','12312',NULL,'2017-01-15 19:01:03',NULL,'123',NULL,NULL,NULL,NULL),(8,'2333','1232','0a4914ac4f4e86403d462962497d330e8d494e78','1330954f2a577758','2017-01-19 00:00:00',1,'123@qq.com','123',NULL,'2017-01-18 20:23:12',NULL,'324324',NULL,NULL,NULL,NULL);

/*Table structure for table `user_org` */

DROP TABLE IF EXISTS `user_org`;

CREATE TABLE `user_org` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(9) NOT NULL,
  `org_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user_org` */

insert  into `user_org`(`id`,`user_id`,`org_id`) values (8,6,1);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`ID`,`USER_ID`,`ROLE_ID`) values (1,1,1),(19,3,5),(32,5,5),(35,6,13),(36,6,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
