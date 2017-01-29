function blinded(mode)

	if mode == "nb" then
		image.blitsprite(oeil[1],x + (scale * 190),y + (86 * scale),typeOeil-1, tempo);
		draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(0,0,0,tempo));
		draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(0,0,0,tempo));
		draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), color.new(0,0,0,tempo));
		draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), color.new(0,0,0,tempo));

		if tempo > 255 then
			draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.black);
			draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.black);
			draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), color.black);
			draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), color.black);
		end

		if pstv == 1 then
			buttons.lbar(1,color.black)--Change color of light bar for PSTV Version
		end

	else

		image.blitsprite(oeil[numbercolor+1],x + (scale * 190),y + (86 * scale),typeOeil-1,tempo);
		if numbercolor == 1 then
			draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(252,10,41,tempo));--Rouge
			draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(252,10,41,tempo));
			draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), color.new(252,10,41,tempo));
			draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), color.new(252,10,41,tempo));
		elseif numbercolor == 2 then
			draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(36,255,29,tempo));--Vert
			draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(36,255,29,tempo));
			draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), color.new(36,255,29,tempo));
			draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), color.new(36,255,29,tempo));
		else
			draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(34,129,182,tempo));--Bleu
			draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), color.new(34,129,182,tempo));
			draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), color.new(34,129,182,tempo));
			draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), color.new(34,129,182,tempo));
		end

		if tempo > 255 then
			draw.fillrect(x - (200 * scale), y - (100 * scale), (390 * scale), (500 * scale), greycolor[numbercolor]);--Bleu
			draw.fillrect(x + (290 * scale), y - (100 * scale), (390 * scale), (500 * scale), greycolor[numbercolor]);
			draw.fillrect(x + (190 * scale), y - (100 * scale), (100 * scale), (186 * scale), greycolor[numbercolor]);
			draw.fillrect(x + (190 * scale), y + (186 * scale), (100 * scale), (186 * scale), greycolor[numbercolor]);
		end

		if pstv == 1 then
			buttons.lbar(1,greycolor[numbercolor])--Change color of light bar for PSTV Version
		end

	end
end

