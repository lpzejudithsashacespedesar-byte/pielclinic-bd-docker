BEGIN;

-- Necesaria para la restricción de no solapamiento de citas (ver más abajo).
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE TABLE IF NOT EXISTS public.roles (
    id_rol bigserial NOT NULL,
    nombre_rol character varying(50) NOT NULL,
    descripcion character varying(255),
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT roles_pkey PRIMARY KEY (id_rol),
    CONSTRAINT roles_nombre_rol_unique UNIQUE (nombre_rol)
);

CREATE TABLE IF NOT EXISTS public.usuarios (
    id_usuario bigserial NOT NULL,
    id_rol bigint NOT NULL DEFAULT 1,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    telefono character varying(20),
    correo_verificado boolean NOT NULL DEFAULT false,
    estado_verificacion character varying(20) NOT NULL DEFAULT 'pendiente'::character varying,
    id_recepcionista_validador bigint,
    fecha_validacion timestamp(0) without time zone,
    motivo_rechazo text,
    acepto_consentimiento boolean NOT NULL DEFAULT false,
    fecha_consentimiento timestamp(0) without time zone,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario),
    CONSTRAINT usuarios_correo_unique UNIQUE (correo)
);

CREATE TABLE IF NOT EXISTS public.pacientes (
    id_paciente bigserial NOT NULL,
    id_usuario bigint NOT NULL,
    ci character varying(30),
    fecha_nacimiento date,
    genero character varying(20),
    tipo_sangre character varying(5),
    alergias text,
    url_foto_carnet_frontal character varying(500),
    url_foto_carnet_reverso character varying(500),
    url_foto_selfie_rostro character varying(500),
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente),
    CONSTRAINT pacientes_id_usuario_unique UNIQUE (id_usuario),
    CONSTRAINT pacientes_ci_unique UNIQUE (ci)
);

CREATE TABLE IF NOT EXISTS public.dermatologos (
    id_dermatologo bigserial NOT NULL,
    id_usuario bigint NOT NULL,
    matricula_profesional character varying(50) NOT NULL,
    especialidad character varying(150),
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT dermatologos_pkey PRIMARY KEY (id_dermatologo),
    CONSTRAINT dermatologos_id_usuario_unique UNIQUE (id_usuario),
    CONSTRAINT dermatologos_matricula_profesional_unique UNIQUE (matricula_profesional)
);

CREATE TABLE IF NOT EXISTS public.estados_cita (
    id_estado_cita bigserial NOT NULL,
    nombre_estado character varying(50) NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT estados_cita_pkey PRIMARY KEY (id_estado_cita),
    CONSTRAINT estados_cita_nombre_estado_unique UNIQUE (nombre_estado)
);

CREATE TABLE IF NOT EXISTS public.citas (
    id_cita bigserial NOT NULL,
    id_paciente bigint NOT NULL,
    id_dermatologo bigint,
    id_estado_cita bigint NOT NULL,
    id_servicio bigint,
    fecha_cita timestamp(0) without time zone NOT NULL,
    -- Copia de servicios.duracion_minutos al agendar: si el servicio cambia, la cita conserva su bloque.
    duracion_minutos integer NOT NULL,
    fecha_fin timestamp without time zone GENERATED ALWAYS AS (fecha_cita + make_interval(mins => duracion_minutos)) STORED,
    motivo_consulta text NOT NULL,
    notas_recepcion text,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT citas_pkey PRIMARY KEY (id_cita),
    CONSTRAINT citas_duracion_positiva CHECK (duracion_minutos > 0)
);

CREATE TABLE IF NOT EXISTS public.agenda_bloqueada (
    id_bloqueo bigserial NOT NULL,
    id_dermatologo bigint NOT NULL,
    fecha_inicio timestamp(0) without time zone NOT NULL,
    fecha_fin timestamp(0) without time zone NOT NULL,
    motivo_bloqueo character varying(255),
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT agenda_bloqueada_pkey PRIMARY KEY (id_bloqueo)
);

