if (instance_exists(other)) 
{
    other.hp -= 2;        // tira vida
    other.delay_barra = 0.5;  // atrasa a barra laranja
    other.hit_timer = 0.1;  // fica vermelho por 0.1 segundos
    
    instance_destroy();   // some o tiro
}