function game()

	control("game");

	if temps:time() == 0 then
		temps:start();
		if niveau == "nb" or niveau == "nbrecto" then
			generateur(1,1);
		else
			generateur(1,1,1);
		end
	end

	if stats.temps < temps:time() then
		stats.temps = temps:time();
	end

	if moinsPoint == 0 then
		bonustime = bonustime + 1;
		if niveau == "nb" or niveau == "nbrecto" then
			if bonustime < 16 then
				generateur(bonustime, math.ceil(bonustime / 4));
			else
				generateur(16, 4);
			end
		elseif niveau == "cf" or niveau == "cfrecto" then
			if bonustime < 16 then
				generateur(bonustime, math.ceil(bonustime / 4), math.ceil(bonustime / 6));
			else
				generateur(16, 4, 3);
			end
		end
		tempo = 100;
	end

	if tempo < 255 then
		tempo = tempo + 3;
	end





	if niveau == "nb" then--Mode noir/blanc

		for i = 1, nbrPoint do
			if tablePoint[i].affiche then
				image.blitsprite(point[1], tablePoint[i].x, tablePoint[i].y, tablePoint[i].type - 1, tempo);
			end
			if tablePoint[i].x >= (x + (210 * scale)) - (20 * scale) and tablePoint[i].x <= (x + (210 * scale)) + (20 * scale) and tablePoint[i].y >= (y + (106 * scale)) - (20 * scale) and tablePoint[i].y <= (y + (106 * scale)) + (20 * scale) and typeOeil == tablePoint[i].type and tablePoint[i].affiche then
				tablePoint[i].affiche = false;
				stats.figure[tablePoint[i].type] = stats.figure[tablePoint[i].type] + 1;--Augmente la stat des figure
				moinsPoint = moinsPoint - 1;
				score = score + 1;
			end
			if tablePoint[i].affiche == false and tablePoint[i].tempo < 30 then
				starlight(tablePoint[i].x,tablePoint[i].y,color.black);
				if pstv == 1 then
					buttons.rumble(1,64,64)
				end
				tablePoint[i].tempo = tablePoint[i].tempo + 1;
			end
		end

		blinded("nb")

		screen.print((240 * scale), (30 * scale), tempsToRebour(31+(bonustime*5)-5), 1.0 * scale, color.white, color.black, __ACENTER);

	elseif niveau == "cf" then--Mode couleur

		for i = 1, nbrPoint do
			if tablePoint[i].affiche then
				image.blitsprite(point[1+tablePoint[i].color],tablePoint[i].x,tablePoint[i].y,tablePoint[i].type-1,tempo);
			end
			if tablePoint[i].x >= (x + (210 * scale)) - (20 * scale) and tablePoint[i].x <= (x + (210 * scale)) + (20 * scale) and tablePoint[i].y >= (y + (106 * scale)) - (20 * scale) and tablePoint[i].y <= (y + (106 * scale)) + (20 * scale) and typeOeil == tablePoint[i].type and tablePoint[i].affiche and tablePoint[i].color == numbercolor then
				tablePoint[i].affiche = false;
				stats.figure[tablePoint[i].type] = stats.figure[tablePoint[i].type] + 1;--Augmente la stat des figure
				stats.couleur[tablePoint[i].color] = stats.couleur[tablePoint[i].color] + 1;--Augmente la stat des couleurs
				moinsPoint = moinsPoint-1;
				score = score + 1;
			end
			if tablePoint[i].affiche == false and tablePoint[i].tempo < 30 then
				starlight(tablePoint[i].x,tablePoint[i].y,greycolor[tablePoint[i].color]);
				if pstv == 1 then
					buttons.rumble(1,64,64)
				end
				tablePoint[i].tempo = tablePoint[i].tempo + 1;
			end
		end

		blinded("color")

		if buttons.r then
			numbercolor = numbercolor + 1;
		elseif buttons.l then
			numbercolor = numbercolor - 1;
		end
		if numbercolor > 3 then
			numbercolor = 1;
		elseif numbercolor < 1 then
			numbercolor = 3;
		end
		screen.print(240 * scale, 30 * scale, tempsToRebour(31+(bonustime*5)-5), 1.0 * scale , color.white, greycolor[numbercolor], __ACENTER);

	elseif niveau == "nbrecto" then--Mode noir/blanc en recto
		for i = 1, nbrPoint do
			if tablePoint[i].affiche then
				image.blitsprite(point[1], tablePoint[i].x, tablePoint[i].y, tablePoint[i].type-1, tempo);
			end
			if tablePoint[i].x >= (x + (210 * scale)) - (20 * scale) and tablePoint[i].x <= (x + (210* scale)) + (20 * scale) and tablePoint[i].y >= (y + (106 * scale)) - (20 * scale) and tablePoint[i].y <= (y + (106 * scale)) + (20 * scale) and typeOeil == tablePoint[i].type and tablePoint[i].affiche then
				tablePoint[i].affiche = false;
				stats.figure[tablePoint[i].type] = stats.figure[tablePoint[i].type] + 1;--Augmente la stat des figure
				moinsPoint = moinsPoint-1;
				score = score + 1;
			end
			if tablePoint[i].affiche == false and tablePoint[i].tempo <30 then
				starlight(tablePoint[i].x,tablePoint[i].y,color.black);
				if pstv == 1 then
					buttons.rumble(1,64,64)
				end
				tablePoint[i].tempo = tablePoint[i].tempo + 1;
			end
		end

		blinded("nb")

		screen.print(240 * scale, 30 * scale, tempsToRebour(31+(bonustime*2)-5), 1.0 * scale, color.white, color.black, __ACENTER);

		if pstv == 1 then
			buttons.lbar(1,color.black)
		end

	elseif niveau == "cfrecto" then--Mode couleur en recto

		for i=1, nbrPoint do
			if tablePoint[i].affiche then
				image.blitsprite(point[1+tablePoint[i].color], tablePoint[i].x, tablePoint[i].y, tablePoint[i].type - 1,tempo);
			end
			if tablePoint[i].x >= (x + (210 * scale)) - (20 * scale) and tablePoint[i].x <= (x + (210 * scale)) + (20 * scale) and tablePoint[i].y >= (y + (106 * scale)) - (20 * scale) and tablePoint[i].y <= (y + (106 * scale)) + (20 * scale) and typeOeil == tablePoint[i].type and tablePoint[i].affiche and tablePoint[i].color == numbercolor then
				tablePoint[i].affiche = false;
				stats.figure[tablePoint[i].type] = stats.figure[tablePoint[i].type] + 1;--Augmente la stat des figure
				stats.couleur[tablePoint[i].color] = stats.couleur[tablePoint[i].color] + 1;--Augmente la stat des couleurs
				moinsPoint = moinsPoint-1;
				score = score + 1;
			end
			if tablePoint[i].affiche == false and tablePoint[i].tempo < 30 then
				starlight(tablePoint[i].x, tablePoint[i].y, greycolor[tablePoint[i].color]);
				if pstv == 1 then
					buttons.rumble(1,64,64)
				end
				tablePoint[i].tempo = tablePoint[i].tempo + 1;
			end
		end

		blinded("color")
		screen.print(240 * scale, 30 * scale,tempsToRebour(31+(bonustime*2)-5).." "..moinsPoint, 1.0 * scale,color.white,greycolor[numbercolor],__ACENTER);
	end





	if buttons.start and pause then
		pause = false
	elseif buttons.start and pause == false then
		pause = true
	end

	if pause then
		temps:stop();
		draw.fillrect(0, 0, 480 * scale, 272 * scale,color.black);
		screen.print(240 * scale, 30 * scale, lang.pause, 1.5 * scale, color.white, nil_color, __ACENTER);
		screen.print(240 * scale, 200 * scale, lang.retour_menu.."\n\n"..lang.retour_partie, 0.7 * scale, color.white, nil_color, __ACENTER);
		if buttons.circle then
			reset()
		end
	else
		temps:start();
	end

	if niveau == "cf" or niveau == "nb" then--Active les controles pour les deux modes Noir et Blanc et Colerfulls
		if buttons.circle then
			typeOeil = 1;
		elseif buttons.cross then
			typeOeil = 2;
		elseif buttons.square then
			typeOeil = 3;
		elseif buttons.triangle then
			typeOeil = 4;
		end
	end


	if thetime <= 0 then--Fin de la partie et reset les compteurs
		thetime = 10;
		bonustime = 1;
		pause = false;
		temps:reset(0);
		temps:stop();
		tablePoint = nil;
		--Détermine la figure qui a été le plus ramassé

		for i=1,3 do
			if math.max(stats.figure[1],stats.figure[2],stats.figure[3],stats.figure[3]) == stats.figure[i] then
				stats.result[2] = i;
			end
		end

		--Détermine la couleur qui a été la plus ramassé
		if niveau == "cf" or niveau == "cfrecto" then
			for i=1,3 do
				if math.max(stats.couleur[1],stats.couleur[2],stats.couleur[3]) == stats.couleur[i] then
					stats.result[2] = i + 1;
				end
			end
		else
			stats.result[2] = 1;
		end


		task = "perdu";
	end