CREATE TABLE IF NOT EXISTS public.horarios_clinica_bloqueados (
    id_bloqueo bigserial NOT NULL,
    fecha date NOT NULL,
    hora_inicio time(0) without time zone NOT NULL,
    hora_fin time(0) without time zone NOT NULL,
    motivo character varying(150),
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT horarios_clinica_bloqueados_pkey PRIMARY KEY (id_bloqueo)
);

CREATE TABLE IF NOT EXISTS public.historial_clinico (
    id_historial bigserial NOT NULL,
    id_cita bigint NOT NULL,
    tipo_registro character varying(50) NOT NULL DEFAULT 'consulta'::character varying,
    diagnostico text NOT NULL,
    tratamiento text NOT NULL,
    indicaciones_medicas text,
    fecha_registro timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_proximo_control date,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT historial_clinico_pkey PRIMARY KEY (id_historial)
);

CREATE TABLE IF NOT EXISTS public.recetas (
    id_receta bigserial NOT NULL,
    id_historial bigint NOT NULL,
    fecha_emision timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    notas_adicionales text,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT recetas_pkey PRIMARY KEY (id_receta)
);

CREATE TABLE IF NOT EXISTS public.tratamientos_medicamentos (
    id_tratamiento bigserial NOT NULL,
    id_receta bigint NOT NULL,
    nombre_medicamento character varying(150) NOT NULL,
    tipo_medicamento character varying(50) NOT NULL,
    dosis character varying(100),
    frecuencia_horas integer,
    duracion_dias integer,
    fecha_inicio date NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT tratamientos_medicamentos_pkey PRIMARY KEY (id_tratamiento)
);

CREATE TABLE IF NOT EXISTS public.recordatorios_alarmas (
    id_recordatorio bigserial NOT NULL,
    id_paciente bigint NOT NULL,
    id_tratamiento bigint,
    titulo_recordatorio character varying(150) NOT NULL,
    hora_alarma time(0) without time zone NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT recordatorios_alarmas_pkey PRIMARY KEY (id_recordatorio)
);

CREATE TABLE IF NOT EXISTS public.imagenes_dermatologicas (
    id_imagen bigserial NOT NULL,
    id_paciente bigint NOT NULL,
    id_cita bigint,
    id_zona bigint,
    url_imagen character varying(500) NOT NULL,
    secuencia_orden integer NOT NULL DEFAULT 0,
    prediccion_ia character varying(100),
    confianza_ia numeric(5, 4),
    -- Migración 006: análisis asíncrono de IA (reporte completo + estado)
    estado_analisis character varying(20) NOT NULL DEFAULT 'pendiente',
    reporte_ia text,
    error_analisis character varying(255),
    fecha_analisis timestamp(0) without time zone,
    fecha_subida timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT imagenes_dermatologicas_pkey PRIMARY KEY (id_imagen),
    CONSTRAINT imagenes_estado_analisis_valido CHECK (estado_analisis IN ('pendiente', 'completado', 'fallido')),
    CONSTRAINT imagenes_confianza_entre_0_y_1 CHECK (confianza_ia IS NULL OR (confianza_ia >= 0 AND confianza_ia <= 1))
);
CREATE INDEX IF NOT EXISTS imagenes_paciente_fecha_idx
    ON public.imagenes_dermatologicas (id_paciente, fecha_subida) WHERE fecha_eliminacion IS NULL;

CREATE TABLE IF NOT EXISTS public.metodos_pago (
    id_metodo_pago bigserial NOT NULL,
    nombre_metodo character varying(50) NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT metodos_pago_pkey PRIMARY KEY (id_metodo_pago),
    CONSTRAINT metodos_pago_nombre_metodo_unique UNIQUE (nombre_metodo)
);

