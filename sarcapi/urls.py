from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from app.inventario.views import *
from app.servicio_tecnico.views import *
from django.conf import settings
from django.conf.urls.static import static

router = routers.DefaultRouter()
# Login
router.register(r'login', loginViewSet, basename=r'login')
router.register(r'register', registerViewSet, basename=r'register')
router.register(r'actualizar_contrasena', actualizarContrasenaViewSet, basename=r'actualizar_contrasena')
router.register(r'reporte_factura', FacturaVentaReport, basename=r'reporte_factura')

# Inventario
router.register(r'usuario', UsuarioViewSet)
router.register(r'cliente', ClienteViewSet)
router.register(r'vendedor', VendedorViewSet)
router.register(r'servicio', ServicioViewSet)
router.register(r'marca', MarcaViewSet)
router.register(r'equipamiento', EquipamientoViewSet)
router.register(r'modelo_auto', ModeloAutoViewSet)
router.register(r'auto', AutoViewSet)
router.register(r'factura_venta', FacturaVentaViewSet)

# servicio tecnico
router.register(r'vehiculo', VehiculoViewSet)
router.register(r'mecanico', MecanicoViewSet)
router.register(r'citas', CitasViewSet)
router.register(r'repuestos', RepuestosViewSet)
router.register(r'revision_tecnica', RevisionTecnicaViewSet)
router.register(r'revision_tecnica_detalle', RevisionTecnicaDetalleViewSet)
router.register(r'factura_servicio', FacturaServicioViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('pdf_view/', ViewPDF.as_view(), name="pdf_view"),
    path('pdf_download/', DownloadPDF.as_view(), name="pdf_download"),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_URL)