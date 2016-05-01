function intro()
	if temps:time() == 0 then
		temps:start();
	end
	
	if temps:time() < 1500 then
		image.blit(oeil[typeOeil],x+190,y+86);
		draw.fillrect(-200,-100,390,500,color.black);
		draw.fillrect(290,-100,390,500,color.black);
		draw.fillrect(190,-100,100,186,color.black);
		draw.fillrect(190,186,100,186,color.black);
		
	else
		image.blit(point[1],215,111);
		draw.fillrect(-tempo,0,210,272,color.black);
		draw.fillrect(270+tempo,0,210,272,color.black);
		image.blitsprite(fond,210-tempo,0,0);
		image.blitsprite(fond,30+tempo,0,1);
		tempo = tempo + 7;
	end
	
	if temps:time() > 250 and temps:time() < 500 then
		typeOeil = 3;
	elseif temps:time() > 750 and temps:time() < 1000 then
		typeOeil = 2;
	elseif temps:time() > 1250 and temps:time() < 1500 then
		typeOeil = 1;
	elseif temps:time() > 2000 then
		temps:reset(0);
		temps:stop();
		tempo = 0;
		typeOeil = 1;
		task = "menu";
	end
	
	
end

function menu()
	if save.joystick then
		x = buttons.analogx;
		y = buttons.analogy*0.6;
	else
		control("menu")
	end
	
	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240,0,1);
	image.blit(point[1],x+215,y+111);
	screen.print(240,136,"Blindness",1.0,color.black,color.white,__ACENTER);
	
	--Accès au Menu jouer
	image.blit(element.play[1],212,30);
	image.blit(element.play[2],212,30,element.play[3]);
	if 212 >= (x+210)-20 and 212 <= (x+210)+20 and 30 >= (y+106)-20 and 30 <= (y+106)+20 and element.play[3]<255 then
		element.play[3] = element.play[3]+3;
	elseif element.play[3] == 255 then
		
		if save.tuto then
			task = "tuto";
		else
			task = "level";
		end
		element.play[3] = 0;
	else
		element.play[3] = 0;
	end
	
	--Accès au Menu option
	image.blit(element.option[1],80,109);
	image.blit(element.option[2],80,109,element.option[3]);
	if 80 >= (x+210)-20 and 80 <= (x+210)+20 and 109 >= (y+106)-20 and 109 <= (y+106)+20 and element.option[3]<255 then
		element.option[3] = element.option[3]+3;
	elseif element.option[3] == 255 then
		task = "option";
		element.option[3] = 0;
	else
		element.option[3] = 0;
	end
	
	--Accès au Menu exit
	image.blit(element.exit[1],212,186);
	image.blit(element.exit[2],212,186,element.exit[3]);
	if 212 >= (x+210)-20 and 212 <= (x+210)+20 and 186 >= (y+106)-20 and 186 <= (y+106)+20 and element.exit[3]<255 then
		element.exit[3] = element.exit[3]+3;
	elseif element.exit[3] == 255 then
		task = "exit";
	else
		element.exit[3] = 0;
	end
	
	--Accès au Menu info
	image.blit(element.info[1],346,109);
	image.blit(element.info[2],346,109,element.info[3]);
	if 346 >= (x+210)-20 and 346 <= (x+210)+20 and 109 >= (y+106)-20 and 109 <= (y+106)+20 and element.info[3]<255 then
		element.info[3] = element.info[3]+3;
	elseif element.info[3] == 255 then
		task = "info";
		element.info[3] = 0;
	else
		element.info[3] = 0;
	end
	
end

function info()

	if save.joystick then
		x = buttons.analogx;
		y = buttons.analogy*0.6;
	else
		control("menu")
	end
	
	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240,0,1);
	image.blit(point[1],x+215,y+111);
	
	--Retour au Menu
	image.blit(element.exit[1],212,186);
	image.blit(element.exit[2],212,186,element.exit[3]);
	if 212 >= (x+210)-20 and 212 <= (x+210)+20 and 186 >= (y+106)-20 and 186 <= (y+106)+20 and element.exit[3]<255 then
		element.exit[3] = element.exit[3]+3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		task = "menu";
	else
		element.exit[3] = 0;
	end
	screen.print(220,20,"Version 1.0",0.5,color.black,color.white,200,__ACENTER);
	screen.print(80,50,lang.cred[1],0.7,color.black,color.white);
	screen.print(400,50,lang.cred[2],0.7,color.black,color.white,__ARIGHT);

