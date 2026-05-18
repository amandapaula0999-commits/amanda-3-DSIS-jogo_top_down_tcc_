
event_inherited(); ///pai

// se estiver na mâo 
if (!na_mao) return; 

#region /////////ATACAR 

if (!atacando) 
{
    // Segue o mouse
    image_angle = point_direction(x, y, mouse_x, mouse_y);

    if (mouse_check_button_pressed(mb_right)) 
    {
        atacando = true;
        fase_ataque = 0;
        angulo_base = image_angle;
    }
} 
else 
{
    // Aumenta a fase: 1 dividido por 240 quadros (0.27 segundos) (6*60=360.   1/360=0.00277....)
    fase_ataque += 0.06; // Velocidade para fazer o ataque 

    // Cálculo do Arco de 60 graus usando Seno
    // O dsin(fase * 180) faz a faca ir até 60 e voltar para 0 
	
	
    var _arco = dsin(fase_ataque * 180) * 60; //dsin: calcula o seno (graus) movimento de arco
    image_angle = angulo_base + _arco;
	
#endregion////////////////////

#region////DANO 
    
	
    var _inimigo = instance_place(x, y, Obj_inimigo_teste);
    if (_inimigo != noone) 
    {
        with(_inimigo) {
            scr_inimigo_receber_dano(other.dano);
        }
    }
	
#endregion//////////

#region///VOLTA OU NORMAL

    if (fase_ataque >= 1) 
    {
        atacando = false;
        fase_ataque = 0;
    }
}

#endregion//////////////