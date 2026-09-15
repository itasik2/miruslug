'use client';

import { FormEvent, useEffect, useMemo, useState } from 'react';

const OLD_ASSET =
  'https://raw.githubusercontent.com/itasik2/miruslug/main/sources/miruslug/assets/templates/serv/images';

const cities = ['Павлодар', 'Усть-Каменогорск'];

const services = [
  { title: 'Ремонт компьютеров и ноутбуков', icon: '💻', text: 'Диагностика, настройка, ремонт и помощь на дому.' },
  { title: 'Бытовая техника', icon: '🧺', text: 'Ремонт и установка техники дома и в офисе.' },
  { title: 'Мастер на час', icon: '🛠️', text: 'Сантехник, электрик, плотник и мелкий бытовой ремонт.' },
  { title: 'Ремонт помещений', icon: '🏠', text: 'Отделочные работы, покраска, укладка и монтаж.' },
  { title: 'Грузоперевозки', icon: '🚚', text: 'Перевозки, грузчики и помощь при переезде.' },
  { title: 'Курьер и доставка', icon: '📦', text: 'Документы, посылки и срочная городская доставка.' },
  { title: 'Уборка помещений', icon: '🧹', text: 'Дом, квартира, офис и уборка после ремонта.' },
  { title: 'Фото и оформление', icon: '📷', text: 'Фотографы, дизайнеры и оформление мероприятий.' },
  { title: 'Исполнитель поручений', icon: '✅', text: 'Помощь с повседневными задачами и разовыми делами.' },
  { title: 'Выездной автосервис', icon: '🚗', text: 'Помощь с автомобилем на месте и в дороге.' },
  { title: 'Красота на выезд', icon: '✂️', text: 'Парикмахер, визажист и другие услуги у клиента.' },
];

const steps = [
  ['1', 'Опишите задачу', 'Выберите категорию или просто расскажите, что нужно сделать.'],
  ['2', 'Мы найдём исполнителя', 'Сервис подбирает подходящего специалиста в вашем городе.'],
  ['3', 'Согласуйте детали', 'Цена, время и условия понятны до начала работы.'],
  ['4', 'Получите результат', 'Исполнитель выполняет задачу, а вы оцениваете работу.'],
];

type RequestSubmitResponse = {
  requestDraftId?: string | null;
  message?: string | string[];
};

