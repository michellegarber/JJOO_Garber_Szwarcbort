using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using JJOO.Models;

namespace JJOO.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Deportes()
    {
        ViewBag.Listado = BD.ListarDeportes();
        return View();
    }
    public IActionResult Paises()
    {
        ViewBag.ListarPaises = BD.ListarPaises();
        return View();
    }
    public IActionResult VerDetalleDeporte(int idDeporte){
        ViewBag.DatosDeporte = BD.VerInfoDeporte(idDeporte);
        ViewBag.Deportes = BD.ListarDeportistasPorDeporte(idDeporte);
        return View("DetalleDeporte");
    }
    public IActionResult VerDetallePais(int idPais){
        ViewBag.DatosPais = BD.VerInfoPais(idPais);
        ViewBag.Paises = BD.ListarDeportistaPorPais(idPais);
        return View("DetallePais");
    }
    public IActionResult VerDetalleDeportista(int idDeporte){
        ViewBag.DatosDeportista = BD.VerInfoDeportista(idDeporte);
        return View("DetalleDeportista");
    }
    public IActionResult Creditos()
    {
        return View();
    }
    public IActionResult AgregarDeportista(Deportista nuevoDeportista){
        ViewBag.ListarPaises = BD.ListarPaises();
        ViewBag.ListadoDeportes = BD.ListarDeportes();
        return View();
    }
    public IActionResult EliminarDeportista(int idCandidato)
    {
        BD.EliminarDeportista(idCandidato);
        return View("Index");
    }
    [HttpPost] public IActionResult GuardarDeportista(Deportista dep){
        BD.AgregarDeportista(dep); 
        return View("Index");
    }
}
