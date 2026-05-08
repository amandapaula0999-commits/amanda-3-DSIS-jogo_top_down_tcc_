// Verifica se o objeto que colidiu tem uma variável de dano
// Se não tiver, assume que o dano padrão é 1
var _dano_para_receber = 1;

if (variable_instance_exists(other, "dano"))
{
    _dano_para_receber = other.dano;
}

scr_inimigo_receber_dano(_dano_para_receber);

// Destrói o projétil
instance_destroy(other);

scr_inimigo_receber_dano(other.dano);
instance_destroy(other); // O tiro some ao bater