export default function HomePage() {
  const [city, setCity] = useState('');
  const [cityPickerOpen, setCityPickerOpen] = useState(true);
  const [requestOpen, setRequestOpen] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const [sent, setSent] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [submitError, setSubmitError] = useState('');
  const [requestDraftId, setRequestDraftId] = useState<string | null>(null);
  const [query, setQuery] = useState('');

  useEffect(() => {
    const saved = window.localStorage.getItem('miruslug-city');
    if (saved && cities.includes(saved)) {
      setCity(saved);
      setCityPickerOpen(false);
    }
  }, []);

  const visibleServices = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return services;
    return services.filter((item) =>
      `${item.title} ${item.text}`.toLowerCase().includes(q),
    );
  }, [query]);

  function chooseCity(value: string) {
    setCity(value);
    window.localStorage.setItem('miruslug-city', value);
    setCityPickerOpen(false);
  }

  async function submitRequest(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setSubmitting(true);
    setSubmitError('');

    const form = event.currentTarget;
    const formData = new FormData(form);

    try {
      const response = await fetch('/api/requests', {
        method: 'POST',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify({
          text: String(formData.get('task') || '').trim(),
          customerName: String(formData.get('name') || '').trim(),
          customerPhone: String(formData.get('phone') || '').trim(),
          city,
        }),
      });

      const payload = await response.json() as RequestSubmitResponse;
      if (!response.ok) {
        const message = Array.isArray(payload.message) ? payload.message.join(', ') : payload.message;
        throw new Error(message || 'Не удалось отправить заявку');
      }

      setRequestDraftId(payload.requestDraftId || null);
      setSent(true);
      form.reset();
    } catch (error) {
      setSubmitError(error instanceof Error ? error.message : 'Не удалось отправить заявку');
    } finally {
      setSubmitting(false);
    }
  }

  function closeRequest() {
    setSent(false);
    setSubmitError('');
    setRequestDraftId(null);
    setRequestOpen(false);
  }

  return (
    <main>
      {cityPickerOpen && (
        <div className="city-gate" style={{ backgroundImage: `linear-gradient(120deg, rgba(20,18,16,.58), rgba(20,18,16,.18)), url(${OLD_ASSET}/glava.jpg)` }}>
          <div className="city-gate-card">
            <div className="brand-mark">Мир Услуг</div>
            <p className="eyebrow">Современная версия сервиса</p>
            <h1>Все услуги города<br />в одном месте</h1>
            <p className="city-gate-copy">Выберите город, чтобы увидеть услуги и оформить заявку.</p>
            <div className="city-buttons">
              {cities.map((item) => (
                <button key={item} onClick={() => chooseCity(item)}>{item}</button>
              ))}
            </div>
          </div>
        </div>
      )}

      <header className="site-header">
        <div className="container header-inner">
          <a className="logo" href="#top">Мир Услуг</a>
          <button className="city-switch" onClick={() => setCityPickerOpen(true)}>
            <span>Город</span>
            <strong>{city || 'Выбрать'}</strong>
          </button>
          <nav className={menuOpen ? 'nav nav-open' : 'nav'}>
            <a href="#services" onClick={() => setMenuOpen(false)}>Услуги</a>
            <a href="#how" onClick={() => setMenuOpen(false)}>Как это работает</a>
            <a href="#provider" onClick={() => setMenuOpen(false)}>Исполнителям</a>
          </nav>
          <a className="phone-link" href="tel:+77182782958">8 (7182) 78-29-58</a>
          <button className="header-cta" onClick={() => setRequestOpen(true)}>Оставить заявку</button>
          <button className="menu-button" aria-label="Меню" onClick={() => setMenuOpen((value) => !value)}>
            <span /><span /><span />
          </button>
        </div>
      </header>

      <section id="top" className="hero" style={{ backgroundImage: `linear-gradient(90deg, rgba(27,22,18,.82) 0%, rgba(27,22,18,.52) 48%, rgba(27,22,18,.12) 100%), url(${OLD_ASSET}/back_top.jpg)` }}>
        <div className="container hero-grid">
          <div className="hero-copy">
            <div className="hero-kicker">Помощь рядом, когда она нужна</div>
            <h1>Не ищите мастера.<br /><span>Опишите задачу.</span></h1>
            <p>Один городской сервис для дома, офиса, автомобиля и повседневных дел.</p>
            <div className="hero-actions">
              <button className="primary-button" onClick={() => setRequestOpen(true)}>Найти исполнителя</button>
              <a className="secondary-button" href="#services">Посмотреть услуги</a>
            </div>
            <div className="hero-points">
              <span>✓ Быстрая заявка</span>
              <span>✓ Проверенные категории</span>
              <span>✓ Работаем по городу</span>
            </div>
          </div>
          <div className="hero-card">
            <p className="eyebrow">Срочно нужна помощь?</p>
            <h2>Расскажите, что случилось</h2>
            <p>Заполните короткую форму. Заявка сразу попадёт в единый MirUslug Inbox и уйдёт на автоматическую классификацию.</p>
            <button className="primary-button full" onClick={() => setRequestOpen(true)}>Оформить заявку</button>
          </div>
        </div>
      </section>

      <section className="quick-search">
        <div className="container quick-search-inner">
          <div>
            <span className="eyebrow">Чем помочь?</span>
            <h2>Найдите нужную услугу</h2>
          </div>
          <label className="search-box">
            <span>⌕</span>
            <input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Например: сантехник, ноутбук, уборка" />
          </label>
        </div>
      </section>

      <section id="services" className="section services-section">
        <div className="container">
          <div className="section-head">
            <div>
              <span className="eyebrow">Популярные услуги</span>
              <h2>Один сервис для разных задач</h2>
            </div>
            <p>Категории восстановлены по старому «Миру Услуг», но представлены как современный каталог без MODX-магии и страниц, живущих своей жизнью.</p>
          </div>
          <div className="service-grid">
            {visibleServices.map((service) => (
              <button className="service-card" key={service.title} onClick={() => setRequestOpen(true)}>
                <span className="service-icon">{service.icon}</span>
                <span className="service-title">{service.title}</span>
                <span className="service-text">{service.text}</span>
                <span className="service-link">Оставить заявку →</span>
              </button>
            ))}
          </div>
          {visibleServices.length === 0 && <div className="empty-search">Ничего не найдено. Опишите задачу в заявке, а не заставляйте себя дружить с каталогом.</div>}
        </div>
      </section>

      <section id="how" className="section how-section">
        <div className="container">
          <div className="section-head light">
            <div>
              <span className="eyebrow">Как это работает</span>
              <h2>От задачи до результата</h2>
            </div>
            <p>Старая версия принимала заявку и обещала перезвонить. Новая версия показывает понятный путь клиента сразу.</p>
          </div>
          <div className="steps-grid">
            {steps.map(([num, title, text]) => (
              <article className="step-card" key={num}>
                <div className="step-num">{num}</div>
                <h3>{title}</h3>
                <p>{text}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="section trust-section">
        <div className="container trust-grid">
          <div className="trust-copy">
            <span className="eyebrow">Мир Услуг, но без 2015 года в интерфейсе</span>
            <h2>Сохраняем идею. Обновляем всё остальное.</h2>
            <p>Оригинальный сервис уже предлагал одну точку входа для десятков бытовых задач. Эта версия сохраняет узнаваемую оранжево-тёмную палитру и прямой сценарий заявки, но получает адаптивность, современную типографику, быстрый поиск и понятные действия.</p>
            <div className="trust-metrics">
              <div><strong>11</strong><span>категорий из старого сервиса</span></div>
              <div><strong>3</strong><span>равноправных канала заявок</span></div>
              <div><strong>1</strong><span>единый inbox и pipeline</span></div>
            </div>
          </div>
          <div className="heritage-card">
            <div className="heritage-badge">2015 → 2026</div>
            <h3>Интерфейс-наследник</h3>
            <p>Оранжевый акцент, крупные заголовки, городская логика и главный принцип «оставьте заявку, мы поможем» сохранились. Остальное отправлено туда, где ему уютнее: в архив.</p>
          </div>
        </div>
      </section>

      <section id="provider" className="provider-section">
        <div className="container provider-grid">
          <div>
            <span className="eyebrow">Исполнителям</span>
            <h2>Получайте заказы в своём городе</h2>
            <p>Для мастеров, сервисов, курьеров, клининга, автоуслуг и других специалистов. Следующий кабинет исполнителя будет работать поверх уже готового распределения и откликов.</p>
          </div>
          <button className="provider-button" onClick={() => setRequestOpen(true)}>Стать исполнителем →</button>
        </div>
      </section>

      <footer className="footer">
        <div className="container footer-grid">
          <div>
            <a className="logo footer-logo" href="#top">Мир Услуг</a>
            <p>Современная Next.js-версия интерфейса сервиса.</p>
          </div>
          <div>
            <strong>Навигация</strong>
            <a href="#services">Услуги</a>
            <a href="#how">Как это работает</a>
            <a href="#provider">Исполнителям</a>
          </div>
          <div>
            <strong>Город</strong>
            <button className="footer-city" onClick={() => setCityPickerOpen(true)}>{city || 'Выбрать город'}</button>
            <a href="tel:+77182782958">8 (7182) 78-29-58</a>
          </div>
        </div>
        <div className="container footer-bottom">© Мир Услуг. Архивная идея, современный интерфейс.</div>
      </footer>

      {requestOpen && (
        <div className="modal-backdrop" onMouseDown={closeRequest}>
          <div className="request-modal" onMouseDown={(e) => e.stopPropagation()}>
            <button className="modal-close" aria-label="Закрыть" onClick={closeRequest}>×</button>
            {!sent ? (
              <>
                <span className="eyebrow">Заявка</span>
                <h2>Что нужно сделать?</h2>
                <p className="modal-copy">Опишите задачу обычными словами. Категорию и услугу сервис определит автоматически.</p>
                <form onSubmit={submitRequest}>
                  <label>Ваше имя<input required name="name" placeholder="Имя" disabled={submitting} /></label>
                  <label>Телефон<input required name="phone" placeholder="+7 7__ ___ __ __" inputMode="tel" disabled={submitting} /></label>
                  <label>Город<select value={city} onChange={(e) => setCity(e.target.value)} required disabled={submitting}><option value="">Выберите город</option>{cities.map((item) => <option key={item}>{item}</option>)}</select></label>
                  <label>Опишите задачу<textarea required name="task" minLength={2} maxLength={5000} rows={4} placeholder="Например: течёт кран, нужен мастер сегодня после 18:00" disabled={submitting} /></label>
                  {submitError && <p className="modal-copy" role="alert">Не удалось отправить: {submitError}</p>}
                  <button className="primary-button full" type="submit" disabled={submitting}>{submitting ? 'Отправляем…' : 'Отправить заявку'}</button>
                </form>
              </>
            ) : (
              <div className="success-state">
                <div className="success-icon">✓</div>
                <h2>Заявка принята</h2>
                <p>Она уже находится в едином inbox и поставлена в очередь на классификацию и подбор исполнителей.</p>
                {requestDraftId && <p className="modal-copy">Номер обработки: {requestDraftId}</p>}
                <button className="primary-button" onClick={closeRequest}>Закрыть</button>
              </div>
            )}
          </div>
        </div>
      )}
    </main>
  );
}
