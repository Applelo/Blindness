function intro()
	if temps:time() == 0 then
		temps:start();
	end

	if temps:time() < 1500 then
		image.blitsprite(oeil[1], x + (190 * scale), y + (86 * scale), typeOeil-1);
		draw.fillrect(-200 * scale, -100 * scale, 390 * scale, 500 * scale,color.black);
		draw.fillrect(290 * scale, -100 * scale, 390 * scale, 500 * scale,color.black);
		draw.fillrect(190 * scale, -100 * scale, 100 * scale, 186 * scale,color.black);
		draw.fillrect(190 * scale, 186 * scale, 100 * scale, 186 * scale,color.black);

	else
		image.blitsprite(point[1], (215 * scale), (111 * scale),0);
		draw.fillrect(-tempo, 0, (210 * scale), (272 * scale),color.black);
		draw.fillrect((270 * scale) + tempo, 0, (210 * scale), (272 * scale), color.black);
		image.blitsprite(fond, (210 * scale) - tempo, 0, 0);
		image.blitsprite(fond, (30 * scale) + tempo, 0, 1);
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

	control("menu")

	if (240 * scale) >= (x + (210 * scale)) - (60 * scale) and (240 * scale) <= (x + (210 * scale)) + (60 * scale) and (136 * scale) >= (y + (106 * scale)) - (40 * scale) and (136 * scale) <= (y + (106 * scale)) + (40 * scale) then
		screen.print(240 * scale, 136 * scale,"Blindness", 1.0 * scale, color.white, color.black, __ACENTER);
	else
		screen.print(240 * scale, 136 * scale,"Blindness", 1.0 * scale, color.black, color.white, __ACENTER);
	end

	--Accès au Menu jouer
	image.blit(element.play[1], 212 * scale, 30 * scale);
	image.blit(element.play[2], 212  * scale, 30 * scale, element.play[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (30 * scale) >= (y + (106 * scale)) - (20 * scale) and (30 * scale) <= (y + (106 * scale)) + (20 * scale) and element.play[3] < 255 then
			element.play[3] = element.play[3] + 3;
	elseif element.play[3] == 255 then

		if save.tuto == 1 then
			task = "tuto";
		else
			task = "level";
		end
		element.play[3] = 0;
	else
		element.play[3] = 0;
	end


	--Accès au Menu option
	image.blit(element.option[1], 80 * scale, 109 * scale);
	image.blit(element.option[2], 80 * scale, 109 * scale, element.option[3]);
	if (80 * scale) >= (x+(210 * scale)) - (20 * scale) and (80 * scale) <= (x + (210 * scale)) + (20 * scale) and (109 * scale) >= (y + (106 * scale)) - (20 * scale) and (109 * scale) <= (y + (106 * scale)) + (20 * scale) and element.option[3] < 255 then
		element.option[3] = element.option[3] + 3;
	elseif element.option[3] == 255 then
		task = "option";
		element.option[3] = 0;
	else
		element.option[3] = 0;
	end

	--Accès au Menu exit
	image.blit(element.exit[1], 212 * scale, 186 * scale);
	image.blit(element.exit[2], 212 * scale, 186 * scale, element.exit[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (186 * scale) >= (y + (106 * scale)) - (20 * scale) and (186 * scale) <= (y + (106 * scale)) + (20 * scale) and element.exit[3] < 255 then
		element.exit[3] = element.exit[3] + 3;
	elseif element.exit[3] == 255 then
		task = "exit";
	else
		element.exit[3] = 0;
	end

	--Accès au Menu info
	image.blit(element.info[1], 346 * scale, 109 * scale);
	image.blit(element.info[2], 346 * scale, 109 * scale, element.info[3]);
	if (346 * scale) >= (x + (210 * scale)) - (20 * scale) and (346 * scale) <= (x + (210 * scale)) + (20 * scale) and (109 * scale) >= (y + (106 * scale)) - (20 * scale) and (109 * scale) <= (y + (106 * scale)) + (20 * scale) and element.info[3] < 255 then
		element.info[3] = element.info[3] + 3;
	elseif element.info[3] == 255 then
		task = "info";
		element.info[3] = 0;
	else
		element.info[3] = 0;
	end

end

function info()
	control("menu")

	--Retour au Menu
	image.blit(element.exit[1], 212 * scale, 186 * scale);
	image.blit(element.exit[2], 212 * scale, 186 * scale, element.exit[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (186 * scale) >= (y + (106 * scale)) - (20 * scale) and (186 * scale) <= (y + (106 * scale)) + (20 * scale) and element.exit[3] < 255 then
		element.exit[3] = element.exit[3] + 3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		task = "menu";
	else
		element.exit[3] = 0;
	end

		screen.print(240 * scale, 15 * scale, "Version 2.0", 0.5 * scale, color.black, color.white, __ACENTER);
		screen.print(240 * scale, 30 * scale, "Powered by " .. oneLuaVersion, 0.5 * scale, color.black, color.white, __ACENTER);
		screen.print(55 * scale, 55 * scale, lang.cred[1], 0.6 * scale, color.black, color.white);
		screen.print(435 * scale, 55 * scale, lang.cred[2], 0.6 * scale, color.black, color.white, __ARIGHT);

end

function foption()

	control("menu")

	--Retour au Menu
	image.blit(element.exit[1], 212 * scale, 186 * scale);
	image.blit(element.exit[2], 212 * scale, 186 * scale,element.exit[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (186 * scale) >= (y + (106 * scale)) - (20 * scale) and (186 * scale) <= (y + (106 * scale)) + (20 * scale) and element.exit[3] < 255 then
		element.exit[3] = element.exit[3]+3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		sauvegarde();
		task = "menu";
	else
		element.exit[3] = 0;
	end

	--Affiche le menu de sensibilité
	screen.print(240 * scale, 25 * scale, option.sensibilite, 0.7 * scale, color.black, nil_color, __ACENTER);
	screen.print(240 * scale, 70 * scale, lang.sensibilite, 0.7 * scale, color.black, nil_color, __ACENTER);
	screen.print(130 * scale, 45 * scale,"L", 0.5 * scale,color.black, color.white);
	screen.print(340 * scale, 45 * scale,"R", 0.5 * scale,color.black, color.white);
	draw.line(140 * scale, 44 * scale, 340 * scale, 44 * scale,color.white);
	draw.line(140 * scale, 45 * scale, 340 * scale, 45 * scale,color.black);
	draw.fillrect((140 * scale) + (option.sensibilite * (15 * scale)), 39 * scale, 10 * scale, 22 * scale,color.white);
	draw.fillrect((140 * scale) + (option.sensibilite * (15 * scale)), 40 * scale, 10 * scale, 20 * scale,color.black);
	if buttons.r then
		option.sensibilite = option.sensibilite+1;
	elseif buttons.l then
		option.sensibilite = option.sensibilite-1;
	end

	if option.sensibilite > 12 then
		option.sensibilite = 12;
	elseif option.sensibilite<1 then
		option.sensibilite = 1;
	end

end

function level()

	control("menu")

	screen.print(240 * scale, 15 * scale, lang.mode, 0.7 * scale, color.black, color.white, __ACENTER);

	--Retour au Menu
	image.blit(element.exit[1], 212 * scale, 186 * scale);
	image.blit(element.exit[2], 212  * scale,186  * scale, element.exit[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (186 * scale) >= (y + (106 * scale)) - (20 * scale) and (186 * scale) <= (y + (106 * scale)) + (20 * scale) and element.exit[3] < 255 then
		element.exit[3] = element.exit[3] + 3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		sauvegarde();
		task = "menu";
	else
		element.exit[3] = 0;
	end

	--Accès au mode noir/blanc
	image.blit(element.nb[1],80 * scale,109 * scale);
	image.blit(element.nb[2],80 * scale,109 * scale,element.nb[3]);
	if (80 * scale) >= (x + (210 * scale)) - (20 * scale) and (80 * scale) <= (x + (210 * scale)) + (20 * scale) and (109 * scale) >= (y + (106 * scale)) - (20 * scale) and (109 * scale) <= (y + (106 * scale)) + (20 * scale) and element.nb[3]<255 then
		element.nb[3] = element.nb[3]+3;
		screen.print(240 * scale,135 * scale,lang.level[1],0.6 * scale,color.black,color.white,__ACENTER);
		screen.print(240 * scale,150 * scale,lang.score.." : "..save.sNB.."\n\n"..lang.temps.." : "..retourneTemps(save.tNB),0.5 * scale,color.black,color.white,__ACENTER);
	elseif element.nb[3] == 255 then
		niveau = "nb";
		task = "game";
		element.nb[3] = 0;
	else
		element.nb[3] = 0;
	end

	--Accès au mode couleur
	image.blit(element.cf[1],346 * scale,109 * scale);
	image.blit(element.cf[2],346 * scale,109 * scale, element.cf[3]);
	if (346 * scale) >= (x+(210 * scale)) - (20 * scale) and (346 * scale) <= (x + (210 * scale)) + (20 * scale) and (109 * scale) >= (y + (106 * scale)) - (20 * scale) and (109 * scale) <= (y + (106 * scale)) + (20 * scale) and element.cf[3]<255 then
		element.cf[3] = element.cf[3]+3;
		screen.print(240 * scale,135 * scale,lang.level[2],0.6 * scale,color.black,color.white,__ACENTER);
		screen.print(240 * scale,150 * scale,lang.score.." : "..save.sCF.."\n\n"..lang.temps.." : "..retourneTemps(save.tCF),0.5 * scale,color.black,color.white,__ACENTER);
	elseif element.cf[3] == 255 then
		niveau = "cf";
		task = "game";
		element.cf[3] = 0;
	else
		element.cf[3] = 0;
	end

	--Accès au Menu Recto noir/blanc
	image.blit(element.rectonb[1],150 * scale,70 * scale);
	image.blit(element.rectonb[2],150 * scale,70 * scale,element.rectonb[3]);
	if (150 * scale) >= (x + (210 * scale)) - (20 * scale) and (150 * scale) <= (x + (210 * scale)) + (20 * scale) and (70 * scale) >= (y +(106 * scale)) - (20 * scale) and (70 * scale) <= (y + (106 * scale)) + (20 * scale) and element.rectonb[3]<255 then
		element.rectonb[3] = element.rectonb[3]+3;
		screen.print(240 * scale,135 * scale,lang.level[3],0.6 * scale,color.black,color.white,__ACENTER);
		screen.print(240 * scale,150 * scale,lang.score.." : "..save.sNBR.."\n\n"..lang.temps.." : "..retourneTemps(save.tNBR),0.5 * scale,color.black,color.white,__ACENTER);
	elseif element.rectonb[3] == 255 then
		niveau = "nbrecto";
		task = "game";
		element.rectonb[3] = 0;
	else
		element.rectonb[3] = 0;
	end

	--Accès au Menu Recto couleur
	image.blit(element.rectocf[1],276* scale,70 * scale);
	image.blit(element.rectocf[2],276* scale,70 * scale,element.rectocf[3]);
	if (276 * scale) >= (x + (210 * scale)) - (20 * scale) and (276 * scale) <= (x+(210 * scale)) + (20 * scale) and (70 * scale) >= (y + (106 * scale)) - (20 * scale) and (70 * scale) <= (y + (106 * scale))+(20 * scale) and element.rectocf[3] < 255 then
		element.rectocf[3] = element.rectocf[3] + 3;
		screen.print(240 * scale,135 * scale,lang.level[4],0.6 * scale,color.black,color.white,__ACENTER);
		screen.print(240 * scale,150 * scale,lang.score.." : "..save.sCFR.."\n\n"..lang.temps.." : "..retourneTemps(save.tCFR),0.5 * scale,color.black,color.white,__ACENTER);
	elseif element.rectocf[3] == 255 then
		niveau = "cfrecto";
		task = "game";
		element.rectocf[3] = 0;
	else
		element.rectocf[3] = 0;
	end

end

function loose()

	control("menu");

	if scale == 1 then
		if niveau == "nb" or niveau == "nbrecto" then
			scroll = screen.print(scroll, 255 * scale,lang.figure[1].." : "..stats.figure[1]..", "..lang.figure[2].." : "..stats.figure[2]..", "..lang.figure[3].." : "..stats.figure[3]..", "..lang.figure[4].." : "..stats.figure[4],0.5 * scale,color.black,color.white,__STHROUGH,200 * scale);
		else
			scroll = screen.print(scroll, 255 * scale,lang.figure[1].." : "..stats.figure[1]..", "..lang.figure[2].." : "..stats.figure[2]..", "..lang.figure[3].." : "..stats.figure[3]..", "..lang.figure[4].." : "..stats.figure[4]..", "..lang.couleur[1].." : "..stats.couleur[1]..", "..lang.couleur[2].." : "..stats.couleur[2]..", "..lang.couleur[3].." : "..stats.couleur[3],0.5 * scale,color.black,color.white,__STHROUGH,200 * scale);
		end
	else--Scroll option isn't available for ONEluaVita2R0
		if niveau == "nb" or niveau == "nbrecto" then
			screen.print(800 + scroll, 255 * scale, lang.figure[1].." : "..stats.figure[1]..", "..lang.figure[2].." : "..stats.figure[2]..", "..lang.figure[3].." : "..stats.figure[3]..", "..lang.figure[4].." : "..stats.figure[4],0.5 * scale,color.black,nil_color);
		else
			screen.print(800 + scroll, 255 * scale, lang.figure[1].." : "..stats.figure[1]..", "..lang.figure[2].." : "..stats.figure[2]..", "..lang.figure[3].." : "..stats.figure[3]..", "..lang.figure[4].." : "..stats.figure[4]..", "..lang.couleur[1].." : "..stats.couleur[1]..", "..lang.couleur[2].." : "..stats.couleur[2]..", "..lang.couleur[3].." : "..stats.couleur[3],0.5 * scale,color.black,color.white);
		end
		scroll = scroll - 1.5
		if scroll < -1000 then
			scroll = 0
		end
	end

	image.blitsprite(fond,0,0,0);
	image.blitsprite(fond,240 * scale,0,1);
	image.blitsprite(point[1],x + (215 * scale),y + (111 * scale),0);

	if niveau == "nb" then

		--Tableau de gauche
		if score > save.sNB then
			draw.fillrect(80 * scale,70 * scale,50 * scale,(150*(save.sNB/score)) * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(80 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,(150*(score/save.sNB)) * scale,color.black);
		end
		screen.print(100 * scale,75 * scale, save.sNB,0.5 * scale,color.white,color.black);
		screen.print(145 * scale,75 * scale, score,0.5 * scale,color.black,color.white);

		--Tableau de droite
		if stats.temps > save.tNB then
			draw.fillrect(300 * scale,70 * scale,50 * scale,(150*(save.tNB/stats.temps)) * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(300 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,(150*(stats.temps/save.tNB)) * scale,color.black);
		end
		screen.print(310 * scale,75 * scale,retourneTemps(save.tNB),0.5 * scale,color.white,color.black);
		screen.print(360 * scale,75 * scale,retourneTemps(stats.temps),0.5 * scale,color.black,color.white);
	elseif niveau == "cf" then

		--Tableau de gauche
		if score > save.sCF  then
			draw.fillrect(80 * scale,70 * scale,50 * scale,(150*(save.sCF/score)) * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(80 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,(150*(score/save.sCF)) * scale,color.black);
		end
		screen.print(100 * scale,75 * scale,save.sCF,0.5 * scale,color.white,color.black);
		screen.print(145 * scale,75 * scale,score,0.5 * scale,color.black,color.white);

		--Tableau de droite
		if stats.temps > save.tCF then
			draw.fillrect(300 * scale,70 * scale,50 * scale,(150*(save.tCF/stats.temps)) * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(300 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,(150*(stats.temps/save.tCF)) * scale,color.black);
		end
		screen.print(310 * scale,75 * scale,retourneTemps(save.tCF),0.5 * scale,color.white,color.black);
		screen.print(360 * scale,75 * scale,retourneTemps(stats.temps),0.5 * scale,color.black,color.white);

	elseif niveau == "nbrecto" then
		--Tableau de gauche
		if score > save.sNBR then
			draw.fillrect(80 * scale,70 * scale,50 * scale,(150*(save.sNBR/score)) * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(80 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,(150*(score/save.sNBR)) * scale,color.black);
		end
		screen.print(100 * scale,75 * scale,save.sNBR,0.5 * scale,color.white,color.black);
		screen.print(145 * scale,75 * scale,score,0.5 * scale,color.black,color.white);

		--Tableau de droite
		if stats.temps > save.tNBR then
			draw.fillrect(300 * scale,70 * scale,50 * scale,(150*(save.tNBR/stats.temps)) * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(300 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,(150*(stats.temps/save.tNBR)) * scale,color.black);
		end
		screen.print(310 * scale,75 * scale,retourneTemps(save.tNBR),0.5 * scale,color.white,color.black);
		screen.print(360 * scale,75 * scale,retourneTemps(stats.temps),0.5 * scale,color.black,color.white);
	else

		--Tableau de gauche
		if score > save.sCFR  then
			draw.fillrect(80 * scale,70 * scale,50 * scale,150*(save.sCFR/score),color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(80 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(130 * scale,70 * scale,50 * scale,(150*(score/save.sCFR)) * scale,color.black);
		end
		screen.print(100 * scale,75 * scale,save.sCFR,0.5 * scale,color.white,color.black);
		screen.print(145 * scale,75 * scale,score,0.5 * scale,color.black,color.white);

		--Tableau de droite
		if stats.temps > save.tCFR then
			draw.fillrect(300 * scale,70 * scale,50 * scale,(150 * (save.tCFR/stats.temps)) * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,150 * scale,color.black);
		else
			draw.fillrect(300 * scale,70 * scale,50 * scale,150 * scale,color.black);
			draw.rect(350 * scale,70 * scale,50 * scale,(150 * (stats.temps/save.tCFR)) * scale,color.black);
		end
		screen.print(310 * scale,75 * scale,retourneTemps(save.tCFR),0.5 * scale,color.white,color.black);
		screen.print(360 * scale,75 * scale,retourneTemps(stats.temps),0.5 * scale,color.black,color.white);

	end

	screen.print(125 * scale, 40 * scale,lang.fin[1], 0.5 * scale,color.black,color.white,__ARIGHT);--Ecriture de gauche
	draw.line(130 * scale, 40 * scale, 130 * scale, 55 * scale,color.black);--Trait du milieu
	screen.print(135 * scale, 40 * scale,lang.fin[2], 0.5 * scale,color.black,color.white,__ALEFT);
	screen.print(130 * scale, 57, lang.fin[3], 0.5 * scale,color.black,color.white,__ACENTER);

	if score > 0 then--Milieu
		screen.print(240 * scale, 20 * scale,lang.fin[5], 0.6 * scale,color.black,color.white,__ACENTER);
		image.blitsprite(point[stats.result[2]], 215 * scale, 40 * scale,stats.result[1]);--Affichage du plus vue
	end

	screen.print(345 * scale, 40 * scale,lang.fin[1], 0.5 * scale,color.black,color.white,__ARIGHT);--Ecriture de droite
	draw.line(350 * scale, 40 * scale, 350 * scale, 55 * scale,color.black);--Trait au centre
	screen.print(355 * scale, 40 * scale,lang.fin[2], 0.5 * scale,color.black,color.white,__ALEFT);
	screen.print(350 * scale, 57 * scale,lang.fin[4], 0.5 * scale,color.black,color.white,__ACENTER);

	if pstv == 1 then
		buttons.lbar(1,color.black)
	end

	--Share score online
	-- if buttons.start then
	-- 	if os.message("Send your score online? We crypt your email and use your username to create an unique identifier. If you don't believe me, check the code ;)",1) == 1 then
	-- 		share()
	-- 	end
	-- end

	--Retour au Menu de choix de Level
	image.blit(element.exit[1], 212 * scale, 186 * scale);
	image.blit(element.exit[2], 212 * scale, 186 * scale,element.exit[3]);
	if (212 * scale) >= (x + (210 * scale)) - (20 * scale) and (212 * scale) <= (x + (210 * scale)) + (20 * scale) and (186 * scale) >= (y + (106 * scale)) - (20 * scale) and (186 * scale) <= (y + (106 * scale)) + (20 * scale) and element.exit[3] < 255 then
		element.exit[3] = element.exit[3] + 3;
	elseif element.exit[3] == 255 then
		element.exit[3] = 0;
		--Sauvegarde le score effectué
		if score > save.sNB and niveau == "nb" then
			save.sNB = score;
		end
		if score > save.sCF and niveau == "cf" then
			save.sCF = score;
		end
		if score > save.sNBR and niveau == "nbrecto" then
			save.sNBR = score;
		end
		if score > save.sCFR and niveau == "cfrecto" then
			save.sCFR = score;
		end

		if stats.temps > save.tNB and niveau == "nb" then
			save.tNB = stats.temps;
		end
		if stats.temps > save.tCF and niveau == "cf" then
			save.tCF = stats.temps;
		end
		if stats.temps > save.tNBR and niveau == "nbrecto" then
			save.tNBR = stats.temps;
		end
		if stats.temps > save.tCFR and niveau == "cfrecto" then
			save.tCFR = stats.temps;
		end
		if scale == 1 then
			scroll = 0;
		end

		sauvegarde();
		stats = {
			temps=0,
			figure={0,0,0,0},
			couleur={0,0,0},
			result={0,0}
		};--remet à 0 les stats
		score = 0;
		pause = false;
		task = "level";
	else
		element.exit[3] = 0;
	end

end

-- function share()
-- 	identifier = sha1(os.login());
-- 	region = os.psnregion();
-- 	pseudo = os.nick();
-- end
