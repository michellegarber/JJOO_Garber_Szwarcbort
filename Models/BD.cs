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
    public static int EliminarDeportista(int idDeportistaaEliminar){
    int RegistrosEliminados = 0;
    string sql ="DELETE FROM Deportistas WHERE IdDeportista = @IdDeportista";
    using(SqlConnection db = new SqlConnection(_connectionString)){
        RegistrosEliminados = db.Execute(sql,new{idDeportista = idDeportistaaEliminar});
    }
    return RegistrosEliminados;
    }
    public static Deporte VerInfoDeporte(int idDeporte){
        Deporte MiDeporte = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes WHERE IdDeporte = @pidDeporte";
            MiDeporte =db.QueryFirstOrDefault<Deporte>(sql,new{pidDeporte = idDeporte});
        }
        return MiDeporte;
    }
    public static Pais VerInfoPais(int idPais){
        Pais MiPais = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Pais WHERE IdPais = @pidPais";
            MiPais = db.QueryFirstOrDefault<Pais>(sql,new{pidPais = idPais});
        }
        return MiPais;
    }
    public static Deportista VerInfoDeportista(int idDeportista){
        Deportista MiDeportista = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportista WHERE IdDeportista = @pidDeportista";
            MiDeportista = db.QueryFirstOrDefault<Deportista>(sql,new{pidDeportista = idDeportista});
        }
        return MiDeportista;
    }
    public static List<Pais> ListarPaises(){
        List<Pais> ListadoPais = new List<Pais> {};
        using(SqlConnection db = new SqlConnection(_connectionString)){
          string sql = "SELECT * FROM Pais";
          ListadoPais = db.Query<Pais>(sql).ToList();
        }
        return ListadoPais;
    }
        public static List<Deporte> ListarDeportes(){
        List<Deporte> _ListadoDeportes = new List<Deporte> {};
        using(SqlConnection db = new SqlConnection(_connectionString)){
          string sql = "SELECT * FROM Deporte";
          _ListadoDeportes = db.Query<Deporte>(sql).ToList();
        }
        return _ListadoDeportes;
    }
    public static List<Deportista> ListarDeportistaPorPais(int idPais){
        List<Deportista> _ListadoDeportistaPais = new List<Deportista> {};
        using(SqlConnection db = new SqlConnection(_connectionString)){
          string sql = "SELECT * FROM Deporte WHERE IdPais = @pidPais";
          _ListadoDeportistaPais = db.Query<Deportista>(sql,new{pidPais = idPais}).ToList();
        }
        return _ListadoDeportistaPais;
    }
    public static List<Deportista> ListarDeportistasPorDeporte(int idDeporte){
        List<Deportista> _ListadoDeportista = new List<Deportista> {};
        using(SqlConnection db = new SqlConnection(_connectionString)){
          string sql = "SELECT * FROM Deportista WHERE IdDeporte = @pidDeporte";
          _ListadoDeportista = db.Query<Deportista>(sql,new{pidDeporte = idDeporte}).ToList();
        }
        return _ListadoDeportista;
    } 
}