#region////// PEGAR E LARGAR A ARMA  
 

if (!instance_exists(Obj_jogador)) return;

var _distancia = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);
var _tecla_pegar = keyboard_check_pressed(ord("E"));

if (_distancia <= 70 && _tecla_pegar) 
{ 
    // Não esta na mão, pegar 
    if (!na_mao) 
    {
        // Encontra qual arma está mais perto do jogador
        var _arma_mais_proxima = instance_nearest(Obj_jogador.x, Obj_jogador.y, Obj_pai_armas);
        
        // Só pega a que esta perto, não pode pegar as duas junto 
        if (_arma_mais_proxima == id)
        {
            // Pega esta arma (a parte de guardar a outra foi removida daqui)
            na_mao = true;
        }
    }
    // Esta na mão e aperta E 
    else 
    {
        // Procura pelo objeto 
        var _item_perto = instance_nearest(Obj_jogador.x, Obj_jogador.y, obj_coletavel_pai);
        var _distancia_item = 10000; // Valor alto inicial
        
        if (_item_perto != noone)
        {
            _distancia_item = point_distance(Obj_jogador.x, Obj_jogador.y, _item_perto.x, _item_perto.y);
        }

        // se não tiver nada em 70 pix no chão, larga 
        if (_distancia_item > 70)
        {
            na_mao = false; // Larga a arma
        }
        // Se tiver ele pega 
    }
}

// Se não estiver na mão, o código para aqui 
if (!na_mao) return; 

#endregion


#region////  SEGUIR O JOGADOR 

x = Obj_jogador.x;
y = Obj_jogador.y;
depth = Obj_jogador.depth - 1;

#endregion////////////

#region////  tempo entre tiros

var _dt = delta_time / 1000000;
if (daley_tiro > 0) daley_tiro -= _dt;

#endregion/////////


#region/// SEGUE O MOUSE 

if (atacando) return; 

// Segue a direção do mouse 
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Inverte a sprite
if (image_angle > 90 && image_angle < 270)
{
    image_yscale = -1; 
}
else
{
    image_yscale = 1;
}

#endregion///////////