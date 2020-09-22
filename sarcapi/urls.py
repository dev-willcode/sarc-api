from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from app.inventario.views import *
from django.conf import settings
from django.conf.urls.static import static

router = routers.DefaultRouter()
router.register(r'servicio', ServicioViewSet)
router.register(r'marca', MarcaViewSet)
router.register(r'auto', AutoViewSet)
router.register('equipamiento', EquipamientoViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)