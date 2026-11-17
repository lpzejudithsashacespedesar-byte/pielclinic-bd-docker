--
-- PostgreSQL database dump
--

\restrict HzGPiIWEuw30S70apz2fSpXfPskVZLehLgFdgi9qaDOH7sJ0kclURiEqXiw3yeW

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.roles DISABLE TRIGGER ALL;

INSERT INTO public.roles (id_rol, nombre_rol, descripcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'paciente', 'Usuario paciente que accede desde la app móvil', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.roles (id_rol, nombre_rol, descripcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'recepcionista', 'Personal administrativo que valida el onboarding y pagos', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.roles (id_rol, nombre_rol, descripcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'medico', 'Dermatólogo que gestiona historias clínicas y recetas', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.roles (id_rol, nombre_rol, descripcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 'administrador', 'Control total de configuraciones globales', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);


ALTER TABLE public.roles ENABLE TRIGGER ALL;

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.usuarios DISABLE TRIGGER ALL;

INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 4, 'Sasha', 'Céspedes', 'admin.demo@gmail.com', '$argon2id$v=19$m=19456,t=2,p=1$PdHN4UfoMq22g2Juzjl1/A$srB3+RD6679LrAkdtccRMvx1czMoXMJGIof9lAvVJIA', NULL, true, 'aprobado', NULL, '2026-11-16 21:49:15', NULL, false, NULL, NULL, NULL, '2026-11-16 21:49:15', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 2, 'Marta', 'Flores', 'recepcion.demo@gmail.com', '$argon2id$v=19$m=19456,t=2,p=1$F65++cbRYMEfo12mWngdZw$lnDQ1XBhUqpPJ6DejcuPpTTGrMqRMbiyeprFY6I+lMM', NULL, true, 'aprobado', NULL, '2026-11-16 21:49:16', NULL, false, NULL, NULL, NULL, '2026-11-16 21:49:16', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 1, 'Lucía', 'Quispe Mamani', 'lucia.quispe@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$NGNLeIT0hdlHjqmGflZwmQ$0o5zrcSNmK6I8Csbi5qNOHY+XC816J0zvHHWCfD0C1I', '71234501', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 1, 'Carlos', 'Mendoza Rojas', 'carlos.mendoza@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$aj3cAolTNJn0fhm5itT1oA$pQStGFpEDrdmwL7XnPP1FZZCAUvUpLaqs/k0wx07FVk', '72345602', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 1, 'Valeria', 'Choque Condori', 'valeria.choque@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$q8d/Ch1f8X08x7p8VkUJbg$jNZGdZEbx2PWpeHwPK53Jwl9G6Xi8SUxi5riPRo1DCw', '73456703', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (7, 1, 'Diego', 'Flores Apaza', 'paciente.5456783@sin-correo.dermaclinic.local', '$argon2id$v=19$m=19456,t=2,p=1$uhWMSAFT+r5+/cQBkLqgdA$WHpL9cyM+jib7vZ0mS1U9JD5A10TfPoBETP7a0M9r6U', '74567804', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (8, 1, 'Andrea', 'Salazar Vega', 'andrea.salazar@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$lVPsCaa1lZDmIReGaqeM4g$oMNfEhuJOGbsTpBde32zvfhQRq+AI4DwMXjxFOevaQs', '75678905', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (9, 1, 'Jorge', 'Limachi Torrez', 'paciente.4678905@sin-correo.dermaclinic.local', '$argon2id$v=19$m=19456,t=2,p=1$CMxp6pDOSKNizxLPNj91tw$IW7pIegsoWqjnxQ7oyGo4er59uTd1h/BiNOqhOqgtK8', '76789006', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (10, 1, 'Camila', 'Villca Nina', 'camila.villca@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$ArelesneX4Uo+7g6XfSV1Q$EujN+nx7MIFIuOrTw7Zro87rbdr6Ij6D8m758g70itU', '77890107', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (11, 1, 'Rodrigo', 'Paredes Cruz', 'rodrigo.paredes@demo.example.com', '$argon2id$v=19$m=19456,t=2,p=1$nnfowdft6wVzQVjthv5i6Q$E3sSNnOdEhmwgccnLo1vUGsnS7tANBFc7l1uxbsHgF4', '78901208', false, 'aprobado', 3, '2026-11-16 21:49:29', NULL, true, '2026-11-16 21:49:29', 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.usuarios (id_usuario, id_rol, nombre, apellido, correo, password, telefono, correo_verificado, estado_verificacion, id_recepcionista_validador, fecha_validacion, motivo_rechazo, acepto_consentimiento, fecha_consentimiento, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 3, 'Dermatóloga', 'Principal', 'dr.paola.mendoza.pielclinic@gmail.com', '$argon2id$v=19$m=19456,t=2,p=1$/ogqzM1c5a0cmaRUi9Zzzw$PZqnimCLDqvgRVWfkZOYcYF9RyjA3yFDZss27k60Hu0', NULL, true, 'aprobado', NULL, '2026-11-16 21:49:13', NULL, false, NULL, NULL, NULL, '2026-11-16 21:49:13', '2026-11-17 00:29:55', NULL);


ALTER TABLE public.usuarios ENABLE TRIGGER ALL;

--
-- Data for Name: dermatologos; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.dermatologos DISABLE TRIGGER ALL;

INSERT INTO public.dermatologos (id_dermatologo, id_usuario, matricula_profesional, especialidad, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 1, 'MAT-0001', 'Dermatología', NULL, NULL, '2026-11-16 21:49:13', NULL, NULL);


ALTER TABLE public.dermatologos ENABLE TRIGGER ALL;

--
-- Data for Name: agenda_bloqueada; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.agenda_bloqueada DISABLE TRIGGER ALL;



ALTER TABLE public.agenda_bloqueada ENABLE TRIGGER ALL;

--
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.auditoria DISABLE TRIGGER ALL;

INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (1, 2, 'login', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', NULL, 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (2, 3, 'login', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', NULL, 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (3, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (4, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (5, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 6);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (6, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 7);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (7, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 8);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (8, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 9);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (9, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:29', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 10);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (10, 3, 'registro_paciente_presencial', 'usuarios', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Alta presencial: identidad verificada en persona, consentimiento informado firmado en la clínica.', 11);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (11, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Consulta por acné" (30 min) con el dermatólogo 1 el 2026-11-17T13:00:00.000Z, para el paciente 1. Agendada por recepcionista.', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (12, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Consulta por caída del cabello" (30 min) con el dermatólogo 1 el 2026-11-17T13:30:00.000Z, para el paciente 2. Agendada por recepcionista.', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (13, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Limpieza facial profunda" (60 min) con el dermatólogo 1 el 2026-11-18T13:00:00.000Z, para el paciente 3. Agendada por recepcionista.', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (14, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Detección de cáncer de piel" (30 min) con el dermatólogo 1 el 2026-11-18T14:00:00.000Z, para el paciente 4. Agendada por recepcionista.', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (15, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Peeling químico" (60 min) con el dermatólogo 1 el 2026-11-19T13:00:00.000Z, para el paciente 5. Agendada por recepcionista.', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (16, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Consulta por dermatitis y eccemas" (30 min) con el dermatólogo 1 el 2026-11-19T14:00:00.000Z, para el paciente 6. Agendada por recepcionista.', 6);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (17, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Consulta por acné" (30 min) con el dermatólogo 1 el 2026-11-20T13:00:00.000Z, para el paciente 7. Agendada por recepcionista.', 7);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (18, 3, 'cita_agendada', 'citas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Servicio "Láser para manchas y lesiones pigmentarias" (90 min) con el dermatólogo 1 el 2026-11-20T13:30:00.000Z, para el paciente 8. Agendada por recepcionista.', 8);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (19, 3, 'caja_abierta', 'cajas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Caja abierta con 100.00 Bs', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (20, 3, 'cobro_registrado', 'pagos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cobro de 150.00 Bs (EFECTIVO) de la cita 1 en la caja 1', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (21, 3, 'factura_emitida', 'facturas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Factura simulada emitida por 150.00 Bs', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (22, 3, 'cobro_registrado', 'pagos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cobro de 150.00 Bs (EFECTIVO) de la cita 2 en la caja 1', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (23, 3, 'factura_emitida', 'facturas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Factura simulada emitida por 150.00 Bs', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (24, 3, 'cobro_registrado', 'pagos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cobro de 250.00 Bs (QR) de la cita 3 en la caja 1', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (25, 3, 'factura_emitida', 'facturas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Factura simulada emitida por 250.00 Bs', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (26, 3, 'cobro_registrado', 'pagos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cobro de 200.00 Bs (TRANSFERENCIA) de la cita 4 en la caja 1', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (27, 3, 'factura_emitida', 'facturas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Factura simulada emitida por 200.00 Bs', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (28, 3, 'cobro_registrado', 'pagos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cobro de 400.00 Bs (EFECTIVO) de la cita 5 en la caja 1', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (29, 3, 'factura_emitida', 'facturas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Factura simulada emitida por 400.00 Bs', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (30, 3, 'caja_cerrada', 'cajas', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Cierre de caja. Diferencias (contado − esperado): efectivo 0.00, QR 0.00, transferencia 0.00. Total contado 1250.00 Bs (cuadra)', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (31, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Insumo "Lidocaína 2% ampolla" (Anestésicos, unidad: ampolla, mínimo 10)', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (32, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Entrada de 50 ampolla de "Lidocaína 2% ampolla", lote LD-2601, vence 2027-12-21 (motivo: compra)', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (33, 2, 'salida_insumo', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Salida de 8 ampolla de "Lidocaína 2% ampolla" (motivo: uso_consulta). Lotes: LD-2601 (8)', 1);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (34, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Insumo "Ácido hialurónico jeringa" (Rellenos, unidad: jeringa, mínimo 5)', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (35, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Entrada de 12 jeringa de "Ácido hialurónico jeringa", lote AH-1101, vence 2026-12-11 (motivo: compra)', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (36, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:30', '::ffff:127.0.0.1', 'Entrada de 10 jeringa de "Ácido hialurónico jeringa", lote AH-1102, vence 2027-09-12 (motivo: compra)', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (37, 2, 'salida_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Salida de 3 jeringa de "Ácido hialurónico jeringa" (motivo: uso_consulta). Lotes: AH-1101 (3)', 2);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (38, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Insumo "Toxina botulínica 100 UI" (Toxinas, unidad: frasco, mínimo 3)', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (39, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Entrada de 4 frasco de "Toxina botulínica 100 UI", lote TB-0077, vence 2027-05-15 (motivo: compra)', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (40, 2, 'salida_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Salida de 2 frasco de "Toxina botulínica 100 UI" (motivo: uso_consulta). Lotes: TB-0077 (2)', 3);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (41, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Insumo "Guantes de nitrilo (caja)" (Descartables, unidad: caja, mínimo 5)', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (42, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Entrada de 20 caja de "Guantes de nitrilo (caja)", lote GN-0912, sin vencimiento (motivo: compra)', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (43, 2, 'salida_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Salida de 4 caja de "Guantes de nitrilo (caja)" (motivo: uso_consulta). Lotes: GN-0912 (4)', 4);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (44, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Insumo "Jeringas 3 ml (caja)" (Descartables, unidad: caja, mínimo 10)', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (45, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Entrada de 30 caja de "Jeringas 3 ml (caja)", lote JE-3303, sin vencimiento (motivo: compra)', 5);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (46, 2, 'insumo_creado', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Insumo "Ácido salicílico 30%" (Peelings, unidad: frasco, mínimo 2)', 6);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (47, 2, 'entrada_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Entrada de 6 frasco de "Ácido salicílico 30%", lote AS-1505, vence 2027-06-04 (motivo: compra)', 6);
INSERT INTO public.auditoria (id_auditoria, id_usuario, accion, tabla_afectada, fecha_evento, ip_usuario, detalle, id_registro_afectado) VALUES (48, 2, 'salida_insumo', 'insumos', '2026-11-16 21:49:31', '::ffff:127.0.0.1', 'Salida de 1 frasco de "Ácido salicílico 30%" (motivo: uso_consulta). Lotes: AS-1505 (1)', 6);


ALTER TABLE public.auditoria ENABLE TRIGGER ALL;

--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.cache DISABLE TRIGGER ALL;



ALTER TABLE public.cache ENABLE TRIGGER ALL;

--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.cache_locks DISABLE TRIGGER ALL;



ALTER TABLE public.cache_locks ENABLE TRIGGER ALL;

--
-- Data for Name: cajas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.cajas DISABLE TRIGGER ALL;

INSERT INTO public.cajas (id_caja, id_usuario, estado, monto_apertura, fecha_apertura, fecha_cierre, cerrada_por, conteo_efectivo, conteo_qr, conteo_transferencia, monto_cierre, sistema_efectivo, sistema_qr, sistema_transferencia, faltante_efectivo, faltante_qr, faltante_transferencia, observacion_cierre, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 3, 'CERRADA', 100.00, '2026-11-16 21:49:30', '2026-11-16 21:49:30', 3, 800.00, 250.00, 200.00, 1250.00, 700.00, 250.00, 200.00, 0.00, 0.00, 0.00, 'Cierre de demostración', 3, 3, '2026-11-16 21:49:30', '2026-11-16 21:49:30', NULL);


ALTER TABLE public.cajas ENABLE TRIGGER ALL;

--
-- Data for Name: estados_cita; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.estados_cita DISABLE TRIGGER ALL;

INSERT INTO public.estados_cita (id_estado_cita, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'pendiente', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_cita (id_estado_cita, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'asistio', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_cita (id_estado_cita, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'cancelada', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_cita (id_estado_cita, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 'no_asistio', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);


ALTER TABLE public.estados_cita ENABLE TRIGGER ALL;

--
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.pacientes DISABLE TRIGGER ALL;

INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 4, '6123450', '1991-04-12', 'Femenino', 'O+', 'Penicilina', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 5, '7234561', '1985-09-03', 'Masculino', 'A+', NULL, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 6, '8345672', '2001-01-25', 'Femenino', 'B+', 'Látex', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 7, '5456783', '1978-11-30', 'Masculino', 'O-', NULL, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 8, '9567894', '1996-06-18', 'Femenino', 'AB+', NULL, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 9, '4678905', '1969-02-07', 'Masculino', 'A-', 'Sulfas', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (7, 10, '3789016', '2008-08-22', 'Femenino', 'B-', NULL, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:29', NULL, NULL);
INSERT INTO public.pacientes (id_paciente, id_usuario, ci, fecha_nacimiento, genero, tipo_sangre, alergias, url_foto_carnet_frontal, url_foto_carnet_reverso, url_foto_selfie_rostro, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (8, 11, '2890127', '1993-12-05', 'Masculino', 'O+', NULL, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);


ALTER TABLE public.pacientes ENABLE TRIGGER ALL;

--
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.servicios DISABLE TRIGGER ALL;

INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'Consulta dermatológica general', 'Evaluación clínica de la piel, el cabello y las uñas.', 150.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'Consulta por acné', 'Diagnóstico y plan de tratamiento del acné en todos sus grados.', 150.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'Consulta por dermatitis y eccemas', 'Evaluación y tratamiento de dermatitis atópica, de contacto y eccemas.', 150.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 'Detección de cáncer de piel', 'Revisión de lunares y lesiones sospechosas con dermatoscopía.', 200.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 'Consulta por caída del cabello', 'Evaluación de alopecias y enfermedades del cuero cabelludo.', 150.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 'Control y seguimiento', 'Control de evolución de un tratamiento en curso.', 100.00, 30, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (7, 'Limpieza facial profunda', 'Limpieza, extracción y mascarilla con productos dermatológicos.', 250.00, 60, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (8, 'Peeling químico', 'Exfoliación química controlada para manchas, textura y acné residual.', 400.00, 60, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (9, 'Mesoterapia facial', 'Microinyecciones de activos para hidratación y luminosidad.', 500.00, 60, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (10, 'Aplicación de bótox', 'Toxina botulínica para arrugas de expresión (por zonas).', 1200.00, 60, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (11, 'Láser de rejuvenecimiento facial', 'Láser fraccionado para textura, poros y líneas finas.', 1100.00, 90, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.servicios (id_servicio, nombre_servicio, descripcion, precio, duracion_minutos, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (12, 'Láser para manchas y lesiones pigmentarias', 'Tratamiento láser de melasma, léntigos y manchas solares.', 1000.00, 90, NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);


ALTER TABLE public.servicios ENABLE TRIGGER ALL;

--
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.citas DISABLE TRIGGER ALL;

INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 1, 1, 1, 2, '2026-11-17 13:00:00', 30, 'Control de acné y manchas', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 2, 1, 1, 5, '2026-11-17 13:30:00', 30, 'Caída de cabello', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 3, 1, 1, 7, '2026-11-18 13:00:00', 60, 'Limpieza facial profunda', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 4, 1, 1, 4, '2026-11-18 14:00:00', 30, 'Revisión de lunares', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 5, 1, 1, 8, '2026-11-19 13:00:00', 60, 'Peeling y rejuvenecimiento', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 6, 1, 1, 3, '2026-11-19 14:00:00', 30, 'Dermatitis en las manos', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (7, 7, 1, 1, 2, '2026-11-20 13:00:00', 30, 'Acné juvenil', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.citas (id_cita, id_paciente, id_dermatologo, id_estado_cita, id_servicio, fecha_cita, duracion_minutos, motivo_consulta, notas_recepcion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (8, 8, 1, 1, 12, '2026-11-20 13:30:00', 90, 'Manchas por sol', NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);


ALTER TABLE public.citas ENABLE TRIGGER ALL;

--
-- Data for Name: estados_pago; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.estados_pago DISABLE TRIGGER ALL;

INSERT INTO public.estados_pago (id_estado_pago, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'pendiente', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_pago (id_estado_pago, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'aprobado', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_pago (id_estado_pago, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'rechazado', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.estados_pago (id_estado_pago, nombre_estado, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 'anulado', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);


ALTER TABLE public.estados_pago ENABLE TRIGGER ALL;

--
-- Data for Name: metodos_pago; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.metodos_pago DISABLE TRIGGER ALL;

INSERT INTO public.metodos_pago (id_metodo_pago, nombre_metodo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'transferencia', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.metodos_pago (id_metodo_pago, nombre_metodo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'qr', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);
INSERT INTO public.metodos_pago (id_metodo_pago, nombre_metodo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'efectivo', NULL, NULL, '2026-11-16 17:49:13', NULL, NULL);


ALTER TABLE public.metodos_pago ENABLE TRIGGER ALL;

--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.pagos DISABLE TRIGGER ALL;

INSERT INTO public.pagos (id_pago, id_cita, id_metodo_pago, id_estado_pago, monto, referencia, fecha_pago, id_caja, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 1, 3, 2, 150.00, NULL, '2026-11-16 21:49:30', 1, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.pagos (id_pago, id_cita, id_metodo_pago, id_estado_pago, monto, referencia, fecha_pago, id_caja, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 2, 3, 2, 150.00, NULL, '2026-11-16 21:49:30', 1, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.pagos (id_pago, id_cita, id_metodo_pago, id_estado_pago, monto, referencia, fecha_pago, id_caja, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 3, 2, 2, 250.00, 'QR-DEMO-0001', '2026-11-16 21:49:30', 1, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.pagos (id_pago, id_cita, id_metodo_pago, id_estado_pago, monto, referencia, fecha_pago, id_caja, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 4, 1, 2, 200.00, 'TRF-DEMO-0001', '2026-11-16 21:49:30', 1, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.pagos (id_pago, id_cita, id_metodo_pago, id_estado_pago, monto, referencia, fecha_pago, id_caja, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 5, 3, 2, 400.00, NULL, '2026-11-16 21:49:30', 1, NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);


ALTER TABLE public.pagos ENABLE TRIGGER ALL;

--
-- Data for Name: comprobantes_pago; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.comprobantes_pago DISABLE TRIGGER ALL;



ALTER TABLE public.comprobantes_pago ENABLE TRIGGER ALL;

--
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.facturas DISABLE TRIGGER ALL;

INSERT INTO public.facturas (id_factura, id_pago, numero_factura, nit_ci_cliente, nombre_cliente, razon_social, monto, fecha_emision, estado, nro_correlativo, cuf_simulado, emisor_razon_social, emisor_nit, emisor_direccion, leyenda, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 1, '1', '6123450', 'Lucía Quispe Mamani', 'Lucía Quispe Mamani', 150.00, '2026-11-16 21:49:30', 'EMITIDA', 1, 'c98a0ac6-573e-47b4-8f41-a0325be1e09b', 'Clínica Dermatológica DermaClinic S.R.L.', '1020304050', 'Calle 9 de Calacoto, Esq. Sánchez Bustamante, Edif. Vitruvio I, Piso 7, La Paz - Bolivia', 'SIMULACIÓN ACADÉMICA SIN VALIDEZ TRIBUTARIA', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.facturas (id_factura, id_pago, numero_factura, nit_ci_cliente, nombre_cliente, razon_social, monto, fecha_emision, estado, nro_correlativo, cuf_simulado, emisor_razon_social, emisor_nit, emisor_direccion, leyenda, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 2, '2', '7234561', 'Carlos Mendoza Rojas', 'Carlos Mendoza Rojas', 150.00, '2026-11-16 21:49:30', 'EMITIDA', 2, '899f0880-8704-47b5-9b81-b2a5a02459ea', 'Clínica Dermatológica DermaClinic S.R.L.', '1020304050', 'Calle 9 de Calacoto, Esq. Sánchez Bustamante, Edif. Vitruvio I, Piso 7, La Paz - Bolivia', 'SIMULACIÓN ACADÉMICA SIN VALIDEZ TRIBUTARIA', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.facturas (id_factura, id_pago, numero_factura, nit_ci_cliente, nombre_cliente, razon_social, monto, fecha_emision, estado, nro_correlativo, cuf_simulado, emisor_razon_social, emisor_nit, emisor_direccion, leyenda, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 3, '3', '8345672', 'Valeria Choque Condori', 'Valeria Choque Condori', 250.00, '2026-11-16 21:49:30', 'EMITIDA', 3, '1d4021c0-1c8e-4db6-97b5-2a100281e587', 'Clínica Dermatológica DermaClinic S.R.L.', '1020304050', 'Calle 9 de Calacoto, Esq. Sánchez Bustamante, Edif. Vitruvio I, Piso 7, La Paz - Bolivia', 'SIMULACIÓN ACADÉMICA SIN VALIDEZ TRIBUTARIA', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.facturas (id_factura, id_pago, numero_factura, nit_ci_cliente, nombre_cliente, razon_social, monto, fecha_emision, estado, nro_correlativo, cuf_simulado, emisor_razon_social, emisor_nit, emisor_direccion, leyenda, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 4, '4', '5456783', 'Diego Flores Apaza', 'Diego Flores Apaza', 200.00, '2026-11-16 21:49:30', 'EMITIDA', 4, 'e25e2702-caf2-48fb-8a8d-50fa07df0eea', 'Clínica Dermatológica DermaClinic S.R.L.', '1020304050', 'Calle 9 de Calacoto, Esq. Sánchez Bustamante, Edif. Vitruvio I, Piso 7, La Paz - Bolivia', 'SIMULACIÓN ACADÉMICA SIN VALIDEZ TRIBUTARIA', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.facturas (id_factura, id_pago, numero_factura, nit_ci_cliente, nombre_cliente, razon_social, monto, fecha_emision, estado, nro_correlativo, cuf_simulado, emisor_razon_social, emisor_nit, emisor_direccion, leyenda, fecha_anulacion, anulado_por, motivo_anulacion, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 5, '5', '9567894', 'Andrea Salazar Vega', 'Andrea Salazar Vega', 400.00, '2026-11-16 21:49:30', 'EMITIDA', 5, '2347de57-04b3-42f2-82ce-14d02e2696b6', 'Clínica Dermatológica DermaClinic S.R.L.', '1020304050', 'Calle 9 de Calacoto, Esq. Sánchez Bustamante, Edif. Vitruvio I, Piso 7, La Paz - Bolivia', 'SIMULACIÓN ACADÉMICA SIN VALIDEZ TRIBUTARIA', NULL, NULL, NULL, 3, NULL, '2026-11-16 21:49:30', NULL, NULL);


ALTER TABLE public.facturas ENABLE TRIGGER ALL;

--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.failed_jobs DISABLE TRIGGER ALL;



ALTER TABLE public.failed_jobs ENABLE TRIGGER ALL;

--
-- Data for Name: historial_clinico; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.historial_clinico DISABLE TRIGGER ALL;



ALTER TABLE public.historial_clinico ENABLE TRIGGER ALL;

--
-- Data for Name: horarios_clinica_bloqueados; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.horarios_clinica_bloqueados DISABLE TRIGGER ALL;



ALTER TABLE public.horarios_clinica_bloqueados ENABLE TRIGGER ALL;

--
-- Data for Name: zonas_cuerpo; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.zonas_cuerpo DISABLE TRIGGER ALL;



ALTER TABLE public.zonas_cuerpo ENABLE TRIGGER ALL;

--
-- Data for Name: imagenes_dermatologicas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.imagenes_dermatologicas DISABLE TRIGGER ALL;



ALTER TABLE public.imagenes_dermatologicas ENABLE TRIGGER ALL;

--
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.insumos DISABLE TRIGGER ALL;

INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 'Lidocaína 2% ampolla', 'Anestésicos', 'ampolla', 10, true, 2, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 'Ácido hialurónico jeringa', 'Rellenos', 'jeringa', 5, true, 2, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 'Toxina botulínica 100 UI', 'Toxinas', 'frasco', 3, true, 2, NULL, '2026-11-16 21:49:31', NULL, NULL);
INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 'Guantes de nitrilo (caja)', 'Descartables', 'caja', 5, true, 2, NULL, '2026-11-16 21:49:31', NULL, NULL);
INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 'Jeringas 3 ml (caja)', 'Descartables', 'caja', 10, true, 2, NULL, '2026-11-16 21:49:31', NULL, NULL);
INSERT INTO public.insumos (id_insumo, nombre, categoria, unidad, stock_minimo, activo, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 'Ácido salicílico 30%', 'Peelings', 'frasco', 2, true, 2, NULL, '2026-11-16 21:49:31', NULL, NULL);


ALTER TABLE public.insumos ENABLE TRIGGER ALL;

--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.job_batches DISABLE TRIGGER ALL;



ALTER TABLE public.job_batches ENABLE TRIGGER ALL;

--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.jobs DISABLE TRIGGER ALL;



ALTER TABLE public.jobs ENABLE TRIGGER ALL;

--
-- Data for Name: lotes_insumo; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.lotes_insumo DISABLE TRIGGER ALL;

INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (1, 1, 'LD-2601', '2027-12-21', 50, 42, 'Distribuidora Andina (demo)', '2026-11-16 21:49:30', 2, 2, '2026-11-16 21:49:30', '2026-11-16 21:49:30', NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (3, 2, 'AH-1102', '2027-09-12', 10, 10, 'Distribuidora Andina (demo)', '2026-11-16 21:49:30', 2, NULL, '2026-11-16 21:49:30', NULL, NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (2, 2, 'AH-1101', '2026-12-11', 12, 9, 'Distribuidora Andina (demo)', '2026-11-16 21:49:30', 2, 2, '2026-11-16 21:49:30', '2026-11-16 21:49:30', NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (4, 3, 'TB-0077', '2027-05-15', 4, 2, 'Distribuidora Andina (demo)', '2026-11-16 21:49:31', 2, 2, '2026-11-16 21:49:31', '2026-11-16 21:49:31', NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (5, 4, 'GN-0912', NULL, 20, 16, 'Distribuidora Andina (demo)', '2026-11-16 21:49:31', 2, 2, '2026-11-16 21:49:31', '2026-11-16 21:49:31', NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (6, 5, 'JE-3303', NULL, 30, 30, 'Distribuidora Andina (demo)', '2026-11-16 21:49:31', 2, NULL, '2026-11-16 21:49:31', NULL, NULL);
INSERT INTO public.lotes_insumo (id_lote, id_insumo, nro_lote, fecha_vencimiento, cantidad_inicial, cantidad_actual, proveedor, fecha_ingreso, creado_por, modificado_por, fecha_creacion, fecha_modificacion, fecha_eliminacion) VALUES (7, 6, 'AS-1505', '2027-06-04', 6, 5, 'Distribuidora Andina (demo)', '2026-11-16 21:49:31', 2, 2, '2026-11-16 21:49:31', '2026-11-16 21:49:31', NULL);


ALTER TABLE public.lotes_insumo ENABLE TRIGGER ALL;

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.migrations DISABLE TRIGGER ALL;



ALTER TABLE public.migrations ENABLE TRIGGER ALL;

--
-- Data for Name: movimientos_insumo; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.movimientos_insumo DISABLE TRIGGER ALL;

INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (1, 1, 1, 'ENTRADA', 'compra', 50, NULL, NULL, 2, '2026-11-16 21:49:30');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (2, 1, 1, 'SALIDA', 'uso_consulta', 8, NULL, 'Uso en consulta (demostración)', 2, '2026-11-16 21:49:30');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (3, 2, 2, 'ENTRADA', 'compra', 12, NULL, NULL, 2, '2026-11-16 21:49:30');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (4, 2, 3, 'ENTRADA', 'compra', 10, NULL, NULL, 2, '2026-11-16 21:49:30');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (5, 2, 2, 'SALIDA', 'uso_consulta', 3, NULL, 'Uso en consulta (demostración)', 2, '2026-11-16 21:49:30');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (6, 3, 4, 'ENTRADA', 'compra', 4, NULL, NULL, 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (7, 3, 4, 'SALIDA', 'uso_consulta', 2, NULL, 'Uso en consulta (demostración)', 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (8, 4, 5, 'ENTRADA', 'compra', 20, NULL, NULL, 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (9, 4, 5, 'SALIDA', 'uso_consulta', 4, NULL, 'Uso en consulta (demostración)', 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (10, 5, 6, 'ENTRADA', 'compra', 30, NULL, NULL, 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (11, 6, 7, 'ENTRADA', 'compra', 6, NULL, NULL, 2, '2026-11-16 21:49:31');
INSERT INTO public.movimientos_insumo (id_movimiento, id_insumo, id_lote, tipo, motivo, cantidad, id_cita, observacion, id_usuario, fecha_movimiento) VALUES (12, 6, 7, 'SALIDA', 'uso_consulta', 1, NULL, 'Uso en consulta (demostración)', 2, '2026-11-16 21:49:31');


ALTER TABLE public.movimientos_insumo ENABLE TRIGGER ALL;

--
-- Data for Name: recetas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.recetas DISABLE TRIGGER ALL;



ALTER TABLE public.recetas ENABLE TRIGGER ALL;

--
-- Data for Name: tratamientos_medicamentos; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.tratamientos_medicamentos DISABLE TRIGGER ALL;



ALTER TABLE public.tratamientos_medicamentos ENABLE TRIGGER ALL;

--
-- Data for Name: recordatorios_alarmas; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE public.recordatorios_alarmas DISABLE TRIGGER ALL;



ALTER TABLE public.recordatorios_alarmas ENABLE TRIGGER ALL;

--
-- Name: agenda_bloqueada_id_bloqueo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agenda_bloqueada_id_bloqueo_seq', 1, false);


--
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 48, true);


--
-- Name: cajas_id_caja_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cajas_id_caja_seq', 1, true);


--
-- Name: citas_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.citas_id_cita_seq', 8, true);


--
-- Name: comprobantes_pago_id_comprobante_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comprobantes_pago_id_comprobante_seq', 1, false);


--
-- Name: dermatologos_id_dermatologo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dermatologos_id_dermatologo_seq', 1, true);


--
-- Name: estados_cita_id_estado_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estados_cita_id_estado_cita_seq', 4, true);


--
-- Name: estados_pago_id_estado_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estados_pago_id_estado_pago_seq', 4, true);


--
-- Name: facturas_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.facturas_id_factura_seq', 5, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: historial_clinico_id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.historial_clinico_id_historial_seq', 1, false);


--
-- Name: horarios_clinica_bloqueados_id_bloqueo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.horarios_clinica_bloqueados_id_bloqueo_seq', 1, false);


--
-- Name: imagenes_dermatologicas_id_imagen_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imagenes_dermatologicas_id_imagen_seq', 1, false);


--
-- Name: insumos_id_insumo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.insumos_id_insumo_seq', 6, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: lotes_insumo_id_lote_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lotes_insumo_id_lote_seq', 7, true);


--
-- Name: metodos_pago_id_metodo_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.metodos_pago_id_metodo_pago_seq', 3, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: movimientos_insumo_id_movimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movimientos_insumo_id_movimiento_seq', 12, true);


--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 8, true);


--
-- Name: pagos_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pagos_id_pago_seq', 5, true);


--
-- Name: recetas_id_receta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recetas_id_receta_seq', 1, false);


--
-- Name: recordatorios_alarmas_id_recordatorio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recordatorios_alarmas_id_recordatorio_seq', 1, false);


--
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_rol_seq', 4, true);


--
-- Name: servicios_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.servicios_id_servicio_seq', 12, true);


--
-- Name: tratamientos_medicamentos_id_tratamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tratamientos_medicamentos_id_tratamiento_seq', 1, false);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 11, true);


--
-- Name: zonas_cuerpo_id_zona_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zonas_cuerpo_id_zona_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict HzGPiIWEuw30S70apz2fSpXfPskVZLehLgFdgi9qaDOH7sJ0kclURiEqXiw3yeW


--
-- El esquema ya crea el contador de facturas en 0; aquí se pone en el valor real
-- (5 facturas emitidas) para que la próxima factura sea la Nº 6 y no se repitan números.
--
UPDATE public.contadores_factura SET ultimo_numero = 5 WHERE clave = 'FACTURA';