CREATE TABLE IF NOT EXISTS public.estados_pago (
    id_estado_pago bigserial NOT NULL,
    nombre_estado character varying(50) NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT estados_pago_pkey PRIMARY KEY (id_estado_pago),
    CONSTRAINT estados_pago_nombre_estado_unique UNIQUE (nombre_estado)
);

CREATE TABLE IF NOT EXISTS public.comprobantes_pago (
    id_comprobante bigserial NOT NULL,
    id_pago bigint NOT NULL,
    url_comprobante character varying(500) NOT NULL,
    fecha_subida timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT comprobantes_pago_pkey PRIMARY KEY (id_comprobante)
);

CREATE TABLE IF NOT EXISTS public.facturas (
    id_factura bigserial NOT NULL,
    id_pago bigint NOT NULL,
    numero_factura character varying(50) NOT NULL,
    nit_ci_cliente character varying(30) NOT NULL,
    nombre_cliente character varying(150) NOT NULL,
    razon_social character varying(200),
    monto numeric(10, 2) NOT NULL,
    fecha_emision timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(30) NOT NULL DEFAULT 'EMITIDA'::character varying,
    -- Migración 007: facturación administrativa interna (simulación académica)
    nro_correlativo bigint NOT NULL,
    cuf_simulado character varying(64) NOT NULL,
    emisor_razon_social character varying(200) NOT NULL,
    emisor_nit character varying(20) NOT NULL,
    emisor_direccion character varying(300) NOT NULL,
    leyenda character varying(200) NOT NULL,
    fecha_anulacion timestamp(0) without time zone,
    anulado_por bigint,
    motivo_anulacion text,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT facturas_pkey PRIMARY KEY (id_factura),
    CONSTRAINT facturas_numero_factura_unique UNIQUE (numero_factura),
    CONSTRAINT facturas_nro_correlativo_unique UNIQUE (nro_correlativo),
    CONSTRAINT facturas_cuf_simulado_unique UNIQUE (cuf_simulado),
    CONSTRAINT facturas_id_pago_unique UNIQUE (id_pago),
    CONSTRAINT facturas_estado_valido CHECK (estado IN ('EMITIDA', 'ANULADA')),
    CONSTRAINT facturas_monto_positivo CHECK (monto > 0),
    CONSTRAINT facturas_anulacion_coherente CHECK (
        (estado = 'EMITIDA' AND fecha_anulacion IS NULL AND anulado_por IS NULL AND motivo_anulacion IS NULL)
        OR (estado = 'ANULADA' AND fecha_anulacion IS NOT NULL AND anulado_por IS NOT NULL AND motivo_anulacion IS NOT NULL)
    )
);

CREATE TABLE IF NOT EXISTS public.servicios (
    id_servicio bigserial NOT NULL,
    nombre_servicio character varying(150) NOT NULL,
    descripcion text,
    precio numeric(10, 2) NOT NULL,
    duracion_minutos integer NOT NULL DEFAULT 30,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT servicios_pkey PRIMARY KEY (id_servicio),
    CONSTRAINT servicios_nombre_servicio_unique UNIQUE (nombre_servicio)
);

CREATE TABLE IF NOT EXISTS public.zonas_cuerpo (
    id_zona bigserial NOT NULL,
    nombre_zona character varying(100) NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT zonas_cuerpo_pkey PRIMARY KEY (id_zona),
    CONSTRAINT zonas_cuerpo_nombre_zona_unique UNIQUE (nombre_zona)
);

