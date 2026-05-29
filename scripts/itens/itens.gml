#region//////////// item de cura 

function scr_jogador_curar(_valor) 
{
    if (instance_exists(Obj_jogador))
    {
        // VIDA CHEIA (Não cura)
        if (Obj_jogador.hp >= Obj_jogador.hp_max) 
        {
            Obj_jogador.texto_fala = "Não me sinto mal agora";
            Obj_jogador.timer_fala = 120; // Aparece por 2 segundos (se o jogo for 60fps)
            return false; 
        }
        
        // FOI CURADO
        Obj_jogador.hp += _valor;
        
        if (Obj_jogador.hp > Obj_jogador.hp_max) Obj_jogador.hp = Obj_jogador.hp_max;
        
        Obj_jogador.image_blend = c_lime;
        Obj_jogador.hit_timer = 0.2; 
        Obj_jogador.ocupado = false; 
        
        Obj_jogador.texto_fala = "A dor passou";
        Obj_jogador.timer_fala = 120; 
        
        return true; 
    }
    return false; 
}
 


#endregion///////////////