end

function option()
	
	if save.joystick then
		x = buttons.analogx;
		y = buttons.analogy*0.6;
	else
		control("menu")
	end
	
	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240,0,1);
	image.blit(point[1],x+215,y+111);
	--Retour au Menu
	image.blit(element.exit[1],212,186);
	image.blit(element.exit[2],212,186,element.exit[3]);
	if 212 >= (x+210)-20 and 212 <= (x+210)+20 and 186 >= (y+106)-20 and 186 <= (y+106)+20 and element.exit[3]<255 then
		element.exit[3] = element.exit[3]+3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		sauvegarde();
		task = "menu";
	else
		element.exit[3] = 0;
	end
	
	screen.print(80,50,"JoyStick",1.0,color.black,color.white);
	if save.joystick then
		image.blit(element.vert[1],80,80);
	else
		--Affiche le menu de sensibilité de la croix directionelle
		screen.print(240,55,save.sensibilite.."\n\n\n"..lang.sensibilite,1.0,color.black,color.white,__ACENTER);
		screen.print(130,75,"L",0.5,color.black);
		screen.print(340,75,"R",0.5,color.black);
		draw.line(140,80,340,80,color.black);
		draw.fillrect(140+(save.sensibilite*15),70,10,20,color.black);
		if buttons.r then
			save.sensibilite = save.sensibilite+1;
		elseif buttons.l then
			save.sensibilite = save.sensibilite-1;
		end
		
		if save.sensibilite > 12 then
			save.sensibilite = 12;
		elseif save.sensibilite<1 then
			save.sensibilite = 1;
		end
			
		
		image.blit(element.rouge[1],80,80);
	end
	
	if 80 >= (x+210)-20 and 80 <= (x+210)+20 and 80 >= (y+106)-20 and 80 <= (y+106)+20 and buttons.cross then
		if save.joystick then
			save.joystick = false;
		else
			save.joystick = true;
		end
	end
	
	
	
	screen.print(400,50,lang.tuto[1],1.0,color.black,color.white,__ARIGHT);
	if save.tuto then
		image.blit(element.vert[1],349,80);
	else
		image.blit(element.rouge[1],349,80);
	end
	
	if 349 >= (x+210)-20 and 349 <= (x+210)+20 and 80 >= (y+106)-20 and 80 <= (y+106)+20 and buttons.cross then
		if save.tuto then
			save.tuto = false;
		else
			save.tuto = true;
		end
	end		
	
end

