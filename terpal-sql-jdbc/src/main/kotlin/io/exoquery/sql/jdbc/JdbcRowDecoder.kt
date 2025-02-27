package io.exoquery.sql.jdbc

import io.exoquery.sql.*
import kotlinx.serialization.descriptors.SerialDescriptor
import kotlinx.serialization.json.Json
import kotlinx.serialization.modules.SerializersModule
import java.sql.Connection
import java.sql.ResultSet
import java.sql.ResultSetMetaData

class JdbcRowDecoder(
  ctx: JdbcDecodingContext,
  module: SerializersModule,
  initialRowIndex: Int,
  api: ApiDecoders<Connection, ResultSet>,
  decoders: Set<SqlDecoder<Connection, ResultSet, out Any>>,
  columnInfos: List<ColumnInfo>,
  type: RowDecoderType,
  json: Json,
  endCallback: (Int) -> Unit
): RowDecoder<Connection, ResultSet>(ctx, module, initialRowIndex, api, decoders, columnInfos, type, json, endCallback) {

  companion object {
    operator fun invoke(
      ctx: JdbcDecodingContext,
      module: SerializersModule,
      api: ApiDecoders<Connection, ResultSet>,
      decoders: Set<SqlDecoder<Connection, ResultSet, out Any>>,
      descriptor: SerialDescriptor,
      json: Json
    ): JdbcRowDecoder {
      fun metaColumnData(meta: ResultSetMetaData) =
        (1..meta.columnCount).map { ColumnInfo(meta.getColumnName(it), meta.getColumnTypeName(it)) }
      val metaColumns = metaColumnData(ctx.row.metaData)
      descriptor.verifyColumns(metaColumns)
      return JdbcRowDecoder(ctx, module, 1, api, decoders, metaColumns, RowDecoderType.Regular, json, {})
    }
  }

  override fun cloneSelf(ctx: JdbcDecodingContext, initialRowIndex: Int, type: RowDecoderType, endCallback: (Int) -> Unit): RowDecoder<Connection, ResultSet> =
    JdbcRowDecoder(ctx, this.serializersModule, initialRowIndex, api, decoders, columnInfos, type, json, endCallback)
}
