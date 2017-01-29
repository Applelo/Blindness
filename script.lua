--sha1 = require 'sha1';
color.loadpalette();

if files.exists("ux0:app/BLIND0123/eboot.bin") then--Detect the device (psvita or psp)
	oneLuaVersion = "ONEluaVita2R0";
	scale = 2;
	psvita = true;
	scroll = 0;
	if files.exists("ux0:patch/BLIND0123/sce_sys/changeinfo/changelog.xml") == false then
		os.writexml(files.fullpath("sce_sys/changeinfo.xml",0));--add changelog info in first run
	end
	if hw.model() == "PlayStation TV" then
		pstv = 1;
		buttons.lbar(1,color.black);
	else
		pstv = 0;
	end
else
	oneLuaVersion = "ONEluav4R1";
	scale = 1;
	scroll = 135;
	pstv = 0;
	cfw = os.cfw();
	if cfw == "eCFW TN-VX.X" or cfw == "eCFW ARK" or cfw == "VHBL" then
		psvita = true;
	end
end


oeil = {
	image.load("img/oeil/noir.png", 100 * scale, 100 * scale),
	image.load("img/oeil/rouge.png", 100 * scale, 100 * scale),
	image.load("img/oeil/vert.png", 100 * scale, 100 * scale),
	image.load("img/oeil/bleu.png", 100 * scale, 100 * scale)
};

greycolor = {color.new(252,10,41),color.new(36,255,29),color.new(34,129,182)}
nil_color = color.new(0,0,0,0)
numbercolor = 1
nbrPoint = 0;
moinsPoint = 0;
niveau = "nb";
score = 0;
point = {
	image.load("img/point/noir.png", 50 * scale, 50 * scale),
	image.load("img/point/rouge.png", 50 * scale, 50 * scale),
	image.load("img/point/vert.png", 50 * scale, 50 * scale),
	image.load("img/point/bleu.png", 50 * scale, 50 * scale)
};

element = {
	play = {image.load("img/menu/play.png"),image.load("img/menu/play_1.png"),0},
	option = {image.load("img/menu/option.png"),image.load("img/menu/option_1.png"),0},
	exit = {image.load("img/menu/exit.png"),image.load("img/menu/exit_1.png"),0},
	info = {image.load("img/menu/info.png"),image.load("img/menu/info_1.png"),0},
	--versus={image.load("img/menu/versus.png"),image.load("img/menu/versus_1.png"),0},
	nb = {image.load("img/menu/black_white.png"),image.load("img/menu/black_white_1.png"),0},
	cf = {image.load("img/menu/colorfull.png"),image.load("img/menu/colorfull_1.png"),0},
	rectonb = {image.load("img/menu/rectonb.png"),image.load("img/menu/rectonb_1.png"),0},
	rectocf = {image.load("img/menu/rectocf.png"),image.load("img/menu/rectocf_1.png"),0},
	rouge = {image.load("img/menu/rouge.png")},
	vert = {image.load("img/menu/vert.png")}
}
stats = {
	temps=0,
	figure={0,0,0,0},
	couleur={0,0,0},
	result={0,0}
};
recto = 0;
fond = image.load("img/menu/fond.png", 240 * scale, 272 * scale);
typeOeil = 4;
temps = timer.new();
temps:reset(0);
temps:stop();
thetime = 10;
stepTuto = 1;
bonustime = 1;
task = "intro";
pause = false;--Pause non mis au début
x = 0;
y = 0;
tempo = 0;
if scale == 1 then
	font.setdefault("ubuntu-font.pgf");
else
	font.setdefault("ubuntu-font.ttf");
end

music = {sound.load("music/Blind In The Dark II.mp3"),sound.load("music/Erase my error.mp3")};
sound.loop(music[1]);
sound.loop(music[2]);
splash.show();
dofile("menu.lua");--Charge les menus du jeu
dofile("game.lua");--Le jeu
dofile("lang.lua");--Charge la langue du jeu
chargement();

--Variable pour la fonction starfield--
zMax = 5;
speed = 0.1;

starfield = {};
math.randomseed(os.time());

function createStar(i)
	starfield[i] = {};
	starfield[i].x = math.random(2*54) - 64;
	starfield[i].y = math.random(2*54) - 64;
	starfield[i].z = zMax;
end

for i = 1, 30 do
	createStar(i);
	starfield[i].z = math.random(zMax);
end
---

while true do
	buttons.read();
	draw.fillrect(0, 0, 480 * scale,272 * scale, color.white);

	if sound.playing(music[1]) == false and task ~= "game" then
		sound.play(music[1],1);
	elseif sound.playing(music[2]) == false and task == "game" then
		sound.play(music[2],1);
	end

	if task ~= "game" and task ~= "intro" and task ~= "perdu" then
		image.blitsprite(fond,0,0,0);
		image.blitsprite(fond,240 * scale,0,1);
		image.blitsprite(point[1],x + (215 * scale),y + (111 * scale),0);
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
		foption();
	elseif task == "perdu" then
		loose();
	else
		os.exit();
	end
	screen.flip();
end