CREATE TABLE IF NOT EXISTS public.pagos (
    id_pago bigserial NOT NULL,
    id_cita bigint NOT NULL,
    id_metodo_pago bigint NOT NULL,
    id_estado_pago bigint NOT NULL,
    monto numeric(10, 2) NOT NULL,
    referencia character varying(100),
    fecha_pago timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    -- Migración 007: cada cobro pertenece a una caja y puede anularse (con motivo) sin borrarse
    id_caja bigint NOT NULL,
    fecha_anulacion timestamp(0) without time zone,
    anulado_por bigint,
    motivo_anulacion text,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT pagos_pkey PRIMARY KEY (id_pago),
    CONSTRAINT pagos_monto_positivo CHECK (monto > 0),
    CONSTRAINT pagos_anulacion_coherente CHECK (
        (fecha_anulacion IS NULL AND anulado_por IS NULL AND motivo_anulacion IS NULL)
        OR (fecha_anulacion IS NOT NULL AND anulado_por IS NOT NULL AND motivo_anulacion IS NOT NULL)
    )
);

-- Migración 007: cajas (un turno de cobro) y contador de facturas
CREATE TABLE IF NOT EXISTS public.cajas (
    id_caja bigserial NOT NULL,
    id_usuario bigint NOT NULL,
    estado character varying(10) NOT NULL DEFAULT 'ABIERTA',
    monto_apertura numeric(10, 2) NOT NULL,
    fecha_apertura timestamp(0) without time zone NOT NULL,
    fecha_cierre timestamp(0) without time zone,
    cerrada_por bigint,
    conteo_efectivo numeric(10, 2),
    conteo_qr numeric(10, 2),
    conteo_transferencia numeric(10, 2),
    monto_cierre numeric(10, 2),
    sistema_efectivo numeric(10, 2),
    sistema_qr numeric(10, 2),
    sistema_transferencia numeric(10, 2),
    -- Conteo menos lo esperado. Negativo = faltante, positivo = excedente.
    faltante_efectivo numeric(10, 2),
    faltante_qr numeric(10, 2),
    faltante_transferencia numeric(10, 2),
    observacion_cierre text,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT cajas_pkey PRIMARY KEY (id_caja),
    CONSTRAINT cajas_estado_valido CHECK (estado IN ('ABIERTA', 'CERRADA')),
    CONSTRAINT cajas_montos_no_negativos CHECK (
        monto_apertura >= 0 AND conteo_efectivo >= 0 AND conteo_qr >= 0 AND conteo_transferencia >= 0 AND monto_cierre >= 0
    ),
    CONSTRAINT cajas_cierre_coherente CHECK (
        (estado = 'ABIERTA' AND fecha_cierre IS NULL AND monto_cierre IS NULL)
        OR (estado = 'CERRADA' AND fecha_cierre IS NOT NULL AND cerrada_por IS NOT NULL AND conteo_efectivo IS NOT NULL
            AND conteo_qr IS NOT NULL AND conteo_transferencia IS NOT NULL AND monto_cierre IS NOT NULL
            AND sistema_efectivo IS NOT NULL AND sistema_qr IS NOT NULL AND sistema_transferencia IS NOT NULL
            AND faltante_efectivo IS NOT NULL AND faltante_qr IS NOT NULL AND faltante_transferencia IS NOT NULL)
    )
);
CREATE UNIQUE INDEX IF NOT EXISTS cajas_una_abierta_por_usuario
    ON public.cajas (id_usuario) WHERE estado = 'ABIERTA' AND fecha_eliminacion IS NULL;
CREATE INDEX IF NOT EXISTS cajas_usuario_apertura_idx ON public.cajas (id_usuario, fecha_apertura DESC);
CREATE UNIQUE INDEX IF NOT EXISTS pagos_un_cobro_vigente_por_cita
    ON public.pagos (id_cita) WHERE fecha_anulacion IS NULL AND fecha_eliminacion IS NULL;
CREATE INDEX IF NOT EXISTS pagos_caja_idx ON public.pagos (id_caja);
CREATE INDEX IF NOT EXISTS pagos_fecha_idx ON public.pagos (fecha_pago);

