// Posição e tamanho da barra
var _x1 = 40;
var _y1 = 40;
var _x2 = 240;
var _y2 = 55;

// Cálculo da porcentagem para a barra
var _porcentagem = (hp / hp_max) * 100;

// Desenha a barra de vida

draw_healthbar(_x1, _y1, _x2, _y2, _porcentagem, c_black, c_maroon,c_red, 0, true, true);

#region///////////// troca de arma (vai ficar no canto da tela e mostrar a arma que esta gardada dentro dele 

////CONFIGURAÇÃO DE TAMANHO E POSIÇÃO 
var _escala = 0.5; // Diminui o tamanho do hexágono pela metade
var _margem = -10;  // Distância de pixels das bordas da tela
var _altura_tela = display_get_gui_height(); // Pega a altura total da tela do jogador

// Calcula a posição exata que vai ficar 
var _hud_x = _margem;
var _hud_y = _altura_tela - (290 * _escala) - _margem;

////// DESENHAR O HEXÁGONO 
// Desenha a sua sprite na tela de forma fixa
draw_sprite_ext(Spr_muchila, 0, _hud_x, _hud_y, _escala, _escala, 0, c_white, 1);

#endregion/////////////


