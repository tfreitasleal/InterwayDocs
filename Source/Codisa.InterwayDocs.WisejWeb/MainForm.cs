﻿using System;
using System.Collections.Generic;
using System.Drawing;
using Codisa.InterwayDocs.Framework;
using MvvmFx.Bindings.Data;
using MvvmFx.CaliburnMicro;
using Wisej.Base;
using Wisej.Web;

namespace Codisa.InterwayDocs
{
    public partial class MainForm : Page, IMainForm
    {
        #region Fields and properties

        private readonly BindingManager _bindingManager = new BindingManager();

        private bool _isBindingSet;

        #endregion

        #region Initializers

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            SetResources();

            foreach (var lang in Languages.LanguageList)
            {
                language.Items.Add(lang.Name);
            }

            language.SelectedIndex = Languages.GetIndexOfUICode(ApplicationContext.UICulture);
        }

        private void language_SelectedIndexChanged(object sender, EventArgs e)
        {
            var uICultureIndex = Languages.GetIndexOfUICode(ApplicationContext.UICulture);

            if (uICultureIndex == language.SelectedIndex)
                return;

            ApplicationContext.UICulture = Languages.LanguageList[language.SelectedIndex].UICode;

            ApplicationBase.Navigate(ApplicationBase.Url + "?lang=" + ApplicationContext.UICulture);
        }

        public void Close()
        {
            ApplicationBase.Exit();
        }

        #endregion

        #region IHaveBusyIndicator implementation

        public BusyIndicator Indicator
        {
            get { return busyIndicator; }
        }

        #endregion

        #region IHaveDataContext implementation

        public event EventHandler<DataContextChangedEventArgs> DataContextChanged = delegate { };

        private MainFormViewModel _viewModel;

        public object DataContext
        {
            get { return _viewModel; }
            set
            {
                if (value != _viewModel)
                {
                    _viewModel = value as MainFormViewModel;
                    DataContextChanged(this, new DataContextChangedEventArgs());
                }
            }
        }

        public void MarkActiveMenuItem(string menuItem)
        {
            switch (menuItem)
            {
                case "IncomingBook":
                    BackColorHelper(SystemColors.MenuHighlight, SystemColors.Control, SystemColors.Control);
                    break;
                case "OutgoingBook":
                    BackColorHelper(SystemColors.Control, SystemColors.MenuHighlight, SystemColors.Control);
                    break;
                case "DeliveryBook":
                    BackColorHelper(SystemColors.Control, SystemColors.Control, SystemColors.MenuHighlight);
                    break;
            }
        }

        private void BackColorHelper(Color incoming, Color outgoing, Color delivery)
        {
            /*openIncomingBook.ForeColor = incoming;
            openOutgoingBook.ForeColor = outgoing;
            openDeliveryBook.ForeColor = delivery;*/
        }

        #endregion

        #region Bind menu items

        public void BindMenuItems(List<Control> namedElements)
        {
            if (_isBindingSet)
                return;

            // Binds the control visible and enabled properties.
            WinFormExtensionMethods.BindComponentProxyProperties(namedElements, _viewModel, _bindingManager);

            _isBindingSet = true;
        }

        #endregion

        #region Translations

        public void RefreshTranslation()
        {
            SetResources();

            language.SelectedIndex = Languages.GetIndexOfUICode(ApplicationContext.UICulture);
        }

        private void SetResources()
        {
            openIncomingBook.Text = "LabelIncoming".GetUiTranslation();
            openOutgoingBook.Text = "LabelOutgoing".GetUiTranslation();
            openDeliveryBook.Text = "LabelDelivery".GetUiTranslation();
            toolsMenuItem.Text = "LabelTools".GetUiTranslation();
            backup.Text = "ToolsBackupLabel".GetUiTranslation();
            restore.Text = "ToolsRestoreLabel".GetUiTranslation();
            export.Text = "ToolsExportlabel".GetUiTranslation();
            import.Text = "ToolsImportLabel".GetUiTranslation();
            helpMenuItem.Text = "LabelHelp".GetUiTranslation();
            about.Text = "LabelAboutApplication".GetUiTranslation();
            pdfManual.Text = "LabelDocumentation".GetUiTranslation();
            languageLabel.Text = "Language".GetUiTranslation();
        }

        #endregion
    }
}