end


function sauvegarde()
	--Sauvegarde
	ini.write("save.ini", "save", "sNB", tostring(save.sNB))--Score noir/blanc
	ini.write("save.ini", "save", "sCF", tostring(save.sCF))--score Colorfull
	ini.write("save.ini", "save", "sNBR", tostring(save.sNBR))--Score noir/blanc recto
	ini.write("save.ini", "save", "sCFR", tostring(save.sCFR))--score Colorfull Recto
	ini.write("save.ini", "save", "tNB", tostring(save.tNB))--temps noir/blanc
	ini.write("save.ini", "save", "tCF", tostring(save.tCF))--temps colorfull
	ini.write("save.ini", "save", "tNBR", tostring(save.tNBR))--temps noir/blanc recto
	ini.write("save.ini", "save", "tCFR", tostring(save.tCFR))--temps colorfull Recto

	--Option
	ini.write("save.ini", "option", "sensibilite", tostring(option.sensibilite))--temps colorfull Recto


end
function chargement()
	--Sauvegarde
	save={}
	save.sNB = tonumber(ini.read("save.ini", "save", "sNB", "0"))--Score noir/blanc
	save.sCF = tonumber(ini.read("save.ini", "save", "sCF", "0"))--score Colorfull
	save.sNBR = tonumber(ini.read("save.ini", "save", "sNBR", "0"))--score Noir/Blanc Recto
	save.sCFR = tonumber(ini.read("save.ini", "save", "sCFR", "0"))--score Colorfull Recto
	save.tNB = tonumber(ini.read("save.ini", "save", "tNB", "0"))--temps noir/blanc
	save.tCF = tonumber(ini.read("save.ini", "save", "tCF", "0"))--temps colorfull
	save.tNBR = tonumber(ini.read("save.ini", "save", "tNBR", "0"))--temps noir/blanc Recto
	save.tCFR = tonumber(ini.read("save.ini", "save", "tCFR", "0"))--temps colorfull Recto
	--Option
	option={}
	option.sensibilite = tonumber(ini.read("save.ini","option","sensibilite","5"))--Sensibilité du joystick

end