function level()
	
	if save.joystick then
		x = buttons.analogx;
		y = buttons.analogy*0.6;
	else
		control("menu")
	end
	
	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240,0,1);
	image.blit(point[1],x+215,y+111);
	--Retour au Menu
	image.blit(element.exit[1],212,186);
	image.blit(element.exit[2],212,186,element.exit[3]);
	if 212 >= (x+210)-20 and 212 <= (x+210)+20 and 186 >= (y+106)-20 and 186 <= (y+106)+20 and element.exit[3]<255 then
		element.exit[3] = element.exit[3]+3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		sauvegarde();
		task = "menu";
	else
		element.exit[3] = 0;
	end
	
	--Accès au Niveau I
	image.blit(element.levelI[1],80,109);
	image.blit(element.levelI[2],80,109,element.levelI[3]);
	if 80 >= (x+210)-20 and 80 <= (x+210)+20 and 109 >= (y+106)-20 and 109 <= (y+106)+20 and element.levelI[3]<255 then
		element.levelI[3] = element.levelI[3]+3;
		screen.print(240,136,lang.score.." : "..save.sI.."\n"..lang.score.." : "..retourneTemps(save.tI),0.7,color.black,color.white,__ACENTER);
	elseif element.levelI[3] == 255 then
		--Paramètre du niveau I
		niveau = 1;
		task = "game";
		element.levelI[3] = 0;
	else
		element.levelI[3] = 0;
	end
	
	--Accès au Niveau II
	image.blit(element.levelII[1],150,50);
	image.blit(element.levelII[2],150,50,element.levelII[3]);
	if 150 >= (x+210)-20 and 150 <= (x+210)+20 and 50 >= (y+106)-20 and 50 <= (y+106)+20 and element.levelII[3]<255 then
		element.levelII[3] = element.levelII[3]+3;
		screen.print(240,136,lang.score.." : "..save.sII.."\n"..lang.score.." : "..retourneTemps(save.tII),0.7,color.black,color.white,__ACENTER);
	elseif element.levelII[3] == 255 then
		--Paramètre du niveau II
		niveau = 2;
		task = "game";
		element.levelII[3] = 0;
	else
		element.levelII[3] = 0;
	end
	
	--Accès au Niveau III
	image.blit(element.levelIII[1],276,50);
	image.blit(element.levelIII[2],276,50,element.levelIII[3]);
	if 276 >= (x+210)-20 and 276 <= (x+210)+20 and 50 >= (y+106)-20 and 50 <= (y+106)+20 and element.levelIII[3]<255 then
		element.levelIII[3] = element.levelIII[3]+3;
		screen.print(240,136,lang.score.." : "..save.sIII.."\n"..lang.score.." : "..retourneTemps(save.tIII),0.7,color.black,color.white,__ACENTER);
	elseif element.levelIII[3] == 255 then
		--Paramètre du niveau III
		niveau = 3;
		task = "game";
		element.levelIII[3] = 0;
	else
		element.levelIII[3] = 0;
	end
	
	--Accès au Niveau IV
	image.blit(element.levelIV[1],346,109);
	image.blit(element.levelIV[2],346,109,element.levelIV[3]);
	if 346 >= (x+210)-20 and 346 <= (x+210)+20 and 109 >= (y+106)-20 and 109 <= (y+106)+20 and element.levelIV[3]<255 then
		element.levelIV[3] = element.levelIV[3]+3;
		screen.print(240,136,lang.score.." : "..save.sIV.."\n"..lang.score.." : "..retourneTemps(save.tIV),0.7,color.black,color.white,__ACENTER);
	elseif element.levelIV[3] == 255 then
		--Paramètre du niveau IV
		niveau = 4;
		task = "game";
		element.levelIV[3] = 0;
	else
		element.levelIV[3] = 0;
	end
end

function tutoriel()
	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240,0,1);
	screen.print(200,30,lang.tuto[1],1.0,color.black,color.white,200,__ACENTER);
	
	if stepTuto == 1 then
		screen.print(80,50,lang.tuto[2],0.7,color.black,color.white,__AFULL,300);
		image.blit(point[typeOeil],215,150);
		if buttons.circle then
			typeOeil = 1;
		elseif buttons.cross then
			typeOeil = 2;
		elseif buttons.square then
			typeOeil = 3;
		elseif buttons.triangle then
			typeOeil = 4;
		end
		screen.print(110,235,lang.tuto[6],0.8,color.black,color.white,200,__ACENTER);
		if buttons.start then
			stepTuto = 2;
		end
		
	elseif stepTuto == 2 then
		screen.print(80,50,lang.tuto[3],0.7,color.black,color.white,__AFULL,300);
		screen.print(110,235,lang.tuto[6],0.8,color.black,color.white,200,__ACENTER);
		if buttons.start then
			stepTuto = 3;
		end
	elseif stepTuto == 3 then
		if save.joystick then
			x = buttons.analogx;
			y = buttons.analogy*0.6;
		else
			control("menu")
		end
		screen.print(80,50,lang.tuto[4],0.7,color.black,color.white,__AFULL,300);
		image.blit(point[1],215,180);
		image.blit(oeil[typeOeil],x+190,y+86);
		draw.fillrect(x-200,y-100,390,500,color.black);
		draw.fillrect(290+x,y-100,390,500,color.black);
		draw.fillrect(x+190,y-100,100,186,color.black);
		draw.fillrect(x+190,y+186,100,186,color.black);
		if buttons.circle then
			typeOeil = 1;
		elseif buttons.cross then
			typeOeil = 2;
		elseif buttons.square then
			typeOeil = 3;
		elseif buttons.triangle then
			typeOeil = 4;
		end
		if 215 >= (x+210)-20 and 215 <= (x+210)+20 and 180 >= (y+106)-20 and 180 <= (y+106)+20 and typeOeil == 1 then
			stepTuto = 4;
		end
	elseif stepTuto == 4 then
		screen.print(80,50,lang.tuto[5],0.7,color.black,color.white,__AFULL,300);
		if buttons.start then
			stepTuto = 1;
			save.tuto = false;
			task = "level";
			sauvegarde();
		end
		screen.print(110,235,lang.tuto[6],0.8,color.black,color.white,200,__ACENTER);
	end

	
end