CREATE TABLE IF NOT EXISTS public.contadores_factura (
    clave character varying(30) NOT NULL,
    ultimo_numero bigint NOT NULL DEFAULT 0,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT contadores_factura_pkey PRIMARY KEY (clave),
    CONSTRAINT contadores_factura_no_negativo CHECK (ultimo_numero >= 0)
);
INSERT INTO public.contadores_factura (clave, ultimo_numero) VALUES ('FACTURA', 0) ON CONFLICT (clave) DO NOTHING;

-- Tablas técnicas de infraestructura
CREATE TABLE IF NOT EXISTS public.auditoria (id_auditoria bigserial NOT NULL, id_usuario bigint, accion character varying(100) NOT NULL, tabla_afectada character varying(100), fecha_evento timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP, ip_usuario character varying(45), detalle text, id_registro_afectado bigint, CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria));
CREATE TABLE IF NOT EXISTS public.cache (key character varying(255) NOT NULL, value text NOT NULL, expiration bigint NOT NULL, CONSTRAINT cache_pkey PRIMARY KEY (key));
CREATE TABLE IF NOT EXISTS public.cache_locks (key character varying(255) NOT NULL, owner character varying(255) NOT NULL, expiration bigint NOT NULL, CONSTRAINT cache_locks_pkey PRIMARY KEY (key));
CREATE TABLE IF NOT EXISTS public.failed_jobs (id bigserial NOT NULL, uuid character varying(255) NOT NULL, connection character varying(255) NOT NULL, queue character varying(255) NOT NULL, payload text NOT NULL, exception text NOT NULL, failed_at timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP, CONSTRAINT failed_jobs_pkey PRIMARY KEY (id), CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid));
CREATE TABLE IF NOT EXISTS public.jobs (id bigserial NOT NULL, queue character varying(255) NOT NULL, payload text NOT NULL, attempts smallint NOT NULL, reserved_at integer, available_at integer NOT NULL, created_at integer NOT NULL, CONSTRAINT jobs_pkey PRIMARY KEY (id));
CREATE TABLE IF NOT EXISTS public.job_batches (id character varying(255) NOT NULL, name character varying(255) NOT NULL, total_jobs integer NOT NULL, pending_jobs integer NOT NULL, failed_jobs integer NOT NULL, failed_job_ids text NOT NULL, options text, cancelled_at integer, created_at integer NOT NULL, finished_at integer, CONSTRAINT job_batches_pkey PRIMARY KEY (id));
CREATE TABLE IF NOT EXISTS public.migrations (id serial NOT NULL, migration character varying(255) NOT NULL, batch integer NOT NULL, CONSTRAINT migrations_pkey PRIMARY KEY (id));

