class CreateRpmSources < ActiveRecord::Migration[5.2]
   def change
      create_table :rpm_sources do |t|
         t.string :slug, null: false, index: { unique: true }, comment: "Плашка источника пакетов"
         t.string :name, null: false, index: { unique: true }, comment: "Имя источника пакетов"
         t.string :path, null: false, index: { unique: true }, comment: "Путь к местному хранилищу пакетов для данной архитектуры"
         t.references :branch, null: false, foreign_key: true, comment: "Указатель на ветвь, к которой принадлежит источник"
         t.boolean :primary, default: false, null: false, comment: "Первичный ли это источник пакетов для ветви"
         t.boolean :active, default: true, null: false, comment: "Задействован ли этот источник пакетов"
         t.boolean :published, default: true, null: false, comment: "Обнародован ли этот источник пакетов"
         t.integer :rpms_count, default: 0, null: false, comment: "Счётчик именованных пакетов для источника ветви"
         t.datetime :changed_at, default: "1970-01-01 00:00:00", null: false, comment: "Время последнего изменения пакетов для в источнике"

         t.timestamps
      end
   end
end
