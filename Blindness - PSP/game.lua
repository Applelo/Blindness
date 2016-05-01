function game()
	
	if temps:time() == 0 then
		temps:start();
		generateur(1,niveau)
	end
	
	if niveau == 1 then
		if save.tI < temps:time() then
			save.tI = temps:time();
		end
	elseif niveau == 2 then
		if save.tII < temps:time() then
			save.tII = temps:time();
		end
	elseif niveau == 3 then
		if save.tIII < temps:time() then
			save.tIII = temps:time();
		end
	else
		if save.tIV < temps:time() then
			save.tIV = temps:time();
		end
	end
	
	if save.joystick then
		x = buttons.analogx*1.5;
		y = buttons.analogy*0.7;
	else
		control("game");
	end
	
	if moinsPoint == 0 then
		bonustime = bonustime + 1;
		if bonustime<16 then
			generateur(bonustime,niveau);
		else
			generateur(16,niveau);
		end	
		tempo = 100;
	end
	if tempo < 255 then
		tempo = tempo + 3;
	end

	for i=1, nbrPoint do
		if tablePoint[i].affiche then
			image.blit(point[tablePoint[i].type],tablePoint[i].x,tablePoint[i].y,tempo);
		end
		if tablePoint[i].x >= (x+210)-20 and tablePoint[i].x <= (x+210)+20 and tablePoint[i].y >= (y+106)-20 and tablePoint[i].y <= (y+106)+20 and typeOeil == tablePoint[i].type and tablePoint[i].affiche then
			tablePoint[i].affiche = false;
			moinsPoint = moinsPoint-1;
			score = score + 1;
		end
	end
	
		image.blit(oeil[typeOeil],x+190,y+86,tempo);
		draw.fillrect(x-200,y-100,390,500,color.new(0,0,0,tempo));
		draw.fillrect(290+x,y-100,390,500,color.new(0,0,0,tempo));
		draw.fillrect(x+190,y-100,100,186,color.new(0,0,0,tempo));
		draw.fillrect(x+190,y+186,100,186,color.new(0,0,0,tempo));
		if tempo > 255 then
			draw.fillrect(x-200,y-100,390,500,color.black);
			draw.fillrect(290+x,y-100,390,500,color.black);
			draw.fillrect(x+190,y-100,100,186,color.black);
			draw.fillrect(x+190,y+186,100,186,color.black);
			screen.print(240,60,tempsToRebour(61+(bonustime*5)-5),1.0,color.black,color.white,__ACENTER);
		else
			screen.print(240,60,tempsToRebour(61+(bonustime*5)-5),1.0,color.white,color.black,__ACENTER);	
		end
	

	if buttons.circle then
		typeOeil = 1;
	elseif buttons.cross then
		typeOeil = 2;
	elseif buttons.square then
		typeOeil = 3;
	elseif buttons.triangle then
		typeOeil = 4;
	end
	
	if thetime <= 0 then--Fin de la partie et reset les compteurs
		thetime = 10;
		bonustime = 1;
		temps:reset(0);
		temps:stop();
		tablePoint = nil
		if niveau == 1 then
			if score > save.sI then
				save.sI = score;
			end
		elseif niveau == 2 then
			if score > save.sII then
				save.sII = score;
			end	
		elseif niveau == 3 then
			if score > save.sIII then
				save.sIII = score;
			end
		else
			if score > save.sIV then
				save.sIV = score;
			end
		end
		sauvegarde()
		task = "level";
	end	

end

function sauvegarde()
	filesave = io.open("save.lua","w");
	filesave:write("save = {\ntuto = "..tostring(save.tuto)..",\njoystick = "..tostring(save.joystick)..",\nsensibilite = "..save.sensibilite..",\nsI = "..save.sI..",\nsII = "..save.sII..",\nsIII = "..save.sIII..",\nsIV = "..save.sIV..",\ntI = "..save.tI..",\ntII = "..save.tII..",\ntIII = "..save.tIII..",\ntIV = "..save.tIV.."\n}");
	filesave:close();
end

function control(choix)
	
	if choix == "menu" then	
		if x < -127 then
			x = -127;
		elseif x > 127 then
			x = 127;
		end
		if y < -76.8 then 
			y = -76.8;
		elseif y > 76.2 then
			y = 76.2;
		end
	elseif choix== "game" then
		if x < -192 then
			x = -192;
		elseif x > 190.5 then
			x = 190.5;
		end
		if y < -89.6 then 
			y = -89.6;
		elseif y > 88.9 then
			y = 88.9;
		end
	end
	
	if buttons.held.up then
		y = y-save.sensibilite;
	end
	if buttons.held.down then
		y = y+save.sensibilite;
	end
	if buttons.held.right then
		x = x+save.sensibilite;
	end
	if buttons.held.left then
		x = x-save.sensibilite;
	end
	
end

function generateur(nbr,limite) 
	tablePoint = {};
	nbrPoint = nbr;
	for i=1, nbrPoint do
		tablePoint[i] = {x=math.random(50,420),y=math.random(50,200),affiche=true,type=math.random(1,limite)};
	end
	moinsPoint = nbrPoint;
	temps:start();
end

function tempsToRebour(sec)
	sec = sec*1000;
	thetime = (temps:time()-sec)*-1;
	return math.floor((thetime/1000)/60)..":"..(math.floor(thetime/1000)-math.floor((thetime/1000)/60)*60);
end

function retourneTemps(milli)
	return math.floor((milli/1000)/60)..":"..(math.floor(milli/1000)-math.floor((milli/1000)/60)*60);
end