-- Llaves Foráneas Básicas
ALTER TABLE public.usuarios ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.roles (id_rol);
ALTER TABLE public.usuarios ADD CONSTRAINT fk_usuario_validador FOREIGN KEY (id_recepcionista_validador) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pacientes ADD CONSTRAINT fk_paciente_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios (id_usuario) ON DELETE CASCADE;
ALTER TABLE public.dermatologos ADD CONSTRAINT fk_dermatologo_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios (id_usuario) ON DELETE CASCADE;
ALTER TABLE public.citas ADD CONSTRAINT fk_cita_paciente FOREIGN KEY (id_paciente) REFERENCES public.pacientes (id_paciente) ON DELETE CASCADE;
ALTER TABLE public.citas ADD CONSTRAINT fk_cita_dermatologo FOREIGN KEY (id_dermatologo) REFERENCES public.dermatologos (id_dermatologo) ON DELETE SET NULL;
ALTER TABLE public.citas ADD CONSTRAINT fk_cita_estado FOREIGN KEY (id_estado_cita) REFERENCES public.estados_cita (id_estado_cita);
ALTER TABLE public.agenda_bloqueada ADD CONSTRAINT fk_agenda_bloqueada_medico FOREIGN KEY (id_dermatologo) REFERENCES public.dermatologos (id_dermatologo) ON DELETE CASCADE;
ALTER TABLE public.historial_clinico ADD CONSTRAINT fk_historial_cita FOREIGN KEY (id_cita) REFERENCES public.citas (id_cita) ON DELETE CASCADE;
ALTER TABLE public.recetas ADD CONSTRAINT fk_receta_historial FOREIGN KEY (id_historial) REFERENCES public.historial_clinico (id_historial) ON DELETE CASCADE;
ALTER TABLE public.tratamientos_medicamentos ADD CONSTRAINT fk_tratamiento_receta FOREIGN KEY (id_receta) REFERENCES public.recetas (id_receta) ON DELETE CASCADE;
ALTER TABLE public.recordatorios_alarmas ADD CONSTRAINT fk_alarma_paciente FOREIGN KEY (id_paciente) REFERENCES public.pacientes (id_paciente) ON DELETE CASCADE;
ALTER TABLE public.recordatorios_alarmas ADD CONSTRAINT fk_alarma_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES public.tratamientos_medicamentos (id_tratamiento) ON DELETE SET NULL;
ALTER TABLE public.imagenes_dermatologicas ADD CONSTRAINT fk_imagen_paciente FOREIGN KEY (id_paciente) REFERENCES public.pacientes (id_paciente) ON DELETE CASCADE;
ALTER TABLE public.imagenes_dermatologicas ADD CONSTRAINT fk_imagen_cita FOREIGN KEY (id_cita) REFERENCES public.citas (id_cita) ON DELETE SET NULL;
ALTER TABLE public.citas ADD CONSTRAINT fk_cita_servicio FOREIGN KEY (id_servicio) REFERENCES public.servicios (id_servicio) ON DELETE SET NULL;
ALTER TABLE public.imagenes_dermatologicas ADD CONSTRAINT fk_imagen_zona FOREIGN KEY (id_zona) REFERENCES public.zonas_cuerpo (id_zona) ON DELETE SET NULL;
ALTER TABLE public.pagos ADD CONSTRAINT fk_pago_cita FOREIGN KEY (id_cita) REFERENCES public.citas (id_cita);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pago_metodo FOREIGN KEY (id_metodo_pago) REFERENCES public.metodos_pago (id_metodo_pago);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pago_estado FOREIGN KEY (id_estado_pago) REFERENCES public.estados_pago (id_estado_pago);
ALTER TABLE public.comprobantes_pago ADD CONSTRAINT fk_comprobante_pago FOREIGN KEY (id_pago) REFERENCES public.pagos (id_pago) ON DELETE CASCADE;
ALTER TABLE public.facturas ADD CONSTRAINT fk_factura_pago FOREIGN KEY (id_pago) REFERENCES public.pagos (id_pago);