function control(choix)


	if choix == "menu" then
		if x < -(127 * scale) then
			x = -(127 * scale);
		elseif x > (127 * scale) then
			x = (127 * scale);
		end
		if y < -(76.8 * scale) then
			y = -(76.8 * scale);
		elseif y > (76.2 * scale) then
			y = (76.2 * scale);
		end
	elseif choix== "game" then
		if x < -(180 * scale) then
			x = -(180 * scale);
		elseif x > (190.5 * scale) then
			x = (190.5 * scale);
		end
		if y < -(80 * scale) then
			y = -(80 * scale);
		elseif y > (88.9 * scale) then
			y = (88.9 * scale);
		end
	end

	if scale == 1 then
		if buttons.held.up then
			y = y - (option.sensibilite * scale);
		end
		if buttons.held.down then
			y = y + (option.sensibilite * scale);
		end
		if buttons.held.right then
			x = x + (option.sensibilite * scale);
		end
		if buttons.held.left then
			x = x - (option.sensibilite * scale);
		end
	else
		if buttons.analogly < - 64 then
			y = y - (option.sensibilite * scale);
		end
		if buttons.analogly > 64 then
			y = y + (option.sensibilite * scale);
		end
		if buttons.analoglx > 64 then
			x = x + (option.sensibilite * scale);
		end
		if buttons.analoglx < - 64 then
			x = x - (option.sensibilite * scale);
		end
	end

end

function generateur(nbr,limite,limicouleur)
	tablePoint = nil;
	tablePoint = {};
	nbrPoint = nbr;

	if niveau == "nbrecto" then
		typeOeil = math.random(1,limite);
	elseif niveau == "cfrecto" then
		typeOeil = math.random(1,limite);
		numbercolor = math.random(1,limicouleur);
	end


	if niveau == "nb" then
		for i=1, nbrPoint do
			tablePoint[i] = {
				x = math.random(50 * scale, 420 * scale),
				y = math.random(50 * scale, 200 * scale),
				affiche = true,
				type = math.random(1, limite),
				tempo = 0
			};
		end
	elseif niveau == "cf" then
		for i = 1, nbrPoint do
			tablePoint[i] = {
				x = math.random(50 * scale, 420 * scale),
				y = math.random(50 * scale, 200 * scale),
				affiche = true,
				type = math.random(1, limite),
				color = math.random(1, limicouleur),
				tempo = 0
			};
		end
	elseif niveau == "nbrecto" then
		for i=1, nbrPoint do
			tablePoint[i] = {
				x = (56 * scale) + i * (106 * scale) - (math.floor(i / 4) * (424 * scale)),
				y = (14.4 * scale) + math.ceil( i / 4 ) * (64.4 * scale) - (64.4 * scale),
				affiche = true,
				type = math.random(1, limite),
				tempo = 0
			};

			if tablePoint[i].type == typeOeil then
				moinsPoint = moinsPoint + 1;
			end
		end
	elseif niveau == "cfrecto" then
		for i = 1, nbrPoint do
			tablePoint[i] = {
				x = (56 * scale) + i * (106 * scale) - (math.floor( i / 4 ) * (424 * scale)),
				y = (14.4 * scale) + math.ceil(i / 4) * (64.4 * scale) - (64.4 * scale),
				affiche = true,
				type = math.random(1, limite),
				color = math.random(1, limicouleur),
				tempo = 0
			};

			if tablePoint[i].type == typeOeil and tablePoint[i].color == numbercolor then
				moinsPoint = moinsPoint + 1;
			end
		end

	end

	if niveau == "nb" or niveau == "cf" then
		moinsPoint = nbrPoint;
	end
end


function tempsToRebour(sec)
	sec = sec*1000;
	thetime = (temps:time()-sec)*-1;
	return math.floor((thetime/1000)/60)..":"..(math.floor(thetime/1000)-math.floor((thetime/1000)/60)*60);
end

function retourneTemps(milli)
	return math.floor((milli/1000)/60)..":"..(math.floor(milli/1000)-math.floor((milli/1000)/60)*60);
end

function starlight(x,y,couleur)
	for i = 1, 30 do
                starfield[i].z = starfield[i].z - speed;
                if starfield[i].z < speed then createStar(i) end
                xstar = (64 * scale) / 2 + starfield[i].x / starfield[i].z;
                ystar = (64 * scale) / 2 + starfield[i].y / starfield[i].z;
                if xstar < 0 or ystar < 0 or xstar >= (64 * scale) or ystar >= (64 * scale) then
                        createStar(i);
         		 else
              	   draw.fillrect(xstar + x, ystar + y, 5 * scale, 5 * scale, couleur);
          	 end
       end
end

function reset()
	pause = false;
	thetime = 10;
	bonustime = 1;
	pause = false;
	temps:reset(0);
	temps:stop();
	tablePoint = nil;
	stats = {
		temps=0,
		figure={0,0,0,0},
		couleur={0,0,0},
		result={0,0}
	};--remet à 0 les stats
	score = 0;
	task = "level";
end
