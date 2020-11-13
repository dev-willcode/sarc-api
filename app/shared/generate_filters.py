import rest_framework_filters as filters
from rest_framework.response import Response


def crear_filtros(fields):
    field_filter = {}
    if fields is not None:
        for field in fields:
            field_filter[field] = filters.ALL_LOOKUPS
        return field_filter
    else:
        return ""