-- Relaciones de Auditoría hacia usuarios
ALTER TABLE public.roles ADD CONSTRAINT fk_r_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.roles ADD CONSTRAINT fk_r_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.usuarios ADD CONSTRAINT fk_u_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.usuarios ADD CONSTRAINT fk_u_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pacientes ADD CONSTRAINT fk_p_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pacientes ADD CONSTRAINT fk_p_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.dermatologos ADD CONSTRAINT fk_d_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.dermatologos ADD CONSTRAINT fk_d_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.estados_cita ADD CONSTRAINT fk_ec_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.estados_cita ADD CONSTRAINT fk_ec_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.citas ADD CONSTRAINT fk_c_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.citas ADD CONSTRAINT fk_c_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.agenda_bloqueada ADD CONSTRAINT fk_ab_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.agenda_bloqueada ADD CONSTRAINT fk_ab_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.horarios_clinica_bloqueados ADD CONSTRAINT fk_hcb_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.horarios_clinica_bloqueados ADD CONSTRAINT fk_hcb_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.historial_clinico ADD CONSTRAINT fk_h_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.historial_clinico ADD CONSTRAINT fk_h_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.recetas ADD CONSTRAINT fk_re_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.recetas ADD CONSTRAINT fk_re_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.tratamientos_medicamentos ADD CONSTRAINT fk_tm_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.tratamientos_medicamentos ADD CONSTRAINT fk_tm_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.recordatorios_alarmas ADD CONSTRAINT fk_ra_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.recordatorios_alarmas ADD CONSTRAINT fk_ra_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.imagenes_dermatologicas ADD CONSTRAINT fk_id_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.imagenes_dermatologicas ADD CONSTRAINT fk_id_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.metodos_pago ADD CONSTRAINT fk_mp_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.metodos_pago ADD CONSTRAINT fk_mp_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.estados_pago ADD CONSTRAINT fk_ep_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.estados_pago ADD CONSTRAINT fk_ep_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.comprobantes_pago ADD CONSTRAINT fk_cp_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.comprobantes_pago ADD CONSTRAINT fk_cp_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.facturas ADD CONSTRAINT fk_f_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.facturas ADD CONSTRAINT fk_f_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.servicios ADD CONSTRAINT fk_s_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.servicios ADD CONSTRAINT fk_s_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.zonas_cuerpo ADD CONSTRAINT fk_zc_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.zonas_cuerpo ADD CONSTRAINT fk_zc_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pg_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pg_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
-- auditoria.id_registro_afectado + tabla_afectada identifican cualquier registro (usuarios, citas...): sin FK a usuarios.

-- Reglas de la agenda que deben cumplirse aunque dos personas reserven a la vez (migración 005).
-- Dependen de los ids fijos de estados_cita: 1 = pendiente, 3 = cancelada (db/seeds/001 y 002).
ALTER TABLE public.citas
    ADD CONSTRAINT citas_sin_solape_por_dermatologo
    EXCLUDE USING gist (id_dermatologo WITH =, tsrange(fecha_cita, fecha_fin, '[)') WITH &&)
    WHERE (id_dermatologo IS NOT NULL AND id_estado_cita <> 3 AND fecha_eliminacion IS NULL);

CREATE UNIQUE INDEX citas_una_pendiente_por_paciente
    ON public.citas (id_paciente)
    WHERE id_estado_cita = 1 AND fecha_eliminacion IS NULL;

CREATE INDEX citas_paciente_idx ON public.citas (id_paciente, id_cita DESC);
CREATE INDEX citas_dermatologo_inicio_idx ON public.citas (id_dermatologo, fecha_cita);

COMMIT;

