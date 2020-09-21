from django.contrib import admin
from django.urls import include, path
from rest_framework import routers
from app.inventario.views import *

router = routers.DefaultRouter()
router.register(r'servicio', ServicioViewSet)
router.register(r'marca', MarcaViewSet)
router.register(r'auto', AutoViewSet)
# router.register('equipamiento', EquipamientoSerializer, basename='equipamiento')

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]