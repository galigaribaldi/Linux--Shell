function ListarFecha
{
ls -lad * | grep "$1" | cut -c54-
}
ls -lad $(ListarFecha "$1")

