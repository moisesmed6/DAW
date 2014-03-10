-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2014 a las 11:39:08
-- Versión del servidor: 5.6.11
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `noticias`
--
CREATE DATABASE IF NOT EXISTS `noticias` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `noticias`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `seccion` mediumint(8) NOT NULL DEFAULT '0',
  `cabecera` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `texto` text COLLATE latin1_spanish_ci NOT NULL,
  `fecha` varchar(12) COLLATE latin1_spanish_ci NOT NULL DEFAULT '20030000',
  `foto` varchar(40) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'n/a',
  `precio` double DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cabecera` (`cabecera`),
  KEY `fecha` (`fecha`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=93 ;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id`, `seccion`, `cabecera`, `texto`, `fecha`, `foto`, `precio`) VALUES
(1, 3, 'Kadazuro.blog', 'pues nada, estoy estrenando blog =)\r\npienso usar esto como libreta de apuntes o diario, cosas que vaya descubriendo (o que me cuenten), tips que considere que vale la pena documentar, entre otros.\r\nque podr?s encontrar aqui?\r\npues, tips, trucos, ma?as, mini-tutos, c?digo y talvez alguna an?ctoda que me suceda ( digo, algo tendr? que poner xDDD)\r\npues nada, bienvenidos a mi diario =)\r\npd.\r\nesto se ve muy plano, voy a ver quien m?s tiene movabletype ( el backend )\r\npara ver si me presta sus .css =D', '20020524', 'N/A', 12),
(2, 1, 'Pereza, madre de la inventiva', 'Estaba haciendo un select para el trabajo, a la hora de imprimir el output para flash me di cuenta que eran 34 columnas, puff!, iba por la segunda cuando me puse a buscar una forma m?s ?ptima para hacerlo\r\nPara los que no saben de que hablo, generalmente las impresiones del resultado se hacen asi.\r\nlo del contador es por si se ocupa imprimir mas de un juego de registros, el resultado seria \r\nEstuve un rato junto con roger ( un compa de trabajo ), hasta que logramos imprimir el nombre del campo ( en la base de datos ) junto con el valor sin hacer mucho c?digo.\r\nmysql_field_name recibe dos par?metros, el primero es el resultado de la base de datos, junto con el numero de columna, esto lo resolvemos facilmente debido a que lo estamos metiendo en un loop, con un contador hasta que se sobrepase el largo del array.\r\nel ejemplo devuelve est? para solo un registro, pero no debe haber problema el agregarle un contador junto al nombre del campo\r\nnada, ahi queda por si a alguien le sirve.', '20021116', 'N/A', 34),
(3, 1, 'Haciendo una cuadrícula', 'Hasta hace poco para hacer una cuadrícula multiplicaba el las columnas deseadas por las filas, luego hacia un bucle ( loop ) hasta que llegara a ese total, dentro del bucle revisaba cuando llegara al total de filas, que me aumentara una unidad a las columnas para que asi se acodaran hacia abajo\r\nalgo como esto:\r\nnota:\r\nen la libreria hay un MovieClip con linkage id "clip" de 10x10\r\n\r\nesto me tard? 84ms en una athlon 1.400\r\nleyendo el libro de hall y wan vi una nueva forma mas optimizada, ?sta es usar dos bucles anidados, m?s sencilla y más rápida =)\r\naquí el código.\r\nnota :\r\nSigue habiendo un MovieClip en la librería con linkage id "clip" de 10x10\r\ncon esta otra tardé 68 ms. en la misma máquina.\r\nestá bonito esto de leer libritos ^_^\r\n', '20021119', 'N/A', 54),
(4, 2, 'En tierras míticas', 'bueno, desde el dia 21 de diciembre, hasta el próximo 2 de enero, ando por tierras míticas, y algo alejado de la pc.\r\nmientras tanto espero pasen unas buenas fiestas navideñas y fin de a?o junto a sus seres queridos.\r\nun abrazo.\r\nkada.', '20031126', 'N/A', 12),
(5, 1, 'Evitando el mouse', 'en flashLa preguntaron por el efecto del movieclip que le huye al puntero del rat?n, efecto visible en el site de mariscal\r\naqui hay una forma sencilla de como hacerlo =)\r\n\r\n*posteo echo con fines educativos.\r\ncopiar en el primer frame de la movie y darle probar (ctrl+enter). \r\n', '20031106', 'N/A', 11),
(6, 2, 'tabIndex', 'Una forma f?cil de setear el tabIndex de los input, es metiendo el nombre de estos campos en un array en el orden en que se quiere sean ordenados, luego se pasan por una funcion donde ?sta setea los valores.\nEn la l?nea de tiempo tengo 6 campos de texto con nombre uno,dos,tres\nEn el array campos, pongo los nombres de los inputs, esto hace referencia a los mismos.\nluego el argumento from de la funci?n es el n?mero con el que quiero que el tab index empieze.\nSi se le quisiera hacer focus al primer campo, basta con poner\nSelection.setFocus(campos[0]);\n=)', '20110408', '1063305321.jpg', 43),
(7, 2, 'setInveral en componentes', 'estaba haciendo un componente, que tenia que desplegarser por cierto tiempo y luego desaparecer, para lo cual utilizaba setInterval.\r\nA la hora de hacer el intervalID, lo ponia dentro del componente, este me llamaba a la funci?n pero no se quitaba (clearInterval(intervalID)) =(\r\nLeyendo la referencia, vi que se le podian pasar argumentos al setInterval, asi que le pas? el objeto mismo, y todo fu? alegr?a.\r\nejemplo.\r\n1.hacer un grafico en el escenario ( en mi caso es un c?rculo )\r\n2.seleccionarlo y presionar F8\r\n3.ponerle nombre y linkageID "clip" (haciendo click en export for AS)\r\n4.seleccionarlo en la librer?a, boton derecho y click en component definition\r\n5.click en el m?s de par?metros ( de echo no vamos a ocupar ning?n par?metro, pero es para que flash sepa que es un componente xDD)\r\n6.doble click en "clip" en la librer?a para entrar a editarlo\r\n7.en un layer nuevo poner esto.\r\n8. ahora salimos de la librer?a y en el primer frame de la linea de tiempo principal poner esto otro.\r\nCrtl+enter y listo. \r\nlo que hace es atachar el clip, que permanecer? en el escenario 2 segundos, luego har? fadeOut hasta desaparecer. este temporizador es usando setInterval.\r\nfin del cuento =).\r\nsuerT\r\nkada.\r\n', '20031113', 'N/A', 22),
(8, 2, 'granatta+kadazuro = carmenHeras.org', 'pos eso, que acabamos de terminar un site, dani granatta y una servilleta. dani es culpable del front-end y yo del back-end.(si no jala, es el server), jeje.\r\nsi se quieren dar una vuelva por el site, pueden postear sus opiniones aqui =), mucho se les agradece.\r\ncarmenHeras.org', '20030215', 'N/A', 54),
(9, 2, 'setInterval vs EnterFrame', 'Cuando se integr? el objeto Date en flash, empezaron a surgir los relojes en flash, para la actualizaci?n de la informaci?n se sol?a hacer en el evento EnterFrame\r\nEsto en flashmx no est? del todo mal, pero para sacar ventajas de nuevas funciones como el setInterval, siento que es mejor poner el reloj a que se actualize cada segundo, envez de cada entrada a frame.\r\nsupongamos que el framerate de la pel?cula es de 24fps, con enterFrame se estar?a actualizando el reloj 24 veces por segundo, mientras que con setInterval, lo har?amos una sola vez, ahorrando recursos de cpu ( que luego podemos gastar en otras cosas ;) )\r\naqu? hay un c?digo de ejemplo.\r\n\r\nclaro si se quiere hacer el reloj m?s agradable para la vista, se pude poner un campo de texto con nombre de instacia reloj con el tipo de fuente preferido exportando s?lo n?meros, dos puntos":", y las letras "amp", si se desea exportar las fuentes, claro est?. ', '20030519', 'N/A', 56),
(10, 2, '[code] posteando c?digos[/code]', 'en vista de problemillas con la gente que ponia c?digos, le met? un plugin ( osea un parche) al blog.\r\nahora cuando posteen c?digo por favor encierrelo en etiquetas\r\n[code] [/code]\r\no luego de poner el c?digo lo seleccionan y presionan el bot?n que puse en el form de comentarios.\r\ngracias y saludos.\r\nkada.', '20031020', 'N/A', 55),
(11, 2, 'Emoticones en flash', 'a la hora de hacer aplicaciones interactivas en flash, como chats o servicios de mensajer?a instantanea, flash se ve?a limitado porque no se pod?an mostrar emoticons ( ?conos gestuales ), dentro de los campos de textos.\r\nun d?a de estos en un post en FlashLA se posti? un mensaje en el que decia que se pod?a probar hacer una fuente nueva con los emotions "escondidos" o puestos en fuentes que generalmente no usamos.\r\naqu? el resultado.\r\nlos emoticons son los usuales ( :) ;) :( :| :D :S :O ).\r\nel problema es que hay que exportar las fuentes, por lo que la fuente se ve suavisada, para eso me bas? en una fuente pixel de miniml, as? la fuente es m?s legible.\r\nEntre las limitates est? que por ser fuentes no se pueden poner colores de relleno a los emoticons, pero vamos por lo menos es un inicio ;)\r\nzip con archivos fla y ttf aqu', '20030128', '1063305321.jpg', 34),
(12, 2, 'ffm FlashForMexico', 'Est?n todos invitados al primer Festival Flash en M?xico a llevarse a cabo los dias 2-4 de abril.\r\nen el Evento habr?n talleres y conferencias, con gente conocida en el medio mexicano ( y yo ).\r\nLa organizaci?n del evento esta a cargo de migue de GrupoW y la gente de la Universidad Tecnol?gica de Coahuila. Se espera una asistencia de 700 almas.\r\nFelicitaciones a migue por el excelente trabajo echo hasta ahora.\r\nm?s info en el site de ffm', '20030106', 'N/A', 23.45),
(13, 2, 'De c?rculos y tri?ngulos', 'Nada, que este swf muestra una bola recoriendo una circunferencia, mientras v? dibujando el tri?ngulo rect?ngulo que se forma con el nuevo ?ngulo.\r\nnada nuevo, pero se ve bonito =).\r\npd. a ver si alguien de multi-net (toluca). me echa la mano, con la instalaci?n de internet de la cuenta 1925, ya que me estoy acostumbrando a no hacer nada de noche-madrugada.', '20030127', '1063305332.jpg', NULL),
(14, 2, 'Amigos', 'Ayer tuve el placer de conocer a migue w de grupoW, pasamos ratos amenos, luego fuimos a casa y seguimos hablando (birras inclu?das)hasta eso de las 2 am.\nmigueW, azul, sa?l, ale y kada.\ngracias por venir migue =)', '20060107', '', NULL),
(15, 2, 'Variables de s?lo lectura', 'en un post de flashcoders ven?a esta forma de como crear variables de s?lo lectura, supongo que a m?s de uno nos ser? ?til =)\neste es un ejemplo\nviene siendo muy ?til a la hora de trabajar en grupo, para asi tener variables no modificables =)', '20110207', '1063305332.jpg', NULL),
(16, 1, 'What is pi?', 'para los que estan acostumbrados a ver a pi como 3.1415 o las veces en que el di?metro de un circulo entra en su circunferencia, pues buscando en internet nos damos cuenta "pi" es mucho mas que eso.\r\n3.1415926535897932384626433832795028841971693993751058209749445923\r\n078164062862089986280348253421170679821480865132823066470938446095\r\n505822317253594081284811174502841027019385211055596446229489549303\r\n819644288109756659334461284756482337867831652712019091456485669234\r\n603486104543266482133936072602491412737245870066063155881748815209\r\n209628292540917153643678925903600113305305488204665213841469519415\r\n116094330572703657595919530921861173819326117931051185480744623799\r\n62749567351885752724891227938183011949129833673362440656643086021..\r\n...\r\nel cuento sigue y sigue y sigue.\r\npara los que si quieren aprender los n?meritos hice un wallpaper estilo matrix con pi.', '20060212', '', 18),
(17, 2, 'stop/play a todas las movies', 'supongamos que tenemos varias animaciones en el timeLine, supongamos tambi?n que tenemos varios clips animados dentro de otros clips que tambi?n estan animados.\r\nahora digamos que queremos detener todas las movies en un momento dado, ser?a tedioso tener que hacer un stop()/play() por cada movie cierto?\r\nes aqu? cuando nuestos amigos for in y typeof unen sus fuerzas para echarnos una mano.\r\nbasta con un stopAllMovies(this) en _level0, para que tooodas las movies que esten en el escenario con animacion (tween/motion) se detengan, o playAllMovies(this) para que sigan.\r\nahora, como que dos funciones para play/stop es mucho, ya que s?lo cambia la accion. qu? tal si mejor hacemos una sola funci?n para eso, asi le pasar?amos el comando de lo que tiene que hacer y listo.\r\nahora har?amos algo como esto manageMovies(this,"stop") o manageMovies(this,"play"), para tener el mismo resultado que con las otras dos funciones.\r\nen este swf, hay dos movieClips con animaci?n y otras dos que cotienen movieClip animadas\r\nhaz click en el escenario para stop/play de las movies.\r\nel c?digo es este.', '20030222', '1063305376.jpg', NULL),
(18, 1, 'La cuenta final', 'jeje, como que el t?tulo no es muy adecuado sobre todo en tiempos de guerra, pero bue..\nestaba haciendo jugando con flash, y pues como ya falta poco para el FlashForMexico, se me ocurri? hacer un "cuenta atr?s" desde ahora hasta la fecha de la inauguraci?n.\ncopiar , pegar en flash, ctrl + enter.\nA la hora de preguntarle a migue si le gustar?a ponerlo, a este le gust? la idea, por lo que le hice uno animado, m?s bonito; bueno, ese ya luego lo veremos en l?nea.\npor ahora les dejo este para jueguen un ratito.', '20030226', 'N/A', NULL),
(19, 2, 'random _x,_y', 'Y ?nico en un post en FlashLA se preguntaba como hacer para duplicar clips en un cuadro, pero que estos no se encimaran.\r\npara esto opt? por hacer un array bidimensional, donde fuera "apuntando" los _x, _y que ya hab?an sido tomados.\r\nal final qued? algo como esto.\r\npara bajar el fla, click aqu?\r\n', '20030231', '1063305369.jpg', NULL),
(20, 2, 'ffm: gracias a todos', 'concluimos el pasado viernes, una de las mejores experiencias que la web puede dejar : el conocer y compartir amigos.\nes impresionantse el ver como los nick de messenger y/o chats "toman forma" cuando se tiene la persona al frente. y son eventos como el de flashForMexico que nos permiten conocer a la mayor?a de la comunidad con la que compartimos todos los dias\nel evento.\nFelicitaciones a la gente de grupow ( mike, ulises, homero, raul ...) por hacer de esto un evento de ?xito como lo fu?, a las amables personas de la UTC y en especial a Alejandro.\na mike y ale una felicitacion extra por estar siempre al tanto de nosotros, velando porque nada nos faltara, que no nos perdieramos, que comieramos y todos esos bellos detalles, que no son m?s que una muestra que la web deja amigos.\ngracias a todos los conferencias por la atenciones conmingo y mi se?ora, por preocuparse con nosotros.\ndani, rolf, sangles, fer, ros, jorge, dani meneses,\na nuestros amigos conocidos\noscar, roger, azul, webas, pcman, chica_ska, nitroboy\nal gran ausente vik, que por motivos de salud no pudo venir, pero siempre est? al tanto de nosotros, que te recuperes =)\na los alumnos de taller..., en fin a toda la gente linda que de una manera u otra interactuaron con el grupo y con mi persona.\na los que asistieron a mi conferencia ( por asistir y por no aventarme nada )\naqu? es cuando uno dice que el 100 se queda corto para calificar un evento de tan buena calidad.\nagradezco a nombre de ale y mios propios a oscar mondrag?n y a pablo gonz?lez por todas las molestias que se tomaron con nosotros.\nagradecimientos a cheli por cuidad de nuestro hijo xam, mientras andabamos en saltillo ( xam es nuestro gatito ).\nesperamos que esto se repita en el pr?ximo evento y por supuesto si me invitan =)\nel misterio del evento fu?: qui?n diablos fu? el que hizo las gorras piratas del evento???\n', '20110306', 'N/A', NULL),
(21, 2, 'ffm: de libros y granattas', 'uno de mis mejores amigos dani granatta, hab?a traido muestras de su libro gu?a pr?ctica de actionScript ( como 30 unidades ), dani no sab?a como venderlos, ya que como era de esperar eran m?s las personas interezadas en comprar en libro que la existencia de los mismos.\r\nal terminar su conferencia dani, el pasado jueves 3 de abril, simplemente les invito a los oyentes interezados a comprar el libro a que se acercaran\r\nluego de su conferencia en flashForMexico, el resultado no fue otro sino un tipo de mercado persa.\r\naqui hay una muestra.\r\nhay que tomar en cuenta que el libro se estaba vendiendo a $174 (pesosMex) y que el vendedor no est?ba acostumbrado a la moneda =)\r\nfelicidades quillo por la venta por el libro, y gracias por acercarte por ac? en m?xico.', '20030306', '1063305351.jpg', 67),
(22, 2, 'FlashRemoting v.php', 'amfphp es el equivalente a flashremoting para php.\nme lo baj? esta ma?ana, y las pruebas echas son alentadoras.\nsu funcionamiento es igual ( o muy parecido ) al flashremoting en coldfusion s?lo que tiene una gran diferencia ( es gratis!!!!!!!!! )\npara los que quieran probar esta es la url.\nhttp://amfphp.sourceforge.net/\ncon el zip, vienen tambien 2 c?digo de ejemplo.\nocupan tambi?n los componentes del flashremoting\nhttp://www.macromedia.com/software/flashremoting/downloads/components/\nel solo hecho de que php devuelva objetos ya parseados hacia flash, es alucinante, y el que sea gratis, pues ni hablar.\naver si un d?a de estos subo algunos ejemplos.\nsaludos\nkada.', '20060323', '', NULL),
(23, 3, 'LocalConnection + Mac + Javascript = pain', 'ayer, en el trabajo , se ten?a que hacer lo siguiente\r\n1.guardar datos en root\r\n2.abrir un popup\r\n3.este popup se ten?a que comunicar con la movie principal ( la que abr?a el popup)\r\n4. luego de comunicarse con la movie principal cerrar la p?gina.\r\nno hay que darle muchas vueltas para saber que localConnection tiene una raz?n de ser, y en este caso nos ser?a muy ?til y f?cil de implementar.\r\nla teor?a era a prueba de fallos, pero do?a mac, no se enter? de eso.\r\nuna vez echo el script, se procedi? a la prueba, se prob? en 8 m?quinas y una mac ( n?tese que la mac no se considera m?quina *joke* )\r\ncomo era de suponerse en la mac no jalaba.\r\nluego de varias pruebas y remembranzas de familiares del creador de las mac, encontr? el error.\r\nluego de hacer la conexi?n y enviar la info, cerraba la ventana, en mac al cerrar la ventana ( getURL("javascript:void(self.close()))") ), como que cancelaba todo tr?mite pendiente y no ejecutaba la acci?n de localconnection.\r\nsoluci?n:\r\nen la movie principal luego de recibir los datos y ejecutar las acciones v?a localconnection, se procedi? a cerrar la ventana.\r\n( getURL("javascript:void(nombreVentana.close()))") ).\r\nosea, que el problema no estaba en el player de flash, sino m?s bien en la forma en que se interpreta el javascript, o en la forma en que pseudo funciona en mac.\r\nojal? y le sea ?til a alguien.\r\nsalu2\r\nkada', '20030330', 'N/A', NULL),
(24, 3, 'Emoticones en flash V2 (es)', 'en emoticones version1 se pon?an los emoticones dentro de la fuente, lo que no permit?a mucha manipulaci?n.\r\nel chiste era meter movieClips en campos de texto...\r\npor ahora esto no se puede hacer en flashmx, lo que si podemos hacer es atachar movieclips sobre en campo de texto, para saber las x,y, lo podemos hacer con campos de texto resizables, uno para el alto, y otro para el ancho.\r\nel truco est? en saber donde reemplazar los textos (:),:(, etc) por los iconos.\r\nesto pretende ser un componente, por ahora est? en versi?n beta, cuando est? m?s estable, ser? de uso gratuito.\r\ntanto los emoticones, con el clip que los contiene, son par?metros de componente, asi que podr?s usar tus propios emoticones, sin alterar el c?digo.\r\nemoticones = [":)",";)",":(",":O",":o",":S",":D","8)","/cool",":|"];\r\npara evitar problemas con las fuentes, en este caso uso una fuente custom, llamada verdanaPixel, que es la verdana querida por todos pero en formato pixel.\r\nbugs conocidos.\r\n1.la y se pierde al digitar textos largos sin espacios.\r\ncomentarios bugs, aqu? por favor.<br />\r\n', '20030412', '1063305336.jpg', NULL),
(25, 1, 'Fuentes pixel2', 'aqui les dejo esta fuente basada en la verdana que todos conocemos pero en versi?n pixel, especial para flash =)\nla pueden bajar de aqu?, es de uso libre.\nsaludos\nkada =)', '20030414', '1063305343.jpg', NULL),
(26, 3, 'Dani + Kada en papel =)', 'el se?or dani y una servilleta estamos haciendo un libro para Anaya Multimedia cuyo contenido va a ser Flash + (PHP/MySQL), el libro se espera tenga unas 400 p?ginas y cd. estar? en librer?as para finales de a?o.\r\nya tenemos de que va a ir el libro, cualquier sugerencia pues somos todo orejas.\r\nsaludos\r\nkada.', '20030510', 'N/A', NULL),
(27, 3, 'Formato a links', 'Cuando se trabaja con links, en cajas de texto con formato html ya sea en flash o en datos externos es muy comun ver:\r\n<a href="link" target="ventana">texto</a>\r\nahora si le queremos poner color al texto o un underline, nos vendr?a quedando algo como\r\n<font color="#0000FF"><u><a href="link" target="ventana">texto</a></u></font>\r\nlos problemas comienzan (si es que aun no han empezado ya ) cuando tenemos textos por todos lados y queremos cambiar el color del link.. \r\npara eso hice un par de funciones que le dan formato a los links, donde se puede configurar el color del link, la forma de uso vendr?a siendo\r\n[link]url|texto[link]asdfasdfs\r\nen mi portfolio uso esto para los links que guardo en los xml.\r\naqu? hay uno.', '20030517', 'N/A', 34),
(28, 2, 'SiMaster v3', 'Felicidades a la gente de NoMaster, en especial al Ricar, por la nueva versi?n del site. ( the ant is still there ) =)\nqued? muy bonito.\nNomaster v3', '20110523', '1063305356.jpg', NULL),
(29, 3, 'MM da el visto bueno a amfphp?', 'en este post, hab?amos hablado de flashremoting para php.\r\nhoy en devnet veo que ya hay un tutorial del mismo tema\r\nhttp://www.macromedia.com/devnet/mx/flash/articles/amfphp.html\r\nesto es m?s que agradable, ya que la gente de AMFPHP, no sab?a si macromedia iba a actual legalmente contra ellos por utlizar el formato amf, \r\npareciera m?s bien que macromedia est? apoyando una opci?n open source para flashremoting. aver que pasa con el tiempo. =)', '20030530', '', NULL),
(31, 1, 'Los milagros existen!', 'para los que no creen en milagros, vean esto\r\ngracias a Oscar Mondrag?n, Sergio Manzan?rez, los sapotekos y a todos los que de una u otra forma participaron en la traves?a hacia el fm3 de kada.', '20060610', 'Felo1.gif', 56),
(32, 3, 'Google busca en tu site', 'andaba por php.net y le d? una b?squeda dentro del site, esto me condujo a google.com pero con los resultados basados en el site.\r\nobviamente ten?a que probar con con mi site, para ver si funcionaba para todos, o si era para pocos. y sorpresa si lo hace.\r\npara probar si funciona hay que digitar la b?squeda en el siguiente formato.\r\n[t?rmino de b?squeda] site:www.[web site]\r\nejemplo\r\nt?rmino de b?squeda\r\nframes site:www.kadazuro.com\r\nmuestra\r\nse le pueden dar varios usos a esto, por ejemplo que hayamos visto un tutorial hace mucho en un site, y no tengamos la url.\r\nd?nde estaba aquel art?culo de plantillas en php, de phpbuilder?\r\n:)', '20030708', 'N/A', NULL),
(33, 2, 'Ihtoa socket server', 'R?ger un buen amigo, acaba de hacer un xml socket server en java : Ihtoa xml socket server, ihtoa viene del lenguaje N?huatl y signfica hhablar o comunicar.\nEl server est? para bajar y es de libre uso para proyectos no comerciales, echo bajo la licencia "use at your own risk"; para uso comercial supongo que habr? que darle algo a roger para los frescos =D.\nEn el site de Ihtoa, encontrar?s todo lo referente a la instalaci?n y forma de trabajo, proximamente habr? una ejemplo onLine para probar.\npd.\nlindos logos, roger =D', '20110722', 'N/A', NULL),
(34, 3, 'De curvas senoidales', 'estaba jugando con los valores del seno seg?n van aumentando los grados y me sali? esto.\r\nluego me parececi? que se ver?a bonito en un c?rculo...\r\ntengo que cambiar las coordenadas de dibujo para "cambiar" el centro\r\nbueno, marea pero se ve bonito. \r\ny si cuando se cierra lo hago que cambie de color?\r\ndebo tener un "espia" que me est? revisando ( no vale la pena tener a 72 soplones, en este caso con uno basta, que sea mister c0)\r\nsi se hace a 24 fps se v? bonito.\r\nen mac no creo que corra por mucho tiempo =D\r\nsi no sabes que hacer, copia y pega en las acciones de un frame en una pel?cula nueva.\r\nsalu2', '20030801', 'N/A', NULL),
(35, 2, 'MX 2004 listo para probar', 'el d?a de hoy ( ayer ?), macromedia puso disponibles la familia 2004 para comprar y probar.\nhttp://www.macromedia.com/software/downloads/\naver si lo bajan antes de que se saturen los servers de mm =D\nsaludos y feliz testing ;)', '20110810', '1385551428.jpg', NULL),
(37, 1, 'Multimedia', 'primer registro\r\nmultimedia', '20070207', '', 0),
(85, 2, 'prueba2asdasdasd', 'españa cañíasdf', '20081018', 'oros_10s.jpg', 12.24),
(86, 2, 'NuevaNoticia', 'aksldfsdfsdf', '20030000', 'n/a', 12.12),
(87, 2, 'OtraoldNotice', 'asdfasdfasdfasdfasdfasdfsadf', '20030000', 'n/a', 23),
(89, 3, 'oldSchool', 'adsfasdfadsfasdfasdfadsdfasdf', '20030000', 'n/a', 45),
(90, 2, 'nesscholo', 'asdfsadfsadfasdfsdfasdf', '20030000', 'n/a', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` varchar(60) NOT NULL,
  `delivery_name` text NOT NULL,
  `delivery_address` text NOT NULL,
  `cc_name` text NOT NULL,
  `cc_number` int(11) NOT NULL,
  `cc_expiry` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `delivery_name`, `delivery_address`, `cc_name`, `cc_number`, `cc_expiry`) VALUES
('1391502691834', 'adsf', 'adsf', 'adsf', 1324, 1234),
('1391503432221', 'qwerqew', 'qwerqewr', 'asdfsadf', 1234, 13242134),
('1391504013612', 'asdfasd', 'adsfasd', 'asdfasd', 234324, 2345342),
('1391511560617', 'asdf', 'asdf', 'asdf', 132, 1324),
('1391513707283', 'asdf', 'asdf', 'asdf', 1234, 1234),
('1391587882109', 'asdfsda', 'asdfsd', 'asdf', 1234, 1324),
('1391601787705', 'asdf', 'asdasdf', 'asdf', 1234, 2134),
('1393332184108', '12', '12', '12', 12, 12),
('1393333266739', '12', '12', '12', 12, 12),
('1394442403017', 'asdf', 'asdf', '12', 12, 12),
('1394444146326', 'asdf', 'sdf', '34', 34, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
  `id` double NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `cabecera` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `texto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `order_id` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `order_details`
--

INSERT INTO `order_details` (`id`, `book_id`, `cabecera`, `texto`, `cantidad`, `precio`, `order_id`) VALUES
(1, 24, 'en emoticones version1 se pon?an los emoticones dentro de la fuente, lo que no permit?a mucha manipulaci?n.\r\nel chiste era meter movieClips en campos de texto...\r\npor ahora esto no se puede hacer en flashmx, lo que si podemos hacer es atachar movieclips sobre en campo de texto, para saber las x,y, lo podemos hacer con campos de texto resizables, uno para el alto, y otro para el ancho.\r\nel truco est? en saber donde reemplazar los textos (:),:(, etc) por los iconos.\r\nesto pretende ser un componente, por ahora est? en versi?n beta, cuando est? m?s estable, ser? de uso gratuito.\r\ntanto los emoticones, con el clip que los contiene, son par?metros de componente, asi que podr?s usar tus propios emoticones, sin alterar el c?digo.\r\nemoticones = [":)",";)",":(",":O",":o",":S",":D","8)","/cool",":|"];\r\npara evitar problemas con las fuentes, en este caso uso una fuente custom, llamada verdanaPixel, que es la verdana querida por todos pero en formato pixel.\r\nbugs conocidos.\r\n1.la y se pierde al digitar textos largos sin espacios.\r\ncomentarios bugs, aqu? por favor.<br />\r\n', 'Emoticones en flash V2 (es)', 1, 0, 1391502691834),
(2, 29, 'en este post, hab?amos hablado de flashremoting para php.\r\nhoy en devnet veo que ya hay un tutorial del mismo tema\r\nhttp://www.macromedia.com/devnet/mx/flash/articles/amfphp.html\r\nesto es m?s que agradable, ya que la gente de AMFPHP, no sab?a si macromedia iba a actual legalmente contra ellos por utlizar el formato amf, \r\npareciera m?s bien que macromedia est? apoyando una opci?n open source para flashremoting. aver que pasa con el tiempo. =)', 'MM da el visto bueno a amfphp?', 1, 0, 1391503432221),
(3, 32, 'andaba por php.net y le d? una b?squeda dentro del site, esto me condujo a google.com pero con los resultados basados en el site.\r\nobviamente ten?a que probar con con mi site, para ver si funcionaba para todos, o si era para pocos. y sorpresa si lo hace.\r\npara probar si funciona hay que digitar la b?squeda en el siguiente formato.\r\n[t?rmino de b?squeda] site:www.[web site]\r\nejemplo\r\nt?rmino de b?squeda\r\nframes site:www.kadazuro.com\r\nmuestra\r\nse le pueden dar varios usos a esto, por ejemplo que hayamos visto un tutorial hace mucho en un site, y no tengamos la url.\r\nd?nde estaba aquel art?culo de plantillas en php, de phpbuilder?\r\n:)', 'Google busca en tu site', 1, 0, 1391504013612),
(4, 24, 'en emoticones version1 se pon?an los emoticones dentro de la fuente, lo que no permit?a mucha manipulaci?n.\r\nel chiste era meter movieClips en campos de texto...\r\npor ahora esto no se puede hacer en flashmx, lo que si podemos hacer es atachar movieclips sobre en campo de texto, para saber las x,y, lo podemos hacer con campos de texto resizables, uno para el alto, y otro para el ancho.\r\nel truco est? en saber donde reemplazar los textos (:),:(, etc) por los iconos.\r\nesto pretende ser un componente, por ahora est? en versi?n beta, cuando est? m?s estable, ser? de uso gratuito.\r\ntanto los emoticones, con el clip que los contiene, son par?metros de componente, asi que podr?s usar tus propios emoticones, sin alterar el c?digo.\r\nemoticones = [":)",";)",":(",":O",":o",":S",":D","8)","/cool",":|"];\r\npara evitar problemas con las fuentes, en este caso uso una fuente custom, llamada verdanaPixel, que es la verdana querida por todos pero en formato pixel.\r\nbugs conocidos.\r\n1.la y se pierde al digitar textos largos sin espacios.\r\ncomentarios bugs, aqu? por favor.<br />\r\n', 'Emoticones en flash V2 (es)', 1, 0, 1391511560617),
(5, 29, 'en este post, hab?amos hablado de flashremoting para php.\r\nhoy en devnet veo que ya hay un tutorial del mismo tema\r\nhttp://www.macromedia.com/devnet/mx/flash/articles/amfphp.html\r\nesto es m?s que agradable, ya que la gente de AMFPHP, no sab?a si macromedia iba a actual legalmente contra ellos por utlizar el formato amf, \r\npareciera m?s bien que macromedia est? apoyando una opci?n open source para flashremoting. aver que pasa con el tiempo. =)', 'MM da el visto bueno a amfphp?', 1, 0, 1391513707283),
(6, 24, 'en emoticones version1 se pon?an los emoticones dentro de la fuente, lo que no permit?a mucha manipulaci?n.\r\nel chiste era meter movieClips en campos de texto...\r\npor ahora esto no se puede hacer en flashmx, lo que si podemos hacer es atachar movieclips sobre en campo de texto, para saber las x,y, lo podemos hacer con campos de texto resizables, uno para el alto, y otro para el ancho.\r\nel truco est? en saber donde reemplazar los textos (:),:(, etc) por los iconos.\r\nesto pretende ser un componente, por ahora est? en versi?n beta, cuando est? m?s estable, ser? de uso gratuito.\r\ntanto los emoticones, con el clip que los contiene, son par?metros de componente, asi que podr?s usar tus propios emoticones, sin alterar el c?digo.\r\nemoticones = [":)",";)",":(",":O",":o",":S",":D","8)","/cool",":|"];\r\npara evitar problemas con las fuentes, en este caso uso una fuente custom, llamada verdanaPixel, que es la verdana querida por todos pero en formato pixel.\r\nbugs conocidos.\r\n1.la y se pierde al digitar textos largos sin espacios.\r\ncomentarios bugs, aqu? por favor.<br />\r\n', 'Emoticones en flash V2 (es)', 1, 0, 1391587882109),
(7, 23, 'ayer, en el trabajo , se ten?a que hacer lo siguiente\r\n1.guardar datos en root\r\n2.abrir un popup\r\n3.este popup se ten?a que comunicar con la movie principal ( la que abr?a el popup)\r\n4. luego de comunicarse con la movie principal cerrar la p?gina.\r\nno hay que darle muchas vueltas para saber que localConnection tiene una raz?n de ser, y en este caso nos ser?a muy ?til y f?cil de implementar.\r\nla teor?a era a prueba de fallos, pero do?a mac, no se enter? de eso.\r\nuna vez echo el script, se procedi? a la prueba, se prob? en 8 m?quinas y una mac ( n?tese que la mac no se considera m?quina *joke* )\r\ncomo era de suponerse en la mac no jalaba.\r\nluego de varias pruebas y remembranzas de familiares del creador de las mac, encontr? el error.\r\nluego de hacer la conexi?n y enviar la info, cerraba la ventana, en mac al cerrar la ventana ( getURL("javascript:void(self.close()))") ), como que cancelaba todo tr?mite pendiente y no ejecutaba la acci?n de localconnection.\r\nsoluci?n:\r\nen la movie principal luego de recibir los datos y ejecutar las acciones v?a localconnection, se procedi? a cerrar la ventana.\r\n( getURL("javascript:void(nombreVentana.close()))") ).\r\nosea, que el problema no estaba en el player de flash, sino m?s bien en la forma en que se interpreta el javascript, o en la forma en que pseudo funciona en mac.\r\nojal? y le sea ?til a alguien.\r\nsalu2\r\nkada', 'LocalConnection + Mac + Javascript = pain', 1, 0, 1391601787705),
(8, 4, 'En tierras míticas', 'bueno, desde el dia 21 de diciembre, hasta el próximo 2 de enero, ando por tierras míticas, y algo alejado de la pc.\r\nmientras tanto espero pasen unas buenas fiestas navideñas y fin de a?o junto a sus seres queridos.\r\nun abrazo.\r\nkada.', 1, 12, 1393332184108),
(9, 4, 'En tierras míticas', 'bueno, desde el dia 21 de diciembre, hasta el próximo 2 de enero, ando por tierras míticas, y algo alejado de la pc.\r\nmientras tanto espero pasen unas buenas fiestas navideñas y fin de a?o junto a sus seres queridos.\r\nun abrazo.\r\nkada.', 12, 12, 1393333266739),
(10, 23, 'LocalConnection + Mac + Javascript = pain', 'ayer, en el trabajo , se ten?a que hacer lo siguiente\r\n1.guardar datos en root\r\n2.abrir un popup\r\n3.este popup se ten?a que comunicar con la movie principal ( la que abr?a el popup)\r\n4. luego de comunicarse con la movie principal cerrar la p?gina.\r\nno hay que darle muchas vueltas para saber que localConnection tiene una raz?n de ser, y en este caso nos ser?a muy ?til y f?cil de implementar.\r\nla teor?a era a prueba de fallos, pero do?a mac, no se enter? de eso.\r\nuna vez echo el script, se procedi? a la prueba, se prob? en 8 m?quinas y una mac ( n?tese que la mac no se considera m?quina *joke* )\r\ncomo era de suponerse en la mac no jalaba.\r\nluego de varias pruebas y remembranzas de familiares del creador de las mac, encontr? el error.\r\nluego de hacer la conexi?n y enviar la info, cerraba la ventana, en mac al cerrar la ventana ( getURL("javascript:void(self.close()))") ), como que cancelaba todo tr?mite pendiente y no ejecutaba la acci?n de localconnection.\r\nsoluci?n:\r\nen la movie principal luego de recibir los datos y ejecutar las acciones v?a localconnection, se procedi? a cerrar la ventana.\r\n( getURL("javascript:void(nombreVentana.close()))") ).\r\nosea, que el problema no estaba en el player de flash, sino m?s bien en la forma en que se interpreta el javascript, o en la forma en que pseudo funciona en mac.\r\nojal? y le sea ?til a alguien.\r\nsalu2\r\nkada', 1, 0, 1394442403017),
(11, 1, 'Kadazuro.blog', 'pues nada, estoy estrenando blog =)\r\npienso usar esto como libreta de apuntes o diario, cosas que vaya descubriendo (o que me cuenten), tips que considere que vale la pena documentar, entre otros.\r\nque podr?s encontrar aqui?\r\npues, tips, trucos, ma?as, mini-tutos, c?digo y talvez alguna an?ctoda que me suceda ( digo, algo tendr? que poner xDDD)\r\npues nada, bienvenidos a mi diario =)\r\npd.\r\nesto se ve muy plano, voy a ver quien m?s tiene movabletype ( el backend )\r\npara ver si me presta sus .css =D', 45, 12, 1394444146326);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id`, `descripcion`) VALUES
(1, 'FLASH'),
(2, 'ACTIONSCRIPT'),
(3, 'MULTIMEDIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `clave` varchar(32) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`) VALUES
(1, 'admin', 'admin'),
(3, 'admin2', 'elrincon'),
(4, 'moises', 'moises');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista1`
--
CREATE TABLE IF NOT EXISTS `vista1` (
`seccion` mediumint(8)
,`count(*)` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vista1`
--
DROP TABLE IF EXISTS `vista1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista1` AS select `agenda`.`seccion` AS `seccion`,count(0) AS `count(*)` from `agenda` group by `agenda`.`seccion`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
