using System.Data.SqlClient;
using Dapper;
public class BD{
    private static string _connectionString = @"Server=localhost;
    Database=JJOO_Szwarcbort_Garber;Trusted_Connection=True";
    public static void AgregarDeportista(Deportista dep){
    string SQL = "INSERT INTO Deportistas( Nombre, Apellido, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES ( @pNombre, @pApellido, @pFechaNacimiento, @pFoto, @pIdPais, @pIdDeporte)";
    using(SqlConnection db = new SqlConnection(_connectionString)){
        db.Execute(SQL, new{pNombre = dep.Nombre, pIdDeporte = dep.IdDeporte, pApellido =dep.Apellido, pFechaNacimiento = dep.FechaNacimiento, pFoto = dep.Foto, pIdPais = dep.IdPais});
    }
    }
    public static int EliminarDeportista(string DeportistaaEliminar){
    int RegistrosEliminados = 0;
    string sql ="DELETE FROM Deportistas WHERE IdDeportista = @IdDeportista";
    using(SqlConnection db = new SqlConnection(_connectionString)){
        RegistrosEliminados = db.Execute(sql,new{Deportista = DeportistaaEliminar});
    }
    return RegistrosEliminados;
    }
}