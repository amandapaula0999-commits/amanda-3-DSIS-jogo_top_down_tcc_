// VARIAVEL DE VELOCIDADE 
velh = 0; // Velocidade horizontal
velv = 0; // Velocidade vertical
max_vel = 5; // Velocidade máxima

///VARIAVEL DE TROCA DE SPRITE
movendo = 0; 
lado = 0;

///VARAVEL DA VIDA E A BARRA DE VIDA
hp_max = 10; //Vida max
hp = 10;// vida normal
hit_timer = 0; // Ficar vermelho quando leva dano 
invulneravel_timer = 0; //Não pode levar dano


////VARIAVEL DE CURA
cooldown_cura = 0; // Guarda o tempo restante do cooldown
kits_na_mao = 0;  /////Se o kit esta na mão 
cooldown_cura = 0; ////Tempo para curar de novo 
ocupado = false;   //////Confere se tem alguma coisa na mão 


////VARIAVEL DE FALA

texto_fala = ""; /// fala
timer_fala = 0; //// tempo de fala 

cooldown_arremesso = 0; // Nova trava para controlar os arremessos um por um