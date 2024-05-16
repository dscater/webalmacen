import { useForm } from "@inertiajs/vue3";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { usePage } from "@inertiajs/vue3";

const oIngreso = reactive({
    id: 0,
    nombre: "",
    gerente_regional_id: "",
    encargado_ingreso_id: "",
    fecha_pent: "",
    fecha_peje: "",
    descripcion: "",
    lat: "",
    lng: "",
    categoria_id: null,
    fecha_registro: "",
    _method: "POST",
});

export const useIngresos = () => {
    const { flash } = usePage().props;
    const getIngresos = async (data) => {
        try {
            const response = await axios.get(route("ingresos.listado"), {
                headers: { Accept: "application/json" },
                params: data,
            });
            return response.data.ingresos;
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

    const getIngresosApi = async (data) => {
        try {
            const response = await axios.get(route("ingresos.paginado", data), {
                headers: { Accept: "application/json" },
            });
            return response.data.ingresos;
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
    const saveIngreso = async (data) => {
        try {
            const response = await axios.post(route("ingresos.store", data), {
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
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteIngreso = async (id) => {
        try {
            const response = await axios.delete(route("ingresos.destroy", id), {
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
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setIngreso = (item = null) => {
        if (item) {
            oIngreso.id = item.id;
            oIngreso.nombre = item.nombre;
            oIngreso.gerente_regional_id = item.gerente_regional_id;
            oIngreso.encargado_ingreso_id = item.encargado_ingreso_id;
            oIngreso.fecha_pent = item.fecha_pent;
            oIngreso.fecha_peje = item.fecha_peje;
            oIngreso.descripcion = item.descripcion;
            oIngreso.lat = item.lat;
            oIngreso.lng = item.lng;
            oIngreso.categoria_id = item.categoria_id;
            oIngreso.fecha_registro = item.fecha_registro;
            oIngreso._method = "PUT";
            return oIngreso;
        }
        return false;
    };

    const limpiarIngreso = () => {
        oIngreso.id = 0;
        oIngreso.nombre = "";
        oIngreso.gerente_regional_id = "";
        oIngreso.encargado_ingreso_id = "";
        oIngreso.fecha_pent = "";
        oIngreso.fecha_peje = "";
        oIngreso.descripcion = "";
        oIngreso.lat = "";
        oIngreso.lng = "";
        oIngreso.categoria_id = null;
        oIngreso.fecha_registro = "";
        oIngreso._method = "POST";
    };

    onMounted(() => {});

    return {
        oIngreso,
        getIngresos,
        getIngresosApi,
        saveIngreso,
        deleteIngreso,
        setIngreso,
        limpiarIngreso,
    };
};
