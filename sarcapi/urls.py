from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from app.inventario.views import *
from django.conf import settings
from django.conf.urls.static import static

router = routers.DefaultRouter()
# Inventario
router.register(r'usuario', UsuarioViewSet)
router.register(r'persona', PersonaViewSet)
router.register(r'cliente', ClienteViewSet)
router.register(r'vendedor', VendedorViewSet)
router.register(r'servicio', ServicioViewSet)
router.register(r'marca', MarcaViewSet)
router.register(r'equipamiento', EquipamientoViewSet)
router.register(r'modelo_auto', ModeloAutoViewSet)
router.register(r'auto', AutoViewSet)
router.register(r'factura_venta', FacturaVentaViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)