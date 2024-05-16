import axios from "axios";
import { onMounted, ref } from "vue";
import { usePage } from "@inertiajs/vue3";

const oProducto = ref({
    id: 0,
    nombre: "",
    descripcion: "",
    categoria_id: "",
    tipo_producto_id: "",
    stock_minimo: "",
    imagen: "",
    _method: "POST",
});

export const useProductos = () => {
    const { flash } = usePage().props;
    const getProductos = async () => {
        try {
            const response = await axios.get(route("productos.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.productos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const getProductosApi = async (data) => {
        try {
            const response = await axios.get(
                route("productos.paginado", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            return response.data.productos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };
    const saveProducto = async (data) => {
        try {
            const response = await axios.post(route("productos.store", data), {
                headers: { Accept: "application/json" },
            });
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            console.error("Error:", err);
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteProducto = async (id) => {
        try {
            const response = await axios.delete(
                route("productos.destroy", id),
                {
                    headers: { Accept: "application/json" },
                }
            );
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setProducto = (item = null) => {
        if (item) {
            oProducto.value.id = item.id;
            oProducto.value.nombre = item.nombre;
            oProducto.value.descripcion = item.descripcion;
            oProducto.value.categoria_id = item.categoria_id;
            oProducto.value.tipo_producto_id = item.tipo_producto_id;
            oProducto.value.stock_minimo = item.stock_minimo;
            oProducto.value.imagen = item.imagen;
            oProducto.value._method = "PUT";
            return oProducto;
        }
        return false;
    };

    const limpiarProducto = () => {
        oProducto.value.id = 0;
        oProducto.value.nombre = "";
        oProducto.value.descripcion = "";
        oProducto.value.categoria_id = null;
        oProducto.value.tipo_producto_id = null;
        oProducto.value.stock_minimo = "";
        oProducto.value.imagen = "";
        oProducto.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oProducto,
        getProductos,
        getProductosApi,
        saveProducto,
        deleteProducto,
        setProducto,
        limpiarProducto,
    };
};
