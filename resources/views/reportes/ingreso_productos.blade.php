<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ingreso Productos</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.3cm;
            margin-right: 0.3cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 7pt;
        }

        table tbody tr td {
            font-size: 6pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 100px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #1867C0;
            color: white;
        }

        .bold {
            font-weight: bold;
        }

        .derecha {
            text-align: right;
        }

        .text-md {
            font-size: 9pt;
        }

        .img_celda img {
            width: 45px;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ $configuracion->first()->url_logo }}">
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->razon_social }}
        </h2>
        <h4 class="texto">INGRESO DE PRODUCTOS</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>
    <table border="1">
        <thead class="bg-principal">
            <tr>
                <th width="3%">N°</th>
                <th>PROVEEDOR</th>
                <th>TIPO DE INGRESO</th>
                <th>NRO. FACTURA</th>
                <th>DESCRIPCIÓN</th>
                <th>PRODUCTO - CANTIDAD - P/U</th>
                <th width="5%">FECHA DE INGRESO</th>
                <th width="5%">FECHA DE REGISTRO</th>
                <th width="8%">TOTAL</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
                $total = 0;
            @endphp
            @foreach ($ingreso_productos as $ingreso)
                <tr>
                    <td class="centreado">{{ $cont++ }}</td>
                    <td class="">{{ $ingreso->proveedor->razon_social }}</td>
                    <td class="">{{ $ingreso->tipo_ingreso->nombre }}</td>
                    <td class="">{{ $ingreso->nro_factura }}</td>
                    <td class="">{{ $ingreso->descripcion }}</td>
                    <td class="">
                        <ul style="padding-left: 10px">
                            @foreach ($ingreso->ingreso_detalles as $id)
                                <li>{{ $id->producto->nombre }} - {{ $id->cantidad }} - {{ $id->precio }}</li>
                            @endforeach
                        </ul>
                    </td>
                    <td class="">{{ $ingreso->fecha_ingreso_t }}</td>
                    <td class="centreado">{{ $ingreso->fecha_registro_t }}</td>
                    <td class="centreado">{{ $ingreso->precio }}</td>
                </tr>
                @php
                    $total += (float) $ingreso->precio;
                @endphp
            @endforeach
            <tr>
                <td class="text-md derecha bold" colspan="8">TOTAL</td>
                <td class="text-md bold centreado">{{ number_format($total, 2, '.', '') }}</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