-- Migración 007: claves foráneas del módulo de dinero
ALTER TABLE public.cajas ADD CONSTRAINT fk_caja_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.cajas ADD CONSTRAINT fk_caja_cerrada_por FOREIGN KEY (cerrada_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.cajas ADD CONSTRAINT fk_caja_creado FOREIGN KEY (creado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.cajas ADD CONSTRAINT fk_caja_modif FOREIGN KEY (modificado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pago_caja FOREIGN KEY (id_caja) REFERENCES public.cajas (id_caja);
ALTER TABLE public.pagos ADD CONSTRAINT fk_pago_anulado_por FOREIGN KEY (anulado_por) REFERENCES public.usuarios (id_usuario);
ALTER TABLE public.facturas ADD CONSTRAINT fk_factura_anulado_por FOREIGN KEY (anulado_por) REFERENCES public.usuarios (id_usuario);

-- Migración 008: insumos (inventario)
CREATE TABLE IF NOT EXISTS public.insumos (
    id_insumo bigserial NOT NULL,
    nombre character varying(120) NOT NULL,
    categoria character varying(60) NOT NULL,
    unidad character varying(30) NOT NULL,
    stock_minimo integer NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT insumos_pkey PRIMARY KEY (id_insumo),
    CONSTRAINT insumos_stock_minimo_no_negativo CHECK (stock_minimo >= 0)
);
CREATE UNIQUE INDEX IF NOT EXISTS insumos_nombre_unico
    ON public.insumos (lower(nombre)) WHERE fecha_eliminacion IS NULL;

CREATE TABLE IF NOT EXISTS public.lotes_insumo (
    id_lote bigserial NOT NULL,
    id_insumo bigint NOT NULL,
    nro_lote character varying(60) NOT NULL,
    fecha_vencimiento date,
    cantidad_inicial integer NOT NULL,
    cantidad_actual integer NOT NULL,
    proveedor character varying(120),
    fecha_ingreso timestamp(0) without time zone NOT NULL,
    creado_por bigint, modificado_por bigint,
    fecha_creacion timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion timestamp(0) without time zone,
    fecha_eliminacion timestamp(0) without time zone,
    CONSTRAINT lotes_insumo_pkey PRIMARY KEY (id_lote),
    CONSTRAINT lotes_insumo_cantidades CHECK (cantidad_inicial > 0 AND cantidad_actual >= 0 AND cantidad_actual <= cantidad_inicial)
);
CREATE UNIQUE INDEX IF NOT EXISTS lotes_insumo_nro_unico
    ON public.lotes_insumo (id_insumo, nro_lote) WHERE fecha_eliminacion IS NULL;
CREATE INDEX IF NOT EXISTS lotes_insumo_vencimiento_idx ON public.lotes_insumo (fecha_vencimiento) WHERE cantidad_actual > 0;

CREATE TABLE IF NOT EXISTS public.movimientos_insumo (
    id_movimiento bigserial NOT NULL,
    id_insumo bigint NOT NULL,
    id_lote bigint NOT NULL,
    tipo character varying(7) NOT NULL,
    motivo character varying(20) NOT NULL,
    cantidad integer NOT NULL,
    id_cita bigint,
    observacion character varying(300),
    id_usuario bigint,
    fecha_movimiento timestamp(0) without time zone NOT NULL,
    CONSTRAINT movimientos_insumo_pkey PRIMARY KEY (id_movimiento),
    CONSTRAINT movimientos_insumo_cantidad CHECK (cantidad > 0),
    CONSTRAINT movimientos_insumo_tipo_motivo CHECK (
        (tipo = 'ENTRADA' AND motivo IN ('compra', 'ajuste_entrada'))
        OR (tipo = 'SALIDA' AND motivo IN ('uso_consulta', 'merma', 'vencido', 'ajuste_salida'))
    )
);
CREATE INDEX IF NOT EXISTS movimientos_insumo_insumo_idx ON public.movimientos_insumo (id_insumo, id_movimiento DESC);
CREATE INDEX IF NOT EXISTS movimientos_insumo_fecha_idx ON public.movimientos_insumo (fecha_movimiento DESC);

-- Llaves foráneas (sin duplicarse al re-ejecutar). Usuario y cita: ON DELETE SET NULL para no frenar la limpieza de esas tablas.
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_lote_insumo') THEN
        ALTER TABLE public.lotes_insumo ADD CONSTRAINT fk_lote_insumo FOREIGN KEY (id_insumo) REFERENCES public.insumos (id_insumo);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_movimiento_insumo') THEN
        ALTER TABLE public.movimientos_insumo ADD CONSTRAINT fk_movimiento_insumo FOREIGN KEY (id_insumo) REFERENCES public.insumos (id_insumo);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_movimiento_lote') THEN
        ALTER TABLE public.movimientos_insumo ADD CONSTRAINT fk_movimiento_lote FOREIGN KEY (id_lote) REFERENCES public.lotes_insumo (id_lote);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_movimiento_cita') THEN
        ALTER TABLE public.movimientos_insumo ADD CONSTRAINT fk_movimiento_cita FOREIGN KEY (id_cita) REFERENCES public.citas (id_cita) ON DELETE SET NULL;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_movimiento_usuario') THEN
        ALTER TABLE public.movimientos_insumo ADD CONSTRAINT fk_movimiento_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios (id_usuario) ON DELETE SET NULL;
    END IF;
END $$;

