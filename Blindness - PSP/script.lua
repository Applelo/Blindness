oeil = {image.load("img/oeil/rond.png"),image.load("img/oeil/croix.png"),image.load("img/oeil/carre.png"),image.load("img/oeil/triangle.png")};
color.loadpalette();
nbrPoint = 0;
moinsPoint = 0;
niveau = 1;
score = 0;
point = {image.load("img/point/rond.png"),image.load("img/point/croix.png"),image.load("img/point/carre.png"),image.load("img/point/triangle.png")};
element = { 
	play={image.load("img/menu/play.png"),image.load("img/menu/play_1.png"),0},
	option={image.load("img/menu/option.png"),image.load("img/menu/option_1.png"),0},
	exit={image.load("img/menu/exit.png"),image.load("img/menu/exit_1.png"),0},
	info={image.load("img/menu/info.png"),image.load("img/menu/info_1.png"),0},
	levelI={image.load("img/menu/level_I.png"),image.load("img/menu/level_I_1.png"),0},
	levelII={image.load("img/menu/level_II.png"),image.load("img/menu/level_II_1.png"),0},
	levelIII={image.load("img/menu/level_III.png"),image.load("img/menu/level_III_1.png"),0},
	levelIV={image.load("img/menu/level_IV.png"),image.load("img/menu/level_IV_1.png"),0},
	rouge={image.load("img/menu/rouge.png")},
	vert={image.load("img/menu/vert.png")}
}
fond = image.load("img/fond.png",240,272);
typeOeil = 4;
temps = timer.new();
temps:reset(0);
temps:stop();
thetime = 10;
stepTuto = 1
bonustime = 1;
task = "intro";
x = 0;
y = 0;
tempo = 0
font.setdefault("ltn7.pgf");
music = {sound.load("music/Blind in the dark.mp3"),sound.load("music/Erase my error.mp3")};
sound.loop(music[1]);
sound.loop(music[2]);
splash.show();	
dofile("menu.lua");--Charge les menus du jeu
dofile("game.lua");--Le jeu
dofile("save.lua");--La sauvegarde
dofile("lang.lua");--Charge la langue du jeu
splash.show({"img/zenyth.png","img/cp.png"});--Les 2 autres splashs 

while true do
	buttons.read();	
	draw.fillrect(0,0,480,272,color.white);
	if sound.playing(music[1]) == false and task ~= "game" then
		sound.play(music[1],1);
	elseif sound.playing(music[2]) == false and task == "game" then
		sound.play(music[2],1);
	end
	
	
	if task == "intro" then
		intro();
	elseif task == "menu" then
		menu();
	elseif task == "game" then
		game();
	elseif task == "info" then
		info();
	elseif task == "level" then
		level();
	elseif task == "option" then
		option();
	elseif task == "tuto" then
		tutoriel();
	else
		os.exit();
	end
	screen.flip();	
end