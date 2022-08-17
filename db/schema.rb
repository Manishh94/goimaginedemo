# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_16_061508) do

  create_table "addon_descriptions", primary_key: ["addon", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.string "addon", limit: 32, default: "", null: false
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "addons", primary_key: "addon", id: { type: :string, limit: 32, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "version", limit: 16, default: "", null: false
    t.integer "priority", default: 0, null: false, unsigned: true
    t.string "dependencies", default: "", null: false
    t.string "conflicts", default: "", null: false
    t.boolean "separate", null: false
    t.boolean "unmanaged", null: false
    t.boolean "has_icon", null: false
    t.integer "install_datetime", default: 0, null: false
    t.integer "marketplace_id", unsigned: true
    t.string "marketplace_license_key", limit: 64
    t.index ["priority"], name: "priority"
  end

  create_table "attachment_descriptions", primary_key: ["attachment_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "attachment_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "description", default: "", null: false
  end

  create_table "attachments", primary_key: "attachment_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "object_type", limit: 30, default: "", null: false
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "", null: false
    t.integer "position", default: 0, null: false
    t.string "filename", limit: 100, default: "", null: false
    t.integer "filesize", default: 0, null: false, unsigned: true
    t.string "usergroup_ids", default: "0", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "file_type"
    t.index ["object_type", "object_id"], name: "object_type"
    t.index ["type"], name: "type"
  end

  create_table "banner_descriptions", primary_key: ["banner_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "banner_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "banner", default: "", null: false
    t.string "url", default: "", null: false
    t.text "description", size: :medium
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "banner_images", primary_key: "banner_image_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "banner_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["banner_id", "lang_code"], name: "banner", unique: true
  end

  create_table "banners", primary_key: "banner_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "type", limit: 1, default: "G", null: false
    t.string "target", limit: 1, default: "B", null: false
    t.string "localization", default: "", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.index ["localization"], name: "localization"
    t.index ["status"], name: "status"
  end

  create_table "bm_block_statuses", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "snapping_id", null: false
    t.text "object_ids"
    t.string "object_type", limit: 32, null: false
    t.index ["snapping_id", "object_type"], name: "snapping_id", unique: true
  end

  create_table "bm_blocks", primary_key: "block_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "type", limit: 64, default: "", null: false
    t.text "properties"
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.integer "storefront_id", default: 0, null: false, unsigned: true
  end

  create_table "bm_blocks_content", primary_key: ["block_id", "snapping_id", "lang_code", "object_id", "object_type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "snapping_id", null: false, unsigned: true
    t.integer "object_id", default: 0, null: false, unsigned: true
    t.string "object_type", limit: 64, default: "", null: false
    t.integer "block_id", null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.text "content", null: false
  end

  create_table "bm_blocks_descriptions", primary_key: ["block_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "block_id", null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", limit: 64, default: "", null: false
  end

  create_table "bm_containers", primary_key: "container_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "location_id", limit: 3, null: false, unsigned: true
    t.column "position", "enum('TOP_PANEL','HEADER','CONTENT','FOOTER')", null: false
    t.integer "width", limit: 1, null: false
    t.string "user_class", limit: 128, default: "", null: false
    t.string "linked_to_default", limit: 1, default: "Y", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "company_id", default: 0, null: false, comment: "If a vendor uses custom block configuration for a container, his/her vendor ID is stored here", unsigned: true
    t.index ["location_id", "company_id"], name: "location_id_company_id"
    t.index ["location_id", "position", "company_id"], name: "location_id_position_company_id"
    t.index ["location_id"], name: "location_id"
  end

  create_table "bm_grids", primary_key: "grid_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "container_id", limit: 3, null: false, unsigned: true
    t.integer "parent_id", default: 0, null: false, unsigned: true
    t.integer "order", limit: 3, default: 0, null: false, unsigned: true
    t.integer "width", limit: 1, default: 1, null: false, unsigned: true
    t.integer "offset", limit: 1, default: 0, null: false, unsigned: true
    t.string "user_class", limit: 128, default: "", null: false
    t.integer "omega", limit: 1, default: 0, null: false, unsigned: true
    t.integer "alpha", limit: 1, default: 0, null: false, unsigned: true
    t.string "wrapper", limit: 128, default: "", null: false
    t.column "content_align", "enum('LEFT','RIGHT','FULL_WIDTH')", default: "FULL_WIDTH", null: false
    t.string "html_element", limit: 8, default: "div", null: false
    t.integer "clear", limit: 1, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.string "section_class", default: "", null: false
    t.string "section_width", limit: 1, default: "S", null: false
    t.index ["container_id"], name: "container_id"
  end

  create_table "bm_layouts", primary_key: "layout_id", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 64, default: "", null: false
    t.integer "is_default", limit: 1, default: 0, null: false
    t.integer "width", limit: 1, default: 16, null: false
    t.column "layout_width", "enum('fixed','fluid','full_width')", default: "fixed", null: false
    t.integer "min_width", default: 760, null: false, unsigned: true
    t.integer "max_width", default: 960, null: false, unsigned: true
    t.string "theme_name", limit: 64, default: "", null: false
    t.string "style_id", limit: 64, default: "", null: false
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.index ["is_default", "storefront_id"], name: "is_default"
  end

  create_table "bm_locations", primary_key: "location_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "dispatch", limit: 64, null: false
    t.boolean "is_default", null: false
    t.integer "layout_id", default: 0, null: false, unsigned: true
    t.text "object_ids"
    t.text "custom_html"
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "bm_locations_descriptions", primary_key: ["location_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "location_id", null: false, unsigned: true, auto_increment: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", limit: 64, null: false
    t.text "title", null: false
    t.text "meta_description", null: false
    t.text "meta_keywords", null: false
  end

  create_table "bm_snapping", primary_key: "snapping_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "block_id", null: false, unsigned: true
    t.integer "grid_id", null: false, unsigned: true
    t.string "wrapper", limit: 128, default: "", null: false
    t.string "user_class", limit: 128, default: "", null: false
    t.integer "order", limit: 3, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.string "display_on", limit: 1, default: "E", null: false
    t.index ["grid_id"], name: "grid_id"
  end

  create_table "cache_handlers", id: false, charset: "utf8mb3", comment: "Stores relations between cache records registered with TyghRegistry::registerCache() and tables they depend on", force: :cascade do |t|
    t.string "table_name", limit: 128, null: false, comment: "Table name the cache record depends on"
    t.string "cache_key", limit: 128, null: false, comment: "Cache key or prefix used to register cache record"
    t.index ["table_name", "cache_key"], name: "table_name_cache_key", unique: true
    t.index ["table_name"], name: "table_name"
  end

  create_table "categories", primary_key: "category_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "id_path", default: "", null: false
    t.integer "level", default: 1, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "usergroup_ids", default: "0", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "product_count", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "is_op", limit: 1, default: "N", null: false
    t.string "localization", default: "", null: false
    t.string "age_verification", limit: 1, default: "N", null: false
    t.integer "age_limit", limit: 1, default: 0, null: false
    t.string "parent_age_verification", limit: 1, default: "N", null: false
    t.integer "parent_age_limit", limit: 1, default: 0, null: false
    t.text "selected_views"
    t.string "default_view", limit: 50, default: "", null: false
    t.string "product_details_view", limit: 50, default: "", null: false
    t.integer "product_columns", limit: 1, default: 0, null: false, unsigned: true
    t.string "is_trash", limit: 1, default: "N", null: false
    t.string "category_type", limit: 1, default: "C", null: false
    t.string "ss_vendor_categories", limit: 1, default: "N"
    t.index ["age_verification", "age_limit"], name: "age_verification"
    t.index ["category_id", "usergroup_ids", "status"], name: "p_category_id"
    t.index ["id_path"], name: "id_path"
    t.index ["localization"], name: "localization"
    t.index ["parent_age_verification", "parent_age_limit"], name: "parent_age_verification"
    t.index ["parent_id"], name: "parent"
    t.index ["position"], name: "position"
    t.index ["usergroup_ids", "status", "parent_id"], name: "c_status"
  end

  create_table "category_descriptions", primary_key: ["category_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "category", default: "", null: false
    t.text "description", size: :medium
    t.string "meta_keywords", default: "", null: false
    t.string "meta_description", default: "", null: false
    t.string "page_title", default: "", null: false
    t.text "age_warning_message"
    t.string "mega_m_category_banner_url", default: "", null: false
    t.text "mega_m_category_svg_icon", null: false
  end

  create_table "category_vendor_product_count", primary_key: ["company_id", "category_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.integer "category_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_count", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "common_descriptions", primary_key: ["object_id", "lang_code", "object_holder"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "object_type", limit: 32, default: "", null: false
    t.text "description", size: :medium
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "object", limit: 128, default: "", null: false
    t.string "object_holder", limit: 32, default: "", null: false
  end

  create_table "companies", primary_key: "company_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "company", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "address", null: false
    t.string "city", limit: 64, null: false
    t.string "state", limit: 32, null: false
    t.string "country", limit: 2, null: false
    t.string "zipcode", limit: 16, null: false
    t.string "email", limit: 128, null: false
    t.string "phone", limit: 128, null: false
    t.string "url", limit: 128, null: false
    t.string "storefront", default: "", null: false
    t.string "secure_storefront", default: "", null: false
    t.string "entry_page", limit: 50, default: "none", null: false
    t.string "redirect_customer", limit: 1, default: "Y", null: false
    t.text "countries_list"
    t.integer "timestamp", null: false
    t.text "shippings"
    t.text "logos"
    t.integer "request_user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "request_account_name", default: "", null: false
    t.binary "request_account_data"
    t.integer "plan_id", default: 0, null: false, unsigned: true
    t.string "stripe_connect_account_id", limit: 128, default: "", null: false
    t.text "featured_products"
    t.string "paypal_commerce_platform_account_id", limit: 128, default: "", null: false
    t.string "taxjar_key", default: "", null: false
    t.text "taxjar_export_statuses"
    t.text "taxjar_export_csv_data"
    t.string "sd_ga_tracking_code", limit: 50, default: "", null: false
    t.string "tagline", default: "", null: false
    t.string "url_facebook", default: "", null: false
    t.string "url_instagram", default: "", null: false
    t.string "url_twitter", default: "", null: false
    t.string "url_pinterest", default: "", null: false
    t.text "announcement", size: :medium, null: false
    t.string "shippo_api_token", limit: 500
    t.string "shippo_carrier", limit: 99
    t.string "shippo_service_type", limit: 99
    t.index ["status"], name: "idx_status"
  end

  create_table "company_descriptions", primary_key: ["company_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", null: false, unsigned: true
    t.string "lang_code", limit: 2, null: false
    t.text "company_description"
    t.text "terms", size: :medium
    t.text "subdomain_colors", size: :medium, null: false
  end

  create_table "countries", primary_key: "code", id: { type: :string, limit: 2, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code_A3", limit: 3, default: "", null: false
    t.string "code_N3", limit: 3, default: "", null: false
    t.string "region", limit: 2, default: "", null: false
    t.float "lat", default: 0.0, null: false
    t.float "lon", default: 0.0, null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["status"], name: "status"
  end

  create_table "country_descriptions", primary_key: ["code", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 2, default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "country", limit: 128, default: "", null: false
  end

  create_table "cropped_images", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "pair_id", null: false, auto_increment: true
    t.string "original_image", limit: 500
    t.integer "owidth", default: 0
    t.integer "oheight", default: 0
    t.integer "cwidth", default: 0
    t.integer "cheight", default: 0
    t.integer "xpos", default: 0
    t.integer "ypos", default: 0
    t.integer "timestamp", default: 0, null: false
    t.index ["pair_id"], name: "pair_id"
  end

  create_table "csc_admin_colors", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "company_id", limit: 3, default: 0, null: false
    t.string "value", default: "", null: false
    t.index ["name", "company_id"], name: "name", unique: true
  end

  create_table "csc_product_code_generator", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "company_id", limit: 3, default: 0, null: false
    t.string "value", default: "", null: false
    t.index ["name", "company_id"], name: "name", unique: true
  end

  create_table "currencies", primary_key: "currency_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "currency_code", limit: 10, default: "", null: false
    t.string "after", limit: 1, default: "N", null: false
    t.text "symbol", size: :tiny
    t.float "coefficient", limit: 53, default: 1.0, null: false
    t.string "is_primary", limit: 1, default: "N", null: false
    t.integer "position", limit: 2, null: false
    t.string "decimals_separator", limit: 6, default: ".", null: false
    t.string "thousands_separator", limit: 6, default: ",", null: false
    t.integer "decimals", limit: 2, default: 2, null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["currency_code"], name: "currency_code", unique: true
  end

  create_table "currency_descriptions", primary_key: ["currency_code", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.string "currency_code", limit: 10, default: "", null: false
    t.string "description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "customer_events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "event_id", null: false
    t.string "event_type", null: false
    t.string "event_source", default: "chargebee", null: false
    t.text "content", size: :medium, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_event_customer"
    t.index ["event_id", "event_type", "event_source"], name: "index_customer_events_id_type_source", unique: true
  end

  create_table "customer_referrals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "referred_by_id"
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_referral_customer"
    t.index ["referred_by_id"], name: "index_referred_by"
  end

  create_table "customer_subscriptions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "status", default: "in_trial", null: false
    t.string "current_plan", null: false
    t.string "token_identifier", null: false
    t.string "token_source", default: "chargebee", null: false
    t.datetime "last_activated_on"
    t.datetime "last_canceled_on"
    t.datetime "last_renewed_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_subscription_customer"
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token_identifier", null: false
    t.string "token_source", default: "chargebee", null: false
    t.string "referral_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["referral_code"], name: "index_customers_on_referral_code", unique: true
    t.index ["token_identifier", "token_source"], name: "index_customers_on_token_identifier_and_token_source", unique: true
    t.index ["user_id"], name: "index_customers_user"
  end

  create_table "data_feed_descriptions", primary_key: ["datafeed_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "datafeed_id", default: 0, null: false, unsigned: true
    t.string "datafeed_name", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "data_feeds", primary_key: "datafeed_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.text "categories"
    t.text "products"
    t.text "fields"
    t.string "export_location", limit: 1, default: "L", null: false
    t.string "export_by_cron", limit: 1, default: "N", null: false
    t.string "ftp_url", default: "", null: false
    t.string "ftp_user", limit: 50, default: "", null: false
    t.string "ftp_pass", limit: 50, default: "", null: false
    t.string "file_name", limit: 50, default: "", null: false
    t.string "enclosure", limit: 1, default: "", null: false
    t.string "csv_delimiter", limit: 1, default: "", null: false
    t.string "exclude_disabled_products", limit: 1, default: "N", null: false
    t.string "exclude_shared_products", limit: 1, default: "N", null: false
    t.text "export_options"
    t.string "save_dir", default: "", null: false
    t.string "status", limit: 1, default: "", null: false
    t.integer "layout_id", default: 0, null: false, unsigned: true
    t.text "params"
  end

  create_table "destination_descriptions", primary_key: ["destination_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "destination_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "destination", default: "", null: false
  end

  create_table "destination_elements", primary_key: "element_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "destination_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "element", default: "", null: false
    t.string "element_type", limit: 1, default: "S", null: false
    t.index ["destination_id"], name: "c_status"
  end

  create_table "destinations", primary_key: "destination_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "localization", default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["destination_id", "status"], name: "c_status"
    t.index ["localization"], name: "localization"
  end

  create_table "discussion", primary_key: "thread_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "object_type", limit: 1, default: "", null: false
    t.string "type", limit: 1, default: "D", null: false
    t.index ["object_id", "object_type"], name: "object_id", unique: true
  end

  create_table "discussion_messages", primary_key: "post_id", id: { type: :integer, limit: 3, default: 0, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.text "message", size: :medium
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id"
  end

  create_table "discussion_posts", primary_key: "post_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "name", limit: 128, default: "", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.binary "ip_address", limit: 40, default: "", null: false
    t.string "status", limit: 1, default: "D", null: false
    t.index ["thread_id", "ip_address"], name: "thread_id"
    t.index ["thread_id", "status"], name: "thread_id_2"
  end

  create_table "discussion_rating", primary_key: "post_id", id: { type: :integer, limit: 3, default: 0, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "rating_value", limit: 1, default: 0, null: false, unsigned: true
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "description", limit: 1, default: 0, null: false, unsigned: true
    t.integer "communication", limit: 1, default: 0, null: false, unsigned: true
    t.integer "shipping", limit: 1, default: 0, null: false, unsigned: true
    t.decimal "average", precision: 5, scale: 2, default: "0.0", null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id"
  end

  create_table "ekeys", primary_key: ["object_id", "object_type", "ekey"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "object_string", limit: 128, default: "", null: false
    t.string "object_type", limit: 1, default: "R", null: false
    t.string "ekey", default: "", null: false
    t.integer "ttl", default: 0, null: false, unsigned: true
    t.text "data"
    t.index ["ekey", "object_type", "ttl"], name: "c_status", length: { ekey: 64 }
    t.index ["object_string", "object_type", "ekey"], name: "object_string", unique: true, length: { ekey: 64 }
  end

  create_table "email_logs", charset: "latin1", force: :cascade do |t|
    t.string "email_type", null: false
    t.text "email"
    t.json "related_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "object_type"
    t.integer "object_id"
    t.string "send_method", default: "", null: false
    t.string "send_status", default: "queued", null: false
    t.integer "attempts", default: 0, null: false
    t.datetime "last_sent_on"
    t.index ["email_type"], name: "index_email_logs_on_email_type"
    t.index ["object_type", "object_id"], name: "index_email_logs_on_object_type_and_object_id"
  end

  create_table "emails_delays_logs", primary_key: "log_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "type", limit: 10
    t.text "from"
    t.text "to"
    t.string "subject", limit: 500
    t.text "message", size: :long
    t.string "status", limit: 1, default: "P", null: false
    t.string "lang_code", limit: 2, default: "en", null: false
    t.string "area", limit: 1, default: "C", null: false
    t.string "error", limit: 500
    t.integer "timestamp", default: 0, null: false
    t.integer "sent_timestamp", default: 0, null: false
    t.integer "retry_send", default: 0, null: false
    t.index ["status", "retry_send"], name: "status_retry_send"
    t.index ["type", "status", "retry_send"], name: "type_status_retry_send"
    t.index ["type", "status"], name: "type_status"
  end

  create_table "exim_layouts", primary_key: "layout_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 128, default: "", null: false
    t.text "cols"
    t.text "options"
    t.string "pattern_id", limit: 128, default: "", null: false
    t.string "active", limit: 1, default: "N", null: false
    t.index ["pattern_id"], name: "pattern_id"
  end

  create_table "form_descriptions", primary_key: ["object_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.text "description"
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "form_options", primary_key: "element_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "page_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "element_type", limit: 1, default: "I", null: false
    t.string "value", default: "", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "required", limit: 1, default: "N", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["page_id", "status"], name: "page_id"
    t.index ["position"], name: "position"
  end

  create_table "gift_certificates", primary_key: "gift_cert_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "gift_cert_code", default: "", null: false
    t.string "sender", limit: 64, default: "", null: false
    t.string "recipient", limit: 64, default: "", null: false
    t.string "send_via", limit: 1, default: "E", null: false
    t.decimal "amount", precision: 12, scale: 2, default: "0.0", null: false
    t.string "email", limit: 64, default: "", null: false
    t.string "address", default: "", null: false
    t.string "address_2", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", limit: 32, default: "", null: false
    t.string "country", limit: 2, default: "", null: false
    t.string "zipcode", limit: 10, default: "", null: false
    t.string "status", limit: 1, default: "P", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "phone", limit: 32, default: "", null: false
    t.string "order_ids", default: "", null: false
    t.string "template", limit: 128, default: "", null: false
    t.text "message", size: :medium
    t.text "products"
    t.index ["status"], name: "status"
    t.index ["timestamp"], name: "timestamp"
  end

  create_table "gift_certificates_log", primary_key: "log_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "gift_cert_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "area", limit: 1, default: "C", null: false
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.decimal "amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "debit", precision: 12, scale: 2, default: "0.0", null: false
    t.text "products"
    t.text "debit_products"
    t.index ["area"], name: "area"
    t.index ["order_id"], name: "order_id"
    t.index ["timestamp"], name: "timestamp"
    t.index ["user_id"], name: "user_id"
  end

  create_table "hybrid_auth_providers", primary_key: "provider_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "provider", limit: 32, null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.string "app_id", default: "", null: false
    t.string "app_secret_key", default: ""
    t.string "app_public_key", default: ""
    t.text "app_params"
    t.string "status", limit: 1, default: "D"
  end

  create_table "hybrid_auth_users", primary_key: ["user_id", "provider_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.integer "provider_id", limit: 3, null: false, unsigned: true
    t.string "identifier", limit: 128, default: "", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
  end

  create_table "image_optimization_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "image_id", null: false
    t.string "message_type", null: false
    t.text "message", size: :medium, null: false
  end

  create_table "images", primary_key: "image_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "image_path", default: "", null: false
    t.string "optimized", limit: 1, default: "N", null: false
    t.integer "old_size", default: 0, null: false
    t.integer "new_size", default: 0, null: false
    t.string "format", limit: 32, default: "", null: false
    t.integer "image_x", default: 0, null: false
    t.integer "image_y", default: 0, null: false
    t.string "is_high_res", limit: 1, default: "N", null: false
    t.timestamp "updated_at", precision: 6
    t.timestamp "optimized_on", precision: 6
    t.integer "optimization_failure_count", default: 0, null: false
    t.index ["is_high_res"], name: "idx_is_high_res"
  end

  create_table "images_links", primary_key: "pair_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", default: 0, null: false, unsigned: true
    t.string "object_type", limit: 24, default: "", null: false
    t.integer "image_id", default: 0, null: false, unsigned: true
    t.integer "detailed_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "M", null: false
    t.integer "position", default: 0, null: false
    t.index ["detailed_id"], name: "idx_detailed_id"
    t.index ["image_id"], name: "idx_image_id"
    t.index ["object_id", "object_type", "type"], name: "object_id"
  end

  create_table "import_preset_descriptions", primary_key: ["preset_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "preset_id", default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "preset", default: "", null: false
  end

  create_table "import_preset_fields", primary_key: "field_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "preset_id", default: 0, null: false, unsigned: true
    t.string "name", default: "", null: false
    t.string "related_object_type", limit: 32, default: "product_field", null: false
    t.string "related_object", default: "", null: false
    t.text "modifier"
  end

  create_table "import_presets", primary_key: "preset_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "object_type", limit: 32, default: "products", null: false
    t.integer "last_launch", default: 0, null: false, unsigned: true
    t.string "last_status", limit: 1, default: "X", null: false
    t.text "last_result"
    t.string "file", default: "", null: false
    t.string "file_type", limit: 32, default: "server", null: false
    t.string "file_extension", limit: 6, default: "", null: false
    t.text "options"
  end

  create_table "installed_upgrades", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "type", limit: 10, default: "", null: false
    t.string "name", default: "", null: false
    t.integer "timestamp", default: 0, null: false
    t.text "description"
    t.text "conflicts", size: :long
  end

  create_table "language_values", primary_key: ["lang_code", "name"], charset: "utf8mb3", force: :cascade do |t|
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", limit: 128, default: "", null: false
    t.text "value", null: false
  end

  create_table "languages", primary_key: "lang_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", limit: 64, default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "country_code", limit: 2, default: "", null: false
    t.index ["lang_code"], name: "lang_code", unique: true
  end

  create_table "localization_descriptions", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "localization_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "localization", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["localization_id", "lang_code"], name: "localisation_id"
  end

  create_table "localization_elements", primary_key: "element_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "localization_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "element", limit: 36, default: "", null: false
    t.string "element_type", limit: 1, default: "S", null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.index ["element", "element_type"], name: "element"
    t.index ["localization_id"], name: "c_avail"
    t.index ["position"], name: "position"
  end

  create_table "localizations", primary_key: "localization_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "custom_weight_settings", limit: 1, default: "Y", null: false
    t.string "weight_symbol", default: "", null: false
    t.decimal "weight_unit", precision: 12, scale: 2, default: "0.0", null: false
    t.string "is_default", limit: 1, default: "N", null: false
    t.string "status", limit: 1, default: "A", null: false
  end

  create_table "lock_keys", primary_key: "key_id", id: { type: :string, limit: 64 }, charset: "utf8mb3", force: :cascade do |t|
    t.string "token", limit: 64, null: false
    t.integer "expiry_at", null: false, unsigned: true
  end

  create_table "logos", primary_key: "logo_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "layout_id", default: 0, null: false
    t.string "style_id", limit: 50, default: "", null: false
    t.integer "company_id", default: 0, null: false
    t.string "type", limit: 32, default: "", null: false
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.index ["type", "company_id"], name: "type"
  end

  create_table "logs", primary_key: "log_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "type", limit: 16, default: "", null: false
    t.string "event_type", limit: 1, default: "N", null: false
    t.string "action", limit: 16, default: "", null: false
    t.string "object", limit: 1, default: "", null: false
    t.text "content"
    t.text "backtrace"
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.index ["object"], name: "object"
    t.index ["timestamp"], name: "idx_timestamp"
    t.index ["type", "action"], name: "type"
  end

  create_table "ls_products_popularity", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, null: false
    t.integer "q_id", limit: 3, null: false
    t.integer "popularity", default: 0, null: false
    t.index ["popularity"], name: "popularity"
    t.index ["product_id", "q_id"], name: "product_id_q_id", unique: true
  end

  create_table "ls_q_base", primary_key: "q_id", id: { type: :integer, limit: 3 }, charset: "utf8mb3", force: :cascade do |t|
    t.string "q", limit: 128, null: false
    t.string "lang_code", limit: 2, null: false
    t.index ["q", "lang_code"], name: "q_lang_code"
  end

  create_table "ls_q_products", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "request_id", limit: 3, null: false
    t.integer "product_id", limit: 3, null: false
    t.index ["request_id", "product_id"], name: "request_id_product_id", unique: true
  end

  create_table "ls_q_requests", primary_key: "request_id", id: { type: :integer, limit: 3 }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "q_id", limit: 3, null: false
    t.integer "timestamp", null: false
    t.binary "user_ip", limit: 40, null: false
    t.string "lang_code", limit: 2, null: false
    t.index ["lang_code"], name: "lang_code"
    t.index ["q_id", "timestamp"], name: "q_id_timestamp", unique: true
    t.index ["user_ip"], name: "user_ip"
  end

  create_table "menus", primary_key: "menu_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
  end

  create_table "menus_descriptions", primary_key: ["menu_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "menu_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", default: "", null: false
  end

  create_table "notification_settings", primary_key: ["event_id", "transport_id", "receiver"], charset: "utf8mb3", force: :cascade do |t|
    t.string "event_id", limit: 100, null: false
    t.string "transport_id", limit: 50, null: false
    t.string "receiver", limit: 15, null: false, comment: "Receiver of notification message: C - Customer, A - Administrator, V - Vendor"
    t.integer "is_allowed", limit: 1, default: 0, comment: "0 - will NOT be sent, 1 - will BE sent"
  end

  create_table "notifications", primary_key: "notification_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", comment: "Stores notifications of the Notifications center", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, comment: "Notification receiver", unsigned: true
    t.string "title", limit: 256, default: "", null: false, comment: "Notification title"
    t.text "message", null: false, comment: "Notification text"
    t.string "severity", limit: 1, default: "N", null: false, comment: "Notification severity: E(rror), W(arning), N(otice), I(nfo)"
    t.string "section", limit: 128, default: "other", null: false, comment: "Section of the Notifications center to display the notification in"
    t.string "tag", limit: 32, default: "other", null: false, comment: "Tag of the notifications"
    t.string "area", limit: 1, default: "A", null: false, comment: "Area to display the notification in"
    t.string "action_url", limit: 256, default: "", null: false, comment: "Dispatch to open when clicking on the notification"
    t.integer "is_read", limit: 1, default: 0, null: false, comment: "Whether the notification has been read", unsigned: true
    t.integer "timestamp", default: 0, null: false, comment: "Time when the notification was created", unsigned: true
    t.index ["user_id", "area"], name: "idx_user_id_area"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "order_data", primary_key: "order_data_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "", null: false
    t.binary "data", size: :long, null: false
    t.index ["order_id", "type"], name: "idx_order_id_type", unique: true
  end

  create_table "order_details", primary_key: ["item_id", "order_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "item_id", default: 0, null: false, unsigned: true
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "product_code", limit: 64, default: "", null: false
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "amount", limit: 3, default: 0, null: false, unsigned: true
    t.binary "extra", size: :long, null: false
    t.index ["order_id", "product_id"], name: "o_k"
  end

  create_table "order_docs", primary_key: ["doc_id", "type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "doc_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.string "type", limit: 1, default: "I", null: false
    t.integer "order_id", limit: 3, null: false, unsigned: true
    t.index ["order_id", "type"], name: "type"
  end

  create_table "order_transactions", primary_key: ["payment_id", "transaction_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "payment_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "transaction_id", default: "", null: false
    t.string "status", limit: 1, default: "", null: false
    t.binary "extra", size: :long, null: false
  end

  create_table "orders", primary_key: "order_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "is_parent_order", limit: 1, default: "N", null: false
    t.integer "parent_order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.integer "issuer_id", limit: 3, unsigned: true
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.decimal "total", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "subtotal", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "discount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "subtotal_discount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "payment_surcharge", precision: 12, scale: 2, default: "0.0", null: false
    t.string "shipping_ids", default: "", null: false
    t.decimal "shipping_cost", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "O", null: false
    t.text "notes"
    t.text "details"
    t.text "promotions"
    t.string "promotion_ids", default: "", null: false
    t.string "firstname", limit: 32, default: "", null: false
    t.string "lastname", limit: 32, default: "", null: false
    t.string "company", default: "", null: false
    t.string "b_firstname", limit: 128, default: "", null: false
    t.string "b_lastname", limit: 128, default: "", null: false
    t.string "b_address", default: "", null: false
    t.string "b_address_2", default: "", null: false
    t.string "b_city", limit: 64, default: "", null: false
    t.string "b_county", limit: 32, default: "", null: false
    t.string "b_state", limit: 32, default: "", null: false
    t.string "b_country", limit: 2, default: "", null: false
    t.string "b_zipcode", limit: 32, default: "", null: false
    t.string "b_phone", limit: 128, default: "", null: false
    t.string "s_firstname", limit: 128, default: "", null: false
    t.string "s_lastname", limit: 128, default: "", null: false
    t.string "s_address", default: "", null: false
    t.string "s_address_2", default: "", null: false
    t.string "s_city", limit: 64, default: "", null: false
    t.string "s_county", limit: 32, default: "", null: false
    t.string "s_state", limit: 32, default: "", null: false
    t.string "s_country", limit: 2, default: "", null: false
    t.string "s_zipcode", limit: 32, default: "", null: false
    t.string "s_phone", limit: 128, default: "", null: false
    t.string "s_address_type", limit: 32, default: "", null: false
    t.string "phone", limit: 128, default: "", null: false
    t.string "fax", limit: 128, default: "", null: false
    t.string "url", limit: 32, default: "", null: false
    t.string "email", limit: 128, default: "", null: false
    t.integer "payment_id", limit: 3, default: 0, null: false
    t.string "tax_exempt", limit: 1, default: "N", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.binary "ip_address", limit: 40, default: "", null: false
    t.integer "repaid", default: 0, null: false
    t.string "validation_code", limit: 20, default: "", null: false
    t.integer "localization_id", limit: 3, null: false
    t.integer "profile_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.string "recipient_firstname", limit: 128, default: "", null: false
    t.string "recipient_lastname", limit: 128, default: "", null: false
    t.string "recipient_address", default: "", null: false
    t.string "recipient_city", limit: 64, default: "", null: false
    t.string "recipient_state", limit: 32, default: "", null: false
    t.string "recipient_zipcode", limit: 32, default: "", null: false
    t.string "recipient_message", default: "", null: false
    t.string "recipient_country", limit: 2, default: "", null: false
    t.string "sd_ga_cid", limit: 30, default: "", null: false
    t.string "sd_ga_status", limit: 1, default: "N", null: false
    t.string "shippo_order_id", limit: 250
    t.index ["company_id"], name: "company_id"
    t.index ["promotion_ids"], name: "promotion_ids"
    t.index ["shipping_ids"], name: "shipping_ids"
    t.index ["status"], name: "status"
    t.index ["timestamp"], name: "timestamp"
    t.index ["user_id"], name: "user_id"
  end

  create_table "original_values", primary_key: "msgctxt", id: { type: :string, limit: 128, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.text "msgid"
  end

  create_table "page_descriptions", primary_key: ["page_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "page_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "page", default: "0"
    t.text "description", size: :medium
    t.string "meta_keywords", default: "", null: false
    t.string "meta_description", default: "", null: false
    t.string "page_title", default: "", null: false
    t.string "link", default: "", null: false
  end

  create_table "pages", primary_key: "page_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "id_path", default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "page_type", limit: 1, default: "T", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false
    t.string "usergroup_ids", default: "0", null: false
    t.string "localization", default: "", null: false
    t.integer "new_window", limit: 1, default: 0, null: false
    t.string "use_avail_period", limit: 1, default: "N", null: false
    t.integer "avail_from_timestamp", default: 0, null: false, unsigned: true
    t.integer "avail_till_timestamp", default: 0, null: false, unsigned: true
    t.string "facebook_obj_type", limit: 64, null: false
    t.index ["id_path"], name: "id_path"
    t.index ["localization"], name: "localization"
    t.index ["parent_id"], name: "parent_id"
  end

  create_table "payment_descriptions", primary_key: ["payment_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "payment_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "payment", limit: 128, default: "", null: false
    t.string "description", default: "", null: false
    t.text "instructions", size: :medium
    t.string "surcharge_title", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "payment_processors", primary_key: "processor_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "processor", default: "", null: false
    t.string "processor_script", default: "", null: false
    t.string "processor_template", default: "", null: false
    t.string "admin_template", default: "", null: false
    t.string "callback", limit: 1, default: "N", null: false
    t.string "type", limit: 1, default: "P", null: false
    t.string "addon", limit: 32, default: "", null: false
  end

  create_table "payments", primary_key: "payment_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "usergroup_ids", default: "0", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.string "template", limit: 128, default: "", null: false
    t.integer "processor_id", limit: 3, default: 0, null: false, unsigned: true
    t.text "processor_params"
    t.decimal "a_surcharge", precision: 13, scale: 3, default: "0.0", null: false
    t.decimal "p_surcharge", precision: 13, scale: 3, default: "0.0", null: false
    t.string "tax_ids", default: "", null: false
    t.string "localization", default: "", null: false
    t.string "payment_category", limit: 20, default: "tab1", null: false
    t.index ["localization"], name: "localization"
    t.index ["position"], name: "position"
    t.index ["usergroup_ids", "status"], name: "c_status"
  end

  create_table "phinxlog", primary_key: "version", id: :bigint, default: nil, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "migration_name", limit: 100
    t.timestamp "start_time"
    t.timestamp "end_time"
    t.boolean "breakpoint", default: false, null: false
  end

  create_table "phinxlog1576021716", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "version", null: false
    t.timestamp "start_time"
    t.timestamp "end_time"
  end

  create_table "phinxlog1583604606", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "version", null: false
    t.timestamp "start_time"
    t.timestamp "end_time"
  end

  create_table "phinxlog1602076393", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "version", null: false
    t.timestamp "start_time"
    t.timestamp "end_time"
  end

  create_table "phinxlog1602084691", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "version", null: false
    t.timestamp "start_time"
    t.timestamp "end_time"
  end

  create_table "premoderation_products", primary_key: "product_id", id: { type: :integer, limit: 3, comment: "Moderated product ID", unsigned: true, default: nil }, charset: "utf8mb3", force: :cascade do |t|
    t.string "original_status", limit: 1, default: "A", null: false, comment: "Status of the product before it was sent to moderation"
    t.integer "updated_timestamp", default: 0, null: false, comment: "Last moderation action timestamp", unsigned: true
    t.text "reason", null: false, comment: "Last moderation reason"
  end

  create_table "privileges", primary_key: "privilege", id: { type: :string, limit: 64, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.string "is_default", limit: 1, default: "N", null: false
    t.string "section_id", limit: 32, default: "", null: false
    t.string "group_id", limit: 32, default: "", null: false
    t.string "is_view", limit: 1, default: "N", null: false
    t.index ["section_id"], name: "section_id"
  end

  create_table "product_descriptions", primary_key: ["product_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "product", default: "", null: false
    t.string "shortname", default: "", null: false
    t.text "short_description", size: :medium
    t.text "full_description", size: :medium
    t.string "meta_keywords", default: "", null: false
    t.string "meta_description", default: "", null: false
    t.text "search_words"
    t.string "page_title", default: "", null: false
    t.text "age_warning_message"
    t.text "promo_text", size: :medium
    t.text "cls_stop_words", null: false
    t.text "how_its_made", size: :medium
    t.index ["product_id"], name: "product_id"
  end

  create_table "product_feature_variant_descriptions", primary_key: ["variant_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "variant_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "variant", default: "", null: false
    t.text "description", size: :medium
    t.string "page_title", default: "", null: false
    t.string "meta_keywords", default: "", null: false
    t.string "meta_description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["variant"], name: "lsvariant"
    t.index ["variant"], name: "variant"
  end

  create_table "product_feature_variants", primary_key: "variant_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "feature_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "url", default: "", null: false
    t.string "color", limit: 128
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.index ["feature_id"], name: "feature_id"
    t.index ["position"], name: "position"
  end

  create_table "product_features", primary_key: "feature_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "feature_code", limit: 32, default: "", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "purpose", limit: 32, default: "", null: false
    t.string "feature_style", limit: 32, default: "", null: false
    t.string "filter_style", limit: 32, default: "", null: false
    t.string "feature_type", limit: 1, default: "T", null: false
    t.text "categories_path"
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "display_on_product", limit: 1, default: "Y", null: false
    t.string "display_on_catalog", limit: 1, default: "Y", null: false
    t.string "display_on_header", limit: 1, default: "N", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "comparison", limit: 1, default: "N", null: false
    t.index ["company_id"], name: "company_id"
    t.index ["status"], name: "status"
  end

  create_table "product_features_descriptions", primary_key: ["feature_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "feature_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "description", default: "", null: false
    t.text "full_description", size: :medium
    t.string "prefix", limit: 128, default: "", null: false
    t.string "suffix", limit: 128, default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "product_features_values", primary_key: ["feature_id", "product_id", "variant_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "feature_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "variant_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "value", default: "", null: false
    t.float "value_int", limit: 53
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["feature_id", "lang_code", "variant_id", "value", "value_int"], name: "fl"
    t.index ["feature_id", "product_id", "lang_code"], name: "fpl"
    t.index ["lang_code"], name: "lang_code"
    t.index ["product_id"], name: "product_id"
    t.index ["variant_id"], name: "variant_id"
  end

  create_table "product_file_descriptions", primary_key: ["file_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "file_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "file_name", default: "", null: false
    t.text "license"
    t.text "readme"
  end

  create_table "product_file_ekeys", primary_key: ["file_id", "order_id"], charset: "utf8mb3", force: :cascade do |t|
    t.string "ekey", limit: 32, default: "", null: false
    t.integer "file_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "downloads", limit: 3, default: 0, null: false, unsigned: true
    t.string "active", limit: 1, default: "N", null: false
    t.integer "ttl", default: 0, null: false
    t.index ["ekey"], name: "ekey", unique: true
    t.index ["ttl"], name: "ttl"
  end

  create_table "product_file_folder_descriptions", primary_key: ["folder_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "folder_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "folder_name", default: "", null: false
  end

  create_table "product_file_folders", primary_key: "folder_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["product_id"], name: "product_id"
  end

  create_table "product_files", primary_key: "file_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "folder_id", limit: 3, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "file_path", default: "", null: false
    t.string "preview_path", default: "", null: false
    t.bigint "file_size", default: 0, null: false, unsigned: true
    t.integer "preview_size", default: 0, null: false, unsigned: true
    t.string "agreement", limit: 1, default: "N", null: false
    t.integer "max_downloads", limit: 2, default: 0, null: false, unsigned: true
    t.integer "total_downloads", limit: 2, default: 0, null: false, unsigned: true
    t.string "activation_type", limit: 1, default: "M", null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["product_id"], name: "product_id"
  end

  create_table "product_filter_descriptions", primary_key: ["filter_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "filter_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "filter", default: "", null: false
  end

  create_table "product_filters", primary_key: "filter_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.text "categories_path"
    t.integer "company_id", default: 0, unsigned: true
    t.integer "feature_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "field_type", limit: 1, default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "round_to", limit: 8, default: "1", null: false
    t.integer "display_count", limit: 2, default: 10, null: false, unsigned: true
    t.string "display", limit: 1, default: "Y", null: false
    t.index ["company_id"], name: "company_id"
    t.index ["feature_id"], name: "feature_id"
  end

  create_table "product_global_option_links", primary_key: ["option_id", "product_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "option_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.boolean "enabled", default: true, null: false
    t.integer "quantity", default: 1, null: false
    t.index ["product_id"], name: "product_id"
  end

  create_table "product_option_variants", primary_key: "variant_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "option_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.decimal "modifier", precision: 13, scale: 3, default: "0.0", null: false
    t.string "modifier_type", limit: 1, default: "A", null: false
    t.decimal "weight_modifier", precision: 12, scale: 3, default: "0.0", null: false
    t.string "weight_modifier_type", limit: 1, default: "A", null: false
    t.decimal "point_modifier", precision: 12, scale: 3, default: "0.0", null: false
    t.string "point_modifier_type", limit: 1, default: "A", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "etsy_variant_id", unsigned: true
    t.index ["option_id", "status"], name: "option_id"
    t.index ["option_id", "variant_id"], name: "option_id_2"
    t.index ["position"], name: "position"
    t.index ["status"], name: "status"
  end

  create_table "product_option_variants_descriptions", primary_key: ["variant_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "variant_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "variant_name", default: "", null: false
    t.index ["variant_name"], name: "lsvariant_name"
  end

  create_table "product_options", primary_key: "option_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "option_type", limit: 1, default: "S", null: false
    t.string "inventory", limit: 1, default: "Y", null: false
    t.string "regexp", default: "", null: false
    t.string "required", limit: 1, default: "N", null: false
    t.string "multiupload", limit: 1, default: "N", null: false
    t.string "allowed_extensions", default: "", null: false
    t.bigint "max_file_size", default: 0, null: false, unsigned: true
    t.string "missing_variants_handling", limit: 1, default: "M", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "value", default: "", null: false
    t.string "google_export_name_option", default: "", null: false
    t.integer "etsy_prop_id", unsigned: true
    t.index ["position"], name: "position"
    t.index ["product_id", "status"], name: "c_status"
  end

  create_table "product_options_descriptions", primary_key: ["option_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "option_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "option_name", limit: 64, default: "", null: false
    t.string "internal_option_name", limit: 64, default: "", null: false
    t.string "option_text", default: "", null: false
    t.text "description", size: :medium
    t.string "comment", default: "", null: false
    t.string "inner_hint", default: "", null: false
    t.string "incorrect_message", default: "", null: false
  end

  create_table "product_options_exceptions", primary_key: "exception_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.text "combination"
    t.index ["product_id"], name: "product"
  end

  create_table "product_options_inventory", primary_key: "combination_hash", id: { type: :integer, default: 0, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "product_code", limit: 64, default: "", null: false
    t.string "combination", default: "", null: false
    t.integer "amount", limit: 3, default: 0, null: false
    t.string "temp", limit: 1, default: "N", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.index ["amount"], name: "idx_amount"
    t.index ["product_id", "combination"], name: "pc"
  end

  create_table "product_point_prices", primary_key: "point_price_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "point_price", default: 0, null: false, unsigned: true
    t.integer "lower_limit", limit: 2, default: 0, null: false, unsigned: true
    t.integer "usergroup_id", limit: 3, default: 0, null: false, unsigned: true
    t.index ["lower_limit", "usergroup_id", "product_id"], name: "unique_key", unique: true
    t.index ["product_id", "lower_limit", "usergroup_id"], name: "src_k"
  end

  create_table "product_popularity", primary_key: "product_id", id: { type: :integer, limit: 3, default: 0, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "viewed", default: 0, null: false
    t.integer "added", default: 0, null: false
    t.integer "deleted", default: 0, null: false
    t.integer "bought", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.index ["product_id", "total"], name: "total"
  end

  create_table "product_prices", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "percentage_discount", default: 0, null: false, unsigned: true
    t.integer "lower_limit", limit: 3, default: 0, null: false, unsigned: true
    t.integer "usergroup_id", limit: 3, default: 0, null: false, unsigned: true
    t.index ["lower_limit"], name: "lower_limit"
    t.index ["product_id", "usergroup_id", "lower_limit"], name: "usergroup", unique: true
    t.index ["product_id"], name: "product_id"
    t.index ["usergroup_id", "product_id"], name: "usergroup_id"
  end

  create_table "product_required_products", primary_key: ["product_id", "required_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "required_id", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "product_sales", primary_key: ["category_id", "product_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", limit: 3, default: 0, null: false, unsigned: true
    t.index ["product_id", "amount"], name: "pa"
  end

  create_table "product_subscriptions", primary_key: "subscription_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "email", limit: 128, default: "", null: false
    t.index ["product_id", "email"], name: "pe", unique: true
    t.index ["product_id", "user_id", "email"], name: "pd"
  end

  create_table "product_tabs", primary_key: "tab_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "tab_type", limit: 1, default: "B", null: false
    t.integer "block_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "template", default: "", null: false
    t.string "addon", limit: 32, default: "", null: false
    t.integer "position", default: 0, null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "is_primary", limit: 1, default: "N", null: false
    t.text "product_ids"
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "show_in_popup", limit: 1, default: "N", null: false
  end

  create_table "product_tabs_descriptions", primary_key: ["tab_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "tab_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", default: "", null: false
  end

  create_table "product_variation_data_identity_map", primary_key: ["table_id", "id", "parent_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "table_id", limit: 32, default: "", null: false
    t.string "id", limit: 64, default: "", null: false
    t.string "parent_id", limit: 64, default: "", null: false
    t.integer "product_id", limit: 3, null: false, unsigned: true
    t.index ["product_id"], name: "idx_product_id"
  end

  create_table "product_variation_group_features", primary_key: ["feature_id", "group_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "feature_id", limit: 3, null: false, unsigned: true
    t.string "purpose", limit: 32, null: false
    t.integer "group_id", limit: 3, null: false, unsigned: true
    t.index ["group_id"], name: "idx_group_id"
  end

  create_table "product_variation_group_products", primary_key: ["product_id", "group_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "product_id", limit: 3, null: false, unsigned: true
    t.integer "parent_product_id", limit: 3, null: false, unsigned: true
    t.integer "group_id", limit: 3, null: false, unsigned: true
    t.index ["group_id"], name: "idx_group_id"
    t.index ["parent_product_id"], name: "idx_parent_product_id"
  end

  create_table "product_variation_groups", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "code", limit: 128
    t.integer "created_at", default: 0, null: false, unsigned: true
    t.integer "updated_at", default: 0, null: false, unsigned: true
    t.index ["code"], name: "idx_group_code", unique: true
  end

  create_table "product_videos", primary_key: ["video_id", "product_id", "company_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "video_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.integer "product_id", default: 0, null: false, unsigned: true
    t.integer "company_id", null: false, unsigned: true
    t.string "comment"
    t.string "youtube_link", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "products", primary_key: "product_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "product_code", limit: 64, default: "", null: false
    t.string "product_type", limit: 1, default: "P", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.decimal "list_price", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "amount", limit: 3, default: 0, null: false
    t.decimal "weight", precision: 13, scale: 3, default: "0.0", null: false
    t.integer "length", limit: 3, default: 0, null: false, unsigned: true
    t.integer "width", limit: 3, default: 0, null: false, unsigned: true
    t.integer "height", limit: 3, default: 0, null: false, unsigned: true
    t.decimal "shipping_freight", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "low_avail_limit", limit: 3, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.integer "updated_timestamp", default: 0, null: false, unsigned: true
    t.string "usergroup_ids", default: "0", null: false
    t.string "is_edp", limit: 1, default: "N", null: false
    t.string "edp_shipping", limit: 1, default: "N", null: false
    t.string "unlimited_download", limit: 1, default: "N", null: false
    t.string "tracking", limit: 1, default: "B", null: false
    t.string "free_shipping", limit: 1, default: "N", null: false
    t.string "zero_price_action", limit: 1, default: "R", null: false
    t.string "is_pbp", limit: 1, default: "N", null: false
    t.string "is_op", limit: 1, default: "N", null: false
    t.string "is_oper", limit: 1, default: "N", null: false
    t.string "is_returnable", limit: 1, default: "Y", null: false
    t.integer "return_period", default: 10, null: false, unsigned: true
    t.integer "avail_since", default: 0, null: false, unsigned: true
    t.string "out_of_stock_actions", limit: 1, default: "N", null: false
    t.string "localization", default: "", null: false
    t.integer "min_qty", limit: 2, default: 0, null: false
    t.integer "max_qty", limit: 2, default: 0, null: false
    t.integer "qty_step", limit: 2, default: 0, null: false
    t.integer "list_qty_count", limit: 2, default: 0, null: false
    t.string "tax_ids", default: "", null: false
    t.string "age_verification", limit: 1, default: "N", null: false
    t.integer "age_limit", limit: 1, default: 0, null: false
    t.string "options_type", limit: 1, default: "P", null: false
    t.string "exceptions_type", limit: 1, default: "F", null: false
    t.string "details_layout", limit: 50, default: "", null: false
    t.string "shipping_params", default: "", null: false
    t.string "facebook_obj_type", limit: 64, null: false
    t.integer "parent_product_id", default: 0, null: false, unsigned: true
    t.integer "etsy_product_id", unsigned: true
    t.integer "etsy_listing_id", unsigned: true
    t.decimal "weight_lbs", precision: 13, scale: 3, default: "0.0", null: false
    t.decimal "weight_oz", precision: 13, scale: 3, default: "0.0", null: false
    t.string "product_tax_code", null: false
    t.index ["age_verification", "age_limit"], name: "age_verification"
    t.index ["amount"], name: "idx_amount"
    t.index ["company_id"], name: "idx_company_id"
    t.index ["parent_product_id"], name: "idx_parent_product_id"
    t.index ["status"], name: "status"
    t.index ["usergroup_ids"], name: "idx_usergroup_ids"
  end

  create_table "products_categories", primary_key: ["category_id", "product_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "category_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "link_type", limit: 1, default: "M", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.integer "category_position", limit: 2, default: 0, null: false, unsigned: true
    t.index ["link_type"], name: "link_type"
    t.index ["product_id", "link_type"], name: "pt"
  end

  create_table "profile_field_descriptions", primary_key: ["object_id", "object_type", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "description", default: "", null: false
    t.string "object_type", limit: 1, default: "F", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "profile_field_sections", primary_key: "section_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 1, null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.index ["code"], name: "code", unique: true
  end

  create_table "profile_field_values", primary_key: "value_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "field_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "profile_fields", primary_key: "field_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "field_name", limit: 32, default: "", null: false
    t.string "profile_show", limit: 1, default: "N"
    t.string "profile_required", limit: 1, default: "N"
    t.string "checkout_show", limit: 1, default: "N"
    t.string "checkout_required", limit: 1, default: "N"
    t.string "partner_show", limit: 1, default: "N"
    t.string "partner_required", limit: 1, default: "N"
    t.string "field_type", limit: 1, default: "I", null: false
    t.string "profile_type", limit: 1, default: "U", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "is_default", limit: 1, default: "N"
    t.string "section", limit: 1, default: "C"
    t.integer "matching_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "class", limit: 100, default: "", null: false
    t.string "wrapper_class", limit: 100, default: "", null: false
    t.string "autocomplete_type", limit: 100, default: "", null: false
    t.index ["checkout_show", "field_type"], name: "checkout_show"
    t.index ["field_name"], name: "field_name"
    t.index ["profile_show", "field_type"], name: "profile_show"
  end

  create_table "profile_fields_data", primary_key: ["object_id", "object_type", "field_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "object_type", limit: 1, default: "U", null: false
    t.integer "field_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "value", default: "0", null: false
  end

  create_table "promotion_descriptions", primary_key: ["promotion_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "promotion_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "name", default: "", null: false
    t.text "short_description"
    t.text "detailed_description", size: :medium
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "promotions", primary_key: "promotion_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.text "conditions"
    t.text "bonuses"
    t.integer "to_date", default: 0, null: false, unsigned: true
    t.integer "from_date", default: 0, null: false, unsigned: true
    t.integer "priority", limit: 3, default: 0, null: false, unsigned: true
    t.string "stop", limit: 1, default: "N", null: false
    t.column "zone", "enum('cart','catalog')", default: "catalog", null: false
    t.text "conditions_hash"
    t.string "status", limit: 1, default: "A", null: false
    t.integer "number_of_usages", limit: 3, default: 0, null: false
    t.text "users_conditions_hash"
  end

  create_table "quick_menu", primary_key: "menu_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, null: false, unsigned: true
    t.string "url", null: false
    t.integer "parent_id", limit: 3, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "reward_point_changes", primary_key: "change_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", default: 0, null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "action", limit: 1, default: "A", null: false
    t.text "reason"
  end

  create_table "reward_points", primary_key: "reward_point_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "usergroup_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", default: 0, null: false, unsigned: true
    t.string "amount_type", limit: 1, default: "A", null: false
    t.string "object_type", limit: 1, default: "P", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.index ["object_id", "usergroup_id", "object_type", "company_id"], name: "unique_key", unique: true
  end

  create_table "rma_properties", primary_key: "property_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "", null: false
    t.string "type", limit: 1, default: "R", null: false
    t.string "update_totals_and_inventory", limit: 1, default: "N", null: false
    t.index ["property_id", "status"], name: "c_status"
    t.index ["status", "type"], name: "status"
  end

  create_table "rma_property_descriptions", primary_key: ["property_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "property_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "property", default: "", null: false
  end

  create_table "rma_return_products", primary_key: ["return_id", "item_id", "type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "return_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "item_id", default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "reason", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", limit: 3, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "A", null: false
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.text "product_options"
    t.string "product", default: "", null: false
    t.index ["reason"], name: "reason"
  end

  create_table "rma_returns", primary_key: "return_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.integer "action", limit: 3, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "O", null: false
    t.integer "total_amount", limit: 3, default: 0, null: false, unsigned: true
    t.text "comment"
    t.text "extra"
    t.index ["order_id"], name: "order_id"
    t.index ["status"], name: "status"
    t.index ["timestamp"], name: "timestamp"
    t.index ["user_id"], name: "user_id"
  end

  create_table "robots_data", primary_key: "robots_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.text "data", null: false
  end

  create_table "sales_reports", primary_key: "report_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "name", default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "type", limit: 1, default: "", null: false
    t.string "period", limit: 2, default: "A", null: false
    t.integer "time_from", default: 0, null: false
    t.integer "time_to", default: 0, null: false
  end

  create_table "sales_reports_descriptions", primary_key: ["report_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "report_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "sales_reports_elements", primary_key: "element_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 66, default: "", null: false
    t.string "type", limit: 1, default: "O", null: false
    t.string "depend_on_it", limit: 1, default: "N", null: false
  end

  create_table "sales_reports_intervals", primary_key: "interval_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "value", default: 0, null: false, unsigned: true
    t.string "interval_code", limit: 64, default: "", null: false
  end

  create_table "sales_reports_table_conditions", primary_key: ["table_id", "code", "sub_element_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "table_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "code", limit: 64, default: "0", null: false
    t.string "sub_element_id", limit: 16, default: "0", null: false
  end

  create_table "sales_reports_table_descriptions", primary_key: ["table_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "table_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "sales_reports_table_element_conditions", primary_key: ["table_id", "element_hash", "ids"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "table_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "element_hash", limit: 32, default: "", null: false
    t.string "element_code", limit: 64, default: "", null: false
    t.string "ids", limit: 16, default: "", null: false
  end

  create_table "sales_reports_table_elements", primary_key: ["report_id", "table_id", "element_hash"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "report_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "table_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "element_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "element_hash", default: 0, null: false
    t.string "color", limit: 64, default: "blueviolet", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.string "dependence", limit: 64, default: "max_p", null: false
    t.integer "limit_auto", limit: 3, default: 5, null: false, unsigned: true
  end

  create_table "sales_reports_tables", primary_key: "table_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "report_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "T", null: false
    t.string "display", limit: 64, default: "order_amount", null: false
    t.integer "interval_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "auto", limit: 1, default: "Y", null: false
  end

  create_table "sd_taxjar_product_tax_code", primary_key: "product_tax_code", id: { type: :string, limit: 32 }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "description", null: false
  end

  create_table "se_queue", primary_key: "queue_id", id: { type: :integer, limit: 3 }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.text "data"
    t.string "action", limit: 32, default: "", null: false
    t.integer "company_id", default: 0, null: false
    t.string "lang_code", limit: 2, default: "en", null: false
    t.integer "started", default: 0, null: false
    t.integer "error_count", default: 0, null: false
    t.column "status", "enum('pending','processing')", default: "pending"
    t.index ["status"], name: "status"
  end

  create_table "se_settings", primary_key: ["name", "company_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 32, default: "", null: false
    t.integer "company_id", default: 0, null: false
    t.string "lang_code", limit: 2, default: "en", null: false
    t.string "value", default: "", null: false
  end

  create_table "search_key_words", primary_key: "key_word_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "key_word", default: "", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.integer "popularity", limit: 3, default: 0, null: false, unsigned: true
    t.integer "company_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "seo_names", primary_key: ["object_id", "type", "dispatch", "lang_code", "company_id"], charset: "utf8mb3", force: :cascade do |t|
    t.string "name", limit: 250, default: "", null: false
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "", null: false
    t.string "dispatch", limit: 64, default: "", null: false
    t.string "path", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["dispatch"], name: "dispatch"
    t.index ["name", "lang_code"], name: "name"
    t.index ["name", "type", "lang_code"], name: "type"
  end

  create_table "seo_redirects", primary_key: "redirect_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "src", default: "", null: false
    t.string "dest", default: "", null: false
    t.string "type", limit: 1, default: "s", null: false
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.index ["src", "company_id"], name: "src"
  end

  create_table "sessions", primary_key: "session_id", id: { type: :string, limit: 64, default: "" }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "expiry", default: 0, null: false, unsigned: true
    t.binary "data", size: :medium
    t.index ["expiry"], name: "expiry"
    t.index ["session_id", "expiry"], name: "src"
  end

  create_table "settings_descriptions", primary_key: ["object_id", "object_type", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.string "object_type", limit: 1, default: "O", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.text "value"
    t.text "tooltip"
  end

  create_table "settings_objects", primary_key: "object_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.column "edition_type", "set('NONE','ROOT','VENDOR','PRO:NONE','PRO:ROOT','MVE:NONE','MVE:ROOT','ULT:NONE','ULT:ROOT','ULT:VENDOR','ULT:VENDORONLY')", default: "ROOT", null: false
    t.string "name", limit: 128, default: "", null: false
    t.integer "section_id", null: false, unsigned: true
    t.integer "section_tab_id", null: false, unsigned: true
    t.string "type", limit: 1, default: "I", null: false
    t.text "value"
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "is_global", limit: 1, default: "Y", null: false
    t.string "handler", limit: 128, default: "", null: false
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.index ["is_global"], name: "is_global"
    t.index ["name"], name: "name"
    t.index ["position"], name: "position"
    t.index ["section_id", "section_tab_id"], name: "section_id"
  end

  create_table "settings_sections", primary_key: "section_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id", null: false, unsigned: true
    t.column "edition_type", "set('NONE','ROOT','VENDOR','PRO:NONE','PRO:ROOT','MVE:NONE','MVE:ROOT','ULT:NONE','ULT:ROOT','ULT:VENDOR','ULT:VENDORONLY')", default: "ROOT", null: false
    t.string "name", limit: 128, default: "", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.column "type", "enum('CORE','ADDON','TAB','SEPARATE_TAB')", default: "CORE", null: false
  end

  create_table "settings_variants", primary_key: "variant_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "name", limit: 64, default: "", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "settings_vendor_values", primary_key: ["object_id", "company_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", limit: 3, null: false, unsigned: true
    t.integer "company_id", null: false, unsigned: true
    t.text "value"
  end

  create_table "shipment_items", primary_key: ["item_id", "shipment_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "item_id", null: false, unsigned: true
    t.integer "shipment_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", default: 0, null: false, unsigned: true
    t.index ["shipment_id"], name: "shipment_id"
  end

  create_table "shipments", primary_key: "shipment_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "shipping_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "tracking_number", default: "", null: false
    t.string "carrier", default: "", null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.text "comments", size: :medium
    t.string "status", limit: 1, default: "P", null: false
    t.string "shippo_rate_id", limit: 250
    t.string "shippo_price", limit: 99
    t.string "shippo_status", limit: 100
    t.string "shippo_trans_id", limit: 100
    t.text "shippo_response", size: :long
    t.string "shippo_provider", limit: 100
    t.string "shippo_service_type", limit: 100
    t.index ["status"], name: "status"
  end

  create_table "shipping_descriptions", primary_key: ["shipping_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "shipping_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "shipping", default: "", null: false
    t.string "delivery_time", limit: 64, default: "", null: false
    t.text "description", size: :medium
  end

  create_table "shipping_rates", primary_key: "rate_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "shipping_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "destination_id", limit: 3, default: 0, null: false, unsigned: true
    t.text "rate_value"
    t.index ["shipping_id", "destination_id"], name: "shipping_rate", unique: true
  end

  create_table "shipping_service_descriptions", primary_key: ["service_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "service_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.string "description", default: "", null: false
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "shipping_services", primary_key: "service_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "module", limit: 32, default: "", null: false
    t.string "code", limit: 64, default: "", null: false
    t.string "sp_file", limit: 32, default: "", null: false
    t.index ["service_id", "status"], name: "sa"
  end

  create_table "shipping_time_descriptions", primary_key: ["shipping_id", "destination_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "shipping_id", default: 0, null: false, unsigned: true
    t.integer "destination_id", default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "delivery_time", limit: 128, default: "", null: false
  end

  create_table "shippings", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "shipping_id", limit: 3, null: false, unsigned: true, auto_increment: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "destination", limit: 1, default: "I", null: false
    t.decimal "min_weight", precision: 13, scale: 3, default: "0.0", null: false
    t.decimal "max_weight", precision: 13, scale: 3, default: "0.0", null: false
    t.string "usergroup_ids", default: "0", null: false
    t.string "rate_calculation", limit: 1, default: "M", null: false
    t.integer "service_id", limit: 3, default: 0, null: false, unsigned: true
    t.text "service_params"
    t.string "localization", default: "", null: false
    t.string "tax_ids", default: "", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "D", null: false
    t.string "free_shipping", limit: 1, default: "N", null: false
    t.string "is_address_required", limit: 1, default: "Y", null: false
    t.index ["localization"], name: "localization"
    t.index ["position"], name: "position"
    t.index ["shipping_id"], name: "shipping_id", unique: true
    t.index ["usergroup_ids", "min_weight", "max_weight", "status"], name: "c_status"
  end

  create_table "sitemap_links", primary_key: "link_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "link_href", default: "", null: false
    t.integer "section_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "A", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.string "link_type", default: "", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
  end

  create_table "sitemap_sections", primary_key: "section_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "section_type", default: "1", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
  end

  create_table "ss_permission_tabs_records", primary_key: "ss_permission_tabs_records_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "company_id", limit: 3, default: 0, comment: "storefront"
    t.string "part", limit: 50, null: false, comment: "czesc sklepu np. produkty, zamówienia"
    t.string "tab", limit: 50, null: false, comment: "zakladka w okreslonej czesci sklepu"
    t.string "tab_owner", limit: 100, null: false, comment: "nietypowy tab"
    t.string "content", limit: 50, null: false, comment: "blokada określonej cześci strony"
    t.integer "user_id", null: false, comment: "user_id"
    t.integer "vendor_usergroup_id", default: 0, null: false, comment: "vendor_usergroup_id"
    t.column "access", "enum('Y','N')", null: false, comment: "jest dostęp czy nie"
    t.string "status", limit: 1, null: false
    t.index ["content", "company_id", "part", "tab", "tab_owner", "user_id", "access"], name: "Unikalny", unique: true
  end

  create_table "ss_permission_tabs_records_descriptions", primary_key: ["ss_permission_tabs_records_id", "lang_code"], charset: "utf8mb3", collation: "utf8mb3_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "ss_permission_tabs_records_id", limit: 3, null: false, unsigned: true
    t.string "name", limit: 100, null: false, comment: "nazwa rekordu"
    t.string "lang_code", limit: 2, null: false
  end

  create_table "ss_product_shippings", primary_key: ["object_id", "company_id", "object_type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "object_id", null: false, comment: "object id"
    t.text "shippings", null: false, comment: "available shippings"
    t.integer "company_id", null: false, comment: "company id"
    t.string "object_type", limit: 1, null: false, comment: "C - category, P - product"
    t.string "settings", limit: 1, default: "N", null: false, comment: "individual settings for product"
  end

  create_table "ss_product_shippings_log", primary_key: "ss_product_shippings_log_id", id: :integer, charset: "utf8mb3", comment: "tabela logow ss_product_shippings", force: :cascade do |t|
    t.timestamp "date_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "method", limit: 50, null: false, comment: "metoda"
    t.text "info", size: :long, null: false, comment: "komunikat lub serializowane dane"
    t.integer "company_id", default: 1, null: false, comment: "id sklepu lub sprzedawcy", unsigned: true
  end

  create_table "ss_promotion_simple_promotions", primary_key: "ss_promotion_simple_promotions_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", collation: "utf8mb3_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "company_id", limit: 3, comment: "storefront"
    t.string "type", limit: 50, null: false, comment: "typ"
    t.string "selected_value", null: false, comment: "usuwana wartość"
    t.text "operators", null: false, comment: "operator"
    t.text "discount_bonuses", null: false, comment: "ograniczenia na bonusy"
    t.text "user_ids", null: false, comment: "admini których dotyczy ograniczenie"
    t.string "status", limit: 1, null: false
  end

  create_table "ss_promotion_simple_promotions_descriptions", primary_key: ["ss_promotion_simple_promotions_id", "lang_code"], charset: "utf8mb3", collation: "utf8mb3_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "ss_promotion_simple_promotions_id", limit: 3, null: false, unsigned: true
    t.string "name", limit: 100, null: false, comment: "nazwa rekordu"
    t.string "lang_code", limit: 2, null: false
  end

  create_table "ss_vendor_categories", primary_key: "category_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "id_path", default: "", null: false
    t.integer "level", default: 1, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "usergroup_ids", default: "0", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "product_count", limit: 3, default: 0, null: false, unsigned: true
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "is_op", limit: 1, default: "N", null: false
    t.string "localization", default: "", null: false
    t.string "age_verification", limit: 1, default: "N", null: false
    t.integer "age_limit", limit: 1, default: 0, null: false
    t.string "parent_age_verification", limit: 1, default: "N", null: false
    t.integer "parent_age_limit", limit: 1, default: 0, null: false
    t.text "selected_views"
    t.string "default_view", limit: 50, default: "", null: false
    t.string "product_details_view", limit: 50, default: "", null: false
    t.integer "product_columns", limit: 1, default: 0, null: false, unsigned: true
    t.string "is_trash", limit: 1, default: "N", null: false
    t.string "category_type", limit: 1, default: "C", null: false
    t.string "ss_vendor_categories", limit: 1, default: "N"
    t.index ["age_verification", "age_limit"], name: "age_verification"
    t.index ["category_id", "usergroup_ids", "status"], name: "p_category_id"
    t.index ["id_path"], name: "id_path"
    t.index ["localization"], name: "localization"
    t.index ["parent_age_verification", "parent_age_limit"], name: "parent_age_verification"
    t.index ["parent_id"], name: "parent"
    t.index ["position"], name: "position"
    t.index ["usergroup_ids", "status", "parent_id"], name: "c_status"
  end

  create_table "ss_vendor_category_descriptions", primary_key: ["category_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "category", default: "", null: false
    t.text "description", size: :medium
    t.string "meta_keywords", default: "", null: false
    t.string "meta_description", default: "", null: false
    t.string "page_title", default: "", null: false
    t.text "age_warning_message"
    t.string "mega_m_category_banner_url", default: "", null: false
    t.text "mega_m_category_svg_icon", null: false
  end

  create_table "state_descriptions", primary_key: ["state_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "state_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "state", default: "", null: false
  end

  create_table "states", primary_key: "state_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "country_code", limit: 2, default: "", null: false
    t.string "code", limit: 32, default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.index ["code"], name: "code"
    t.index ["country_code", "code"], name: "cs", unique: true
    t.index ["country_code"], name: "country_code"
  end

  create_table "static_data", primary_key: "param_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "param", default: "", null: false
    t.string "param_2", default: "", null: false
    t.string "param_3", default: "", null: false
    t.string "param_4", default: "", null: false
    t.string "param_5", default: "", null: false
    t.string "class", limit: 128, default: "", null: false
    t.string "section", limit: 1, default: "", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.integer "parent_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "id_path", default: "", null: false
    t.string "localization", default: "", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.string "content_type_l1", limit: 10, default: "", null: false
    t.string "drop_down_type", limit: 10, default: "", null: false
    t.string "content_type", limit: 10, default: "", null: false
    t.string "float_right", limit: 1, default: "", null: false
    t.string "full_tree_number_categories", default: "7", null: false
    t.text "wysiwyg", null: false
    t.text "smarty", null: false
    t.text "svg_icon", null: false
    t.index ["position"], name: "position"
    t.index ["section", "status", "localization"], name: "section"
  end

  create_table "static_data_descriptions", primary_key: ["param_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "param_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "descr", default: "", null: false
  end

  create_table "status_data", primary_key: ["status_id", "param"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "status_id", limit: 3, null: false, unsigned: true
    t.string "param", default: "", null: false
    t.string "value", default: "Y", null: false
    t.index ["value"], name: "inventory"
  end

  create_table "status_descriptions", primary_key: ["status_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "status_id", limit: 3, null: false, unsigned: true
    t.string "description", default: "", null: false
    t.string "email_subj", default: "", null: false
    t.text "email_header"
    t.string "lang_code", limit: 2, default: "", null: false
  end

  create_table "statuses", primary_key: "status_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "", null: false
    t.string "type", limit: 1, default: "O", null: false
    t.string "is_default", limit: 1, default: "N", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.index ["position"], name: "position"
    t.index ["status", "type"], name: "status", unique: true
  end

  create_table "storage_data", primary_key: "data_key", id: :string, default: "", charset: "utf8mb3", force: :cascade do |t|
    t.binary "data", size: :medium
  end

  create_table "stored_sessions", primary_key: "session_id", id: { type: :string, limit: 64 }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "expiry", null: false, unsigned: true
    t.binary "data"
    t.index ["expiry"], name: "expiry"
  end

  create_table "storefronts", primary_key: "storefront_id", id: { type: :integer, comment: "Storefront ID" }, charset: "utf8mb3", force: :cascade do |t|
    t.string "url", limit: 256, default: "", null: false, comment: "Storefront URL (host + path)"
    t.string "redirect_customer", limit: 1, default: "N", null: false, comment: "Whether customers must be redirected from the storefront to a storefront with proper assigned countries"
    t.string "is_default", limit: 1, default: "N", null: false, comment: "Whether a storefront is the default one. Default storefront cannot be deleted"
    t.string "status", limit: 1, default: "N", null: false, comment: "Storefront status: N - open, Y - closed"
    t.string "access_key", limit: 128, default: "", null: false, comment: "Secret key to access closed storefront"
    t.string "name", default: "", null: false, comment: "Storefront name"
    t.string "theme_name", limit: 128, default: "", null: false, comment: "Theme that the storefront uses"
    t.string "is_accessible_for_authorized_customers_only", limit: 1, default: "N", null: false
  end

  create_table "storefronts_companies", primary_key: ["storefront_id", "company_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_countries", primary_key: ["storefront_id", "country_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.string "country_code", limit: 2, default: "", null: false
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_currencies", primary_key: ["storefront_id", "currency_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "currency_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_languages", primary_key: ["storefront_id", "language_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "language_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_payments", primary_key: ["storefront_id", "payment_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "payment_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_promotions", primary_key: ["storefront_id", "promotion_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "promotion_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "storefronts_shippings", primary_key: ["storefront_id", "shipping_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.integer "shipping_id", default: 0, null: false, unsigned: true
    t.index ["storefront_id"], name: "idx_storefront_id"
  end

  create_table "sync_data_settings", primary_key: ["provider_id", "company_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "provider_id", limit: 128, default: "", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.text "settings_data", null: false
  end

  create_table "tax_descriptions", primary_key: ["tax_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "tax_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "tax", default: "", null: false
  end

  create_table "tax_rates", primary_key: "rate_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "tax_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "destination_id", limit: 3, default: 0, null: false, unsigned: true
    t.decimal "rate_value", precision: 13, scale: 3, default: "0.0", null: false
    t.string "rate_type", limit: 1, default: "", null: false
    t.index ["tax_id", "destination_id"], name: "tax_rate", unique: true
  end

  create_table "taxes", primary_key: "tax_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "address_type", limit: 1, default: "S", null: false
    t.string "status", limit: 1, default: "D", null: false
    t.string "price_includes_tax", limit: 1, default: "N", null: false
    t.string "display_including_tax", limit: 1, default: "N", null: false
    t.string "display_info", limit: 1, default: "", null: false
    t.string "regnumber", default: "", null: false
    t.integer "priority", limit: 3, default: 0, null: false, unsigned: true
    t.index ["status"], name: "c_status"
  end

  create_table "template_documents", primary_key: "document_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.text "template"
    t.text "default_template"
    t.string "type", limit: 32, default: "", null: false
    t.string "code", limit: 128, default: "", null: false
    t.string "addon", limit: 32, default: "", null: false
    t.integer "updated", default: 0, null: false, unsigned: true
    t.integer "created", default: 0, null: false, unsigned: true
    t.index ["code", "type"], name: "code", unique: true
  end

  create_table "template_emails", primary_key: "template_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "area", limit: 1, default: "C", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.text "subject"
    t.text "template"
    t.text "default_subject"
    t.text "default_template"
    t.text "params_schema"
    t.text "params"
    t.string "addon", limit: 32, default: "", null: false
    t.integer "updated", default: 0, null: false, unsigned: true
    t.integer "created", default: 0, null: false, unsigned: true
    t.index ["code", "area"], name: "template", unique: true
  end

  create_table "template_internal_notifications", primary_key: "template_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "area", limit: 1, default: "C", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.text "subject"
    t.text "template"
    t.text "default_subject"
    t.text "default_template"
    t.text "params_schema"
    t.text "params"
    t.string "addon", limit: 32, default: "", null: false
    t.integer "updated", default: 0, null: false, unsigned: true
    t.integer "created", default: 0, null: false, unsigned: true
    t.index ["code", "area"], name: "template", unique: true
  end

  create_table "template_snippet_descriptions", primary_key: ["snippet_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "snippet_id", null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", default: "", null: false
  end

  create_table "template_snippets", primary_key: "snippet_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 128, default: "", null: false
    t.string "type", limit: 32, default: "", null: false
    t.text "template"
    t.text "default_template"
    t.string "status", limit: 1, default: "", null: false
    t.text "params"
    t.text "handler"
    t.string "addon", limit: 32, default: "", null: false
    t.integer "updated", default: 0, null: false, unsigned: true
    t.integer "created", default: 0, null: false, unsigned: true
    t.index ["code", "type"], name: "code", unique: true
  end

  create_table "template_table_column_descriptions", primary_key: ["column_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "column_id", null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "name", default: "", null: false
  end

  create_table "template_table_columns", primary_key: "column_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "code", limit: 128
    t.string "snippet_code", limit: 128, default: "", null: false
    t.string "snippet_type", limit: 32, default: "", null: false
    t.string "status", limit: 1, default: "", null: false
    t.integer "position", limit: 2, default: 0, null: false, unsigned: true
    t.text "template"
    t.text "default_template"
    t.string "addon", limit: 32, default: "", null: false
    t.index ["snippet_code", "snippet_type"], name: "snippet_idx"
  end

  create_table "user_data", primary_key: ["user_id", "type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "", null: false
    t.text "data"
  end

  create_table "user_profiles", primary_key: "profile_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "profile_type", limit: 1, default: "P", null: false
    t.string "b_firstname", limit: 128, default: "", null: false
    t.string "b_lastname", limit: 128, default: "", null: false
    t.string "b_address", default: "", null: false
    t.string "b_address_2", default: "", null: false
    t.string "b_city", limit: 64, default: "", null: false
    t.string "b_county", limit: 32, default: "", null: false
    t.string "b_state", limit: 32, default: "", null: false
    t.string "b_country", limit: 2, default: "", null: false
    t.string "b_zipcode", limit: 16, default: "", null: false
    t.string "b_phone", limit: 128, default: "", null: false
    t.string "s_firstname", limit: 128, default: "", null: false
    t.string "s_lastname", limit: 128, default: "", null: false
    t.string "s_address", default: "", null: false
    t.string "s_address_2", default: "", null: false
    t.string "s_city", default: "", null: false
    t.string "s_county", limit: 32, default: "", null: false
    t.string "s_state", limit: 32, default: "", null: false
    t.string "s_country", limit: 2, default: "", null: false
    t.string "s_zipcode", limit: 16, default: "", null: false
    t.string "s_phone", limit: 128, default: "", null: false
    t.string "s_address_type", default: "", null: false
    t.string "profile_name", limit: 32, default: "", null: false
    t.integer "profile_update_timestamp", default: 0, null: false, unsigned: true
    t.index ["profile_type"], name: "profile_type"
    t.index ["user_id", "profile_type"], name: "uid_p"
  end

  create_table "user_session_products", primary_key: ["user_id", "type", "item_id", "user_type"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "type", limit: 1, default: "C", null: false
    t.string "user_type", limit: 1, default: "R", null: false
    t.integer "item_id", default: 0, null: false, unsigned: true
    t.string "item_type", limit: 1, default: "P", null: false
    t.integer "product_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", limit: 3, default: 1, null: false, unsigned: true
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.binary "extra"
    t.string "session_id", limit: 64, default: "", null: false
    t.binary "ip_address", limit: 40, default: "", null: false
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.index ["session_id"], name: "session_id"
    t.index ["timestamp", "user_type"], name: "timestamp"
    t.index ["type"], name: "type"
  end

  create_table "usergroup_descriptions", primary_key: ["usergroup_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "usergroup_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "usergroup", default: "", null: false
  end

  create_table "usergroup_links", primary_key: "link_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", limit: 3, null: false, unsigned: true
    t.integer "usergroup_id", limit: 3, null: false, unsigned: true
    t.string "status", limit: 1, default: "D", null: false
    t.index ["user_id", "usergroup_id"], name: "user_id", unique: true
  end

  create_table "usergroup_privileges", primary_key: ["usergroup_id", "privilege"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "usergroup_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "privilege", limit: 32, default: "", null: false
  end

  create_table "usergroups", primary_key: "usergroup_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "", null: false
    t.string "type", limit: 1, default: "C", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.index ["status", "type"], name: "status"
    t.index ["usergroup_id", "status"], name: "c_status"
  end

  create_table "users", primary_key: "user_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.string "user_type", limit: 1, default: "C", null: false
    t.string "user_login", default: "", null: false
    t.string "referer", default: "", null: false
    t.string "is_root", limit: 1, default: "N", null: false
    t.integer "company_id", default: 0, null: false, unsigned: true
    t.integer "last_login", default: 0, null: false, unsigned: true
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.string "password", limit: 32, default: "", null: false
    t.string "salt", limit: 10, default: "", null: false
    t.string "firstname", limit: 128, default: "", null: false
    t.string "lastname", limit: 128, default: "", null: false
    t.string "company", default: "", null: false
    t.string "email", limit: 128, default: "", null: false
    t.string "phone", limit: 128, default: "", null: false
    t.string "fax", limit: 128, default: "", null: false
    t.string "url", limit: 128, default: "", null: false
    t.string "tax_exempt", limit: 1, default: "N", null: false
    t.string "lang_code", limit: 2, default: "", null: false
    t.integer "birthday", default: 0, null: false
    t.integer "purchase_timestamp_from", default: 0, null: false
    t.integer "purchase_timestamp_to", default: 0, null: false
    t.string "responsible_email", limit: 80, default: "", null: false
    t.string "last_passwords", default: "", null: false
    t.integer "password_change_timestamp", default: 0, null: false, unsigned: true
    t.string "api_key", default: "", null: false
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.string "last_sign_in_ip"
    t.string "current_sign_in_ip"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens", default: -> { "(json_object())" }, null: false
    t.boolean "is_maker_circle_premium", default: false, null: false
    t.index ["email"], name: "idx_email"
    t.index ["firstname", "lastname"], name: "uname"
    t.index ["user_login"], name: "user_login"
  end

  create_table "vendor_communication_messages", primary_key: "message_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "thread_id", null: false, unsigned: true
    t.integer "user_id", limit: 3, null: false, unsigned: true
    t.string "user_type", limit: 1, null: false
    t.integer "timestamp", default: 0, null: false, unsigned: true
    t.text "message"
    t.integer "attachment_id", limit: 3, null: false
    t.index ["thread_id"], name: "idx_thread_id"
  end

  create_table "vendor_communications", primary_key: "thread_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "storefront_id", default: 0, null: false, unsigned: true
    t.string "status", limit: 1, default: "N", null: false
    t.integer "user_id", limit: 3, null: false, unsigned: true
    t.integer "company_id", null: false, unsigned: true
    t.integer "object_id", default: 0, unsigned: true
    t.string "object_type", limit: 1, default: ""
    t.integer "created_at", default: 0, null: false, unsigned: true
    t.string "last_message", default: ""
    t.integer "last_message_user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "last_message_user_type", limit: 1, default: "", null: false
    t.integer "last_updated", default: 0, null: false, unsigned: true
    t.index ["company_id"], name: "idx_company_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "vendor_following", primary_key: ["user_id", "vendor_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vendor_id", null: false
    t.integer "is_selected", default: 0, null: false
    t.integer "followed_on", null: false
  end

  create_table "vendor_following_digest", id: false, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "object_id", limit: 3, null: false, unsigned: true
    t.integer "last_cron_date", default: 0, unsigned: true
  end

  create_table "vendor_following_events", primary_key: "event_id", id: { type: :integer, default: 0, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "is_selected", default: 0, null: false
    t.string "lang_var", default: "", null: false
  end

  create_table "vendor_following_news", primary_key: "news_id", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "event_id", null: false
    t.integer "product_id", null: false
    t.text "url", null: false
    t.string "lang_var", default: "", null: false
    t.integer "published_on", null: false
    t.column "is_product_active", "enum('Y','N')", default: "Y", null: false
  end

  create_table "vendor_invitations", primary_key: "invitation_key", id: { type: :string, limit: 32 }, charset: "utf8mb3", force: :cascade do |t|
    t.string "email", limit: 128, null: false
    t.integer "invited_at", null: false, unsigned: true
  end

  create_table "vendor_locations", primary_key: "company_id", id: :integer, default: 0, charset: "utf8mb3", force: :cascade do |t|
    t.string "place_id", limit: 512, default: "", null: false
    t.float "lat", null: false
    t.float "lng", null: false
    t.string "country", limit: 32, default: "", null: false
    t.string "state", limit: 64, default: "", null: false
    t.string "locality", limit: 64, default: "", null: false
    t.string "route", default: "", null: false
    t.string "postal_code", limit: 16, default: "", null: false
    t.string "street_number", limit: 16, default: "", null: false
    t.text "formatted_address"
    t.index ["locality", "country"], name: "locality_country_idx"
  end

  create_table "vendor_payouts", primary_key: "payout_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", null: false, unsigned: true
    t.integer "order_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "payout_date", default: 0, null: false, unsigned: true
    t.integer "start_date", default: 0, null: false, comment: "deprecated", unsigned: true
    t.integer "end_date", default: 0, null: false, comment: "deprecated", unsigned: true
    t.decimal "payout_amount", precision: 12, scale: 2, default: "0.0", null: false, comment: "payout_amount - for payouts and withdrawals"
    t.decimal "order_amount", precision: 12, scale: 2, default: "0.0", null: false, comment: "order amount - for order placement, changes and refunds"
    t.string "payment_method", default: "", null: false, comment: "deprecated"
    t.text "comments"
    t.string "payout_type", limit: 64, default: "other", null: false, comment: "affects income and balance calculations"
    t.string "approval_status", limit: 1, default: "P", null: false, comment: "affects admin balance calculation"
    t.integer "plan_id", unsigned: true
    t.binary "extra", size: :medium
    t.decimal "commission_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "commission", precision: 12, scale: 2, default: "0.0", null: false
    t.string "commission_type", limit: 1, default: "A", null: false
    t.decimal "marketplace_profit", precision: 12, scale: 2, default: "0.0", null: false
    t.index ["company_id"], name: "company_id"
  end

  create_table "vendor_plan_descriptions", primary_key: ["plan_id", "lang_code"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "plan_id", default: 0, null: false, unsigned: true
    t.string "lang_code", limit: 2, default: "", null: false
    t.string "plan", default: "", null: false
    t.text "description"
    t.string "chargebee_plan", null: false
    t.index ["chargebee_plan"], name: "index_vendor_plan_descriptions_on_chargebee_plan", unique: true
  end

  create_table "vendor_plans", primary_key: "plan_id", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "status", limit: 1, default: "A", null: false
    t.integer "position", limit: 2, default: 0, null: false
    t.boolean "is_default", default: false, null: false
    t.decimal "price", precision: 12, scale: 2, default: "0.0", null: false
    t.column "periodicity", "enum('month','year','onetime')", default: "month", null: false
    t.decimal "commission", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "fixed_commission", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "products_limit", default: 0, null: false
    t.decimal "revenue_limit", precision: 12, scale: 2, default: "0.0", null: false
    t.boolean "vendor_store", default: false, null: false
    t.text "categories"
    t.text "storefronts"
    t.integer "allowed_vendor_subdomain", null: false
    t.string "ss_prom_vendor_promotions_allowed", limit: 1, default: "Y", null: false, comment: "czy plan sprzedawcy umożliwia vendorowi tworzenie promocji"
    t.integer "ss_prom_vendor_promotions_priority", comment: "priorytet promocji tworzonych przez sprzedawców w tym planem"
    t.string "ga_vendors_tracking", limit: 1, default: "N", null: false
    t.index ["position", "status"], name: "position"
  end

  create_table "vendor_styles", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", null: false, comment: "Company ID of the vendor who uses custom style", unsigned: true
    t.integer "layout_id", null: false, comment: "Layout of the theme", unsigned: true
    t.string "style_id", limit: 64, null: false, comment: "Style name"
    t.index ["company_id", "layout_id"], name: "company_id_layout_id", unique: true
  end

  create_table "views", primary_key: "view_id", id: { type: :integer, limit: 3, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "object", limit: 24, default: "", null: false
    t.string "name", limit: 32, default: "", null: false
    t.text "params"
    t.text "view_results"
    t.integer "user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "active", limit: 1, default: "N", null: false
    t.index ["user_id", "object"], name: "idx_user_id_object"
  end

  create_table "wk_etsy_account_list", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "etsy_api_key", null: false
    t.string "shared_secret_key", limit: 250, null: false
    t.string "oauth_token", limit: 250, null: false
    t.string "oauth_token_secret", limit: 250, null: false
    t.integer "company_id", null: false
    t.string "shop_id", null: false
    t.integer "user_id", null: false
    t.string "status", limit: 1, default: "A", null: false
    t.string "currency_code", limit: 4, default: "", null: false
    t.string "is_quantity_update", limit: 1, default: "N", null: false
    t.string "is_full_product_update", limit: 1, default: "N", null: false
    t.string "is_export_product_update", limit: 1, default: "N", null: false
    t.string "is_import_product_update", limit: 1, default: "N", null: false
    t.string "default_is_supply", limit: 1, default: "N", null: false
    t.string "default_when_made", limit: 25, default: "made_to_order", null: false
    t.string "default_who_made", limit: 25, default: "i_did", null: false
    t.string "default_listing_state", limit: 10, default: "draft", null: false
    t.integer "default_cscart_category_id", default: 0, null: false
    t.integer "default_etsy_category_id", default: 0, null: false
    t.bigint "default_shipping_template_id", default: 0, null: false
    t.integer "timestamp", null: false
    t.index ["company_id", "shop_id"], name: "company_id", unique: true
  end

  create_table "wk_etsy_category_map", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "etsy_category_id", null: false
    t.string "etsy_category", null: false
    t.integer "account_id", null: false
  end

  create_table "wk_etsy_countries", primary_key: "country_id", id: :integer, default: nil, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "iso_country_code", limit: 2, null: false
    t.string "world_bank_country_code", limit: 3, null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.decimal "lat", precision: 10, scale: 2
    t.decimal "lon", precision: 10, scale: 2
  end

  create_table "wk_etsy_product_export_raw", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "product_id", null: false
    t.text "data"
    t.index ["product_id"], name: "product_id", unique: true
  end

  create_table "wk_etsy_product_map", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "account_id", null: false
    t.bigint "product_id", null: false
    t.bigint "listing_id", null: false
    t.string "action", limit: 1, default: "I", null: false
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.integer "amount", default: 0
    t.integer "category_id", default: 0
    t.string "who_made", limit: 20, default: "i_did"
    t.string "when_made", limit: 20, default: "made_to_order"
    t.string "is_supply", limit: 5
    t.string "recipient", limit: 25
    t.string "occasion", limit: 25
    t.bigint "shipping_template_id"
    t.text "listing_data", null: false
    t.string "map", limit: 1, default: "Y", null: false
    t.string "state", limit: 15, default: "active", null: false
    t.index ["product_id", "listing_id"], name: "product_id", unique: true
  end

  create_table "wk_etsy_product_variation_map", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "account_id", null: false
    t.bigint "product_id", null: false
    t.bigint "parent_product_id", null: false
    t.bigint "etsy_product_id", null: false
    t.bigint "listing_id", null: false
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.integer "amount", default: 0
    t.text "inventory_data", null: false
    t.index ["product_id"], name: "product_id", unique: true
  end

  create_table "wk_etsy_seller_categories", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "account_id", null: false
    t.text "categories", size: :long
    t.index ["account_id"], name: "account_id", unique: true
  end

  create_table "wk_etsy_shipping_template_entries", id: false, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "shipping_template_id", null: false
    t.bigint "shipping_template_entry_id", null: false
    t.integer "destination_country_id", default: 0
    t.integer "destination_region_id", default: 0
    t.integer "origin_country_id", default: 0
    t.decimal "primary_cost", precision: 10, scale: 2, null: false
    t.decimal "secondary_cost", precision: 10, scale: 2, null: false
    t.string "currency_code", limit: 4, null: false
    t.index ["shipping_template_id", "shipping_template_entry_id"], name: "shipping_template_id", unique: true
  end

  create_table "wk_etsy_shipping_templates", id: false, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "shipping_template_id", null: false
    t.integer "account_id", null: false
    t.integer "user_id", null: false
    t.string "title", null: false
    t.integer "min_processing_days", null: false
    t.integer "max_processing_days", null: false
    t.integer "origin_country_id", null: false
    t.string "processing_days_display_label", null: false
    t.index ["shipping_template_id", "account_id"], name: "shipping_template_id", unique: true
  end

  create_table "wk_etsy_shop", primary_key: ["account_id", "shop_id"], charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "shop_id", null: false
    t.string "shop_name", null: false
    t.string "title", null: false
    t.string "banner_image", null: false
    t.text "announcement", null: false
    t.text "sale_message", null: false
    t.text "digital_sale_message", null: false
    t.text "policy_welcome", null: false
    t.text "policy_payment", null: false
    t.text "policy_shipping", null: false
    t.text "policy_refunds", null: false
    t.text "policy_additional", null: false
    t.text "policy_seller_info", null: false
    t.string "curreny_code", limit: 15, null: false
    t.string "url", null: false
    t.integer "timestamp", null: false
  end

  create_table "wk_seller_vacations", primary_key: "req_id", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "from", null: false
    t.integer "to", null: false
    t.string "add_to_cart", limit: 1, default: "Y", null: false
    t.string "display_return_date", limit: 1, default: "Y", null: false
    t.string "status", limit: 1, default: "D", null: false
    t.integer "vendor_remind", default: 0, null: false
    t.integer "vendor_remind_time", default: 0, null: false
  end

  create_table "wk_seller_vacations_description", id: :integer, charset: "utf8mb3", force: :cascade do |t|
    t.integer "req_id", null: false
    t.string "for_admin", limit: 500
    t.string "for_store", limit: 500
    t.string "lang_code", limit: 10
  end

  create_table "wk_vendor_subdomain", id: :integer, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "subdomain", limit: 100, null: false
    t.string "status", limit: 1, default: "D", null: false
    t.index ["company_id"], name: "company", unique: true
  end

  add_foreign_key "customer_referrals", "customers", column: "referred_by_id"
end
