// inimigo empurra o jogador
var _dir = point_direction(x, y, other.x, other.y);
var _forca = 5;
other.x += lengthdir_x(_forca, _dir);
other.y += lengthdir_y(_forca, _dir);

// se o jogaror levar dano ele fica vermelho e inune, se ele não estiver imune leva outro dano 
if (other.hit_timer <= 0)
{
    other.hp -= 1;     // tira 1 de vida do jogador
    other.hit_timer = 0.5; // ica vermelho e "invencível" por meio segundo
}