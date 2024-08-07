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
        ViewBag._ListadoDeportes = BD._ListadoDeportes;
        return View();
    }
    public IActionResult Paises()
    {
        ViewBag._ListadoPaises = BD._ListadoPaises;
        return View();
    }
    public IActionResult VerDetalleDeporte(int idDeporte){
        ViewBag.DatosDeporte = BD.VerInfoDeporte;
        ViewBag.Deportes = BD.ListarDeportistas(idDeporte);
        return View("DetalleDeporte");
    }
    public IActionResult VerDetallePais(int idPais){
        ViewBag.DatosPais = BD.VerInfoPais;
        ViewBag.Paises = BD.ListarDeportistasPorPais(idPais);
        return View("DetallePais");
    }
    public IActionResult VerDetalleDeportista(int idDeporte){
        ViewBag.DatosDeportista = BD.VerInfoDeportista;
        return View("DetalleDeportista");
    